/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataprojektgui;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.control.*;
import gnu.io.*;
import java.awt.event.KeyEvent;
import java.io.File;
import javafx.scene.layout.AnchorPane;


/**
 *
 * @author Sievers
 */
public class FXMLDocumentController implements Initializable {
    static COMPortCommunication com;
    private static boolean samePort;
    private static CommPortIdentifier tempPort;
    @FXML
    private Label echoLabel;
    @FXML
    private Label delayLabel;
    @FXML
    private Slider base;
    @FXML
    private Slider middle;
    @FXML
    private Slider treble;
    @FXML
    private Slider echoDecay;
    @FXML
    private CheckBox echo;
    @FXML
    private TextField delay;
    @FXML
    private CheckBox mute;
    @FXML
    private ChoiceBox list;
    @FXML
    private Button refresh;
    @FXML
    private CheckBox inputBased;
    @FXML
    private CheckBox outputBased;
    @FXML
    private AnchorPane anchorpane;
    @FXML
    private TextField baseLimit;
    @FXML
    private TextField trebleLimit;
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        com=new COMPortCommunication();
        samePort=true;
        refreshList(new ActionEvent());
        echoInputBased();
    }
    
    
    /*Called when the refresh button is pressed. The method gets up to four
    available com ports and prints them to the ChoiceBox (the drop-down menu)
    list.
    */
    @FXML
    private void refreshList(ActionEvent event){
        try{
            com.refresh();
            list.getItems().clear();
            for (CommPortIdentifier p : com.pList){
                if(p!=null)
                    list.getItems().add(p.getName());
            }
        }catch(Exception e){
            System.out.println(e.toString());
            com.disconnect();
        }
       samePort = false;
       tempPort = null;
    }
    
    /*Called when the apply button is pressed. The method writes the values in
    the GUI to the com port selected in the ChoiceBox list.
    */
    @FXML    
    public void applyButtonPress(ActionEvent event) {
        //Connects to a port
        try{
            if(!samePort && list.getValue() != null){
                for(int i=0;i<4;i++)
                {
                    if(com.pList[i]!=null)
                    {
                        if(com.pList[i].getName() == list.getValue()){
                            tempPort = com.pList[i];
                            com.disconnect();
                            com.connect(tempPort);        
                        }        
                    }
                samePort = true;    
                }       
            }
            if(tempPort!=null){
                System.out.println(tempPort.getName());
            }
            
        //Reads values from the GUI and writes to the port.
            byte[] returnArray = getGUIValues();
            System.out.println("----READING FROM PORT IN APPLYBUTTONACTION----");
            com.send(returnArray);
        //Reads values from the port.
            
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        System.out.println("----END OF METHOD APPLYBUTTONACTION----");   
        System.out.println("");
        
    }
    
    //Returns the values in the GUI as an array.
   private byte[] getGUIValues(){
       //We are using 16bit integers on the microcontroller but can only send
       //8 bits at a time. Because of this the values will often be divided by
       //256. 
       
       byte [] returnArray = new byte[14];//This is the array the method returns.
        
        if (mute.isSelected())//If mute is selected, there is no need to calculate
            //other values.
        {
            returnArray[10]=-128;
        }
        
        else//If mute is not selected, we calculate the other values.
        {
            int value;//Used as a temporary variable to make code more readable.
            
            //Calculating the base gain in mDb.
            value=(int)(base.getValue())*1000;
            returnArray[0] = (byte)(value/256);
            returnArray[1] = (byte)(value);

            //Calculating the middle gain in mDb.
            value=(int)(middle.getValue())*1000;
            returnArray[2] = (byte)(value/256);
            returnArray[3] = (byte)(value);

            //Calculating the treble gain in mDb.
            value=(int)(treble.getValue())*1000;
            returnArray[4] = (byte)(value/256);
            returnArray[5] = (byte)(value);
            
            //Calculating the base upper limit.
            int baseLim;
            try
            {
                baseLim = Integer.parseInt(baseLimit.getText());
            }
            catch(NumberFormatException e)
            {
                System.out.println("The base limit could not be parsed. It "
                        + "has been set to 200hz.");
                baseLim=200;
            }
            
            returnArray[6]=(byte)(baseLim/256);
            if((baseLim%256) > 0b0111_1111)
            {
                //Java does not support unsigned types. If any value is greater
                //than 127, it cannot fit into a byte. If this is the case,
                //we subtract 256 to set the highest bit.
                returnArray[7]=(byte)((baseLim%256)-256);
            }
            else
            {
                returnArray[7]=(byte)(baseLim%256);
            }                

            //Calculating the treble lower limit
            int trebleLim;
            try
            {
                trebleLim = Integer.parseInt(trebleLimit.getText());
            }
            catch(NumberFormatException e)
            {
                System.out.println("The treble limit could not be parsed. It "
                        + "has been set to 1500hz.");
                trebleLim=1500;
            }
            
            returnArray[8]=(byte)(trebleLim/256);
            if((trebleLim%256) > 0b0111_1111)
            {
            //Java does not support unsigned types. If any value is greater
            //than 127, it cannot fit into a byte. If this is the case,
            //we subtract 256.
                returnArray[9]=(byte)((trebleLim%256)-256);
            }
            else
            {
                returnArray[9]=(byte)(trebleLim%256);
            }

            //The echo and mute functions are handled below.
            if (echo.isSelected())
            {
                //If the echo is enabled, we set bit7.
                returnArray[10]=0b01000000;
                if(inputBased.isSelected())
                {
                    //If the echo is selected to be input based, we set
                    //bit6...
                    returnArray[10]+=0b00100000;
                }
                else
                {
                    //...else we clear it.
                    returnArray[10]+=0b00000000;
                }

                //Calculating the delay of the echo.
                //If the delay is greater than 850, we set it to 850 since the
                //memory cannot support more than roughly 865ms.
                int echoDelay;
                try
                {
                    echoDelay = Integer.parseInt(delay.getText());
                    echoDelay = (echoDelay<850) ? echoDelay : 850;
                }
                catch(NumberFormatException e)//If we have a parsing error, we
                    //set the delay to 850hz.
                {
                    System.out.println("The delay on echo could not be parsed."
                            + "Delay has been set to 200ms.");
                    echoDelay = 200;
                }
                
                returnArray[10]+=(byte)(echoDelay/256);    
                if((echoDelay%256)>127)
                {    
                    returnArray[11]=(byte)((echoDelay%256)-256);
                }
                else
                {
                    returnArray[11]=(byte)(echoDelay%256);
                }
                
                //The decay of the echo is calculated here.
                int decay=(int)(echoDecay.getValue()*0x8000);
                returnArray[12]=(byte)(decay/256);
                if((decay%256)>127)
                {    
                    returnArray[13]+=(byte)(decay%256-256);
                }
                else
                {
                    returnArray[13]+=(byte)(decay%256);
                }
            }
            else
            //If echo is disabled, all the values related to the echo are 0.
            {
                returnArray[10]=0;
                returnArray[11]=0;
                returnArray[12]=0;
                returnArray[13]=0;
            }
        }
        //Print is here for verification purposes.
        for(int i = 0; i<14;i++)
        {
            System.out.println(i + " : " + returnArray[i]+"");
        }
        return returnArray;
   }
   
   //Called when the checkbox labeled "Input Based" is toggled. The method
   //toggles the checkbox labeled "Output Based" so that only one box can be
   //checked at a time.
   @FXML
   public void echoInputBased(){    
        inputBased.setSelected(true);
        outputBased.setSelected(false);
   }
   
   //Called when the checkbox labeled "Output Based" is toggled. The method
   //toggles the checkbox labeled "Input Based" so that only one box can be
   //checked at a time.
   @FXML
   private void echoOutputBased(){
            inputBased.setSelected(false);
            outputBased.setSelected(true);
   }
   //Called when the echo box is checked/unchecked. The method disables all
   //components related to the echo when the checkbox labeled "Echo" is unchecked.
   @FXML
   public void echoToggle(){
       if(echo.isSelected()){
           inputBased.setDisable    (false);
           outputBased.setDisable   (false);
           delay.setDisable         (false);
           echoDecay.setDisable     (false);
           echoLabel.setDisable     (false);
           delayLabel.setDisable    (false);
       }
       if(!echo.isSelected()){
           inputBased.setDisable    (true);
           outputBased.setDisable   (true);
           delay.setDisable         (true);
           echoDecay.setDisable     (true);
           echoLabel.setDisable     (true);
           delayLabel.setDisable    (true);
       }
   }
   
   public void mute(){
	   if(mute.isSelected()){
		   mute.setSelected(false);
	   }else{
		   mute.setSelected(true);
	   }
   }
   
   public void reset(){
	   base.setValue(0);
	   middle.setValue(0);
	   treble.setValue(0);
	   
	   echo.setSelected(false);
	   echoToggle();
	   echoInputBased();
	   delay.setText(null);
	   echoDecay.setValue(0);
	   
	   baseLimit.setText(null);
	   trebleLimit.setText(null);
   }
}
