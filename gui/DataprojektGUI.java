/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataprojektgui;

import java.io.File;

import javax.swing.JOptionPane;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.stage.Stage;

/**
 *
 * @author Sievers
 */
public class DataprojektGUI extends Application {
    static {
    	    String jar = FXMLDocumentController.class.getProtectionDomain().getCodeSource().getLocation().getPath();
    		String dll = jar.replace("GUI.jar","GUI_lib/rxtxSerial.dll");
    		String dll2 = "Z:/Git/Dat290/GUI/Necessary files/rxtxSerial.dll";
    	try{
    		System.load(dll2);
    	}catch(Exception e){
    		System.out.println("failed to load dll in " + dll);
    	}catch(UnsatisfiedLinkError e){
    		System.out.println("failed to load dll in " + dll);
    	}
    }
    @Override
    public void start(final Stage stage) throws Exception {
    	
        FXMLLoader l = new FXMLLoader(getClass().getResource("/dataprojektgui/layout.fxml"));
        //Parent root = FXMLLoader.load(getClass().getResource("layout.fxml"));
        Parent root = (Parent)l.load();
        final FXMLDocumentController FXMLController = (FXMLDocumentController)l.getController();
        Scene scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
        // Setting a listener to the scene so we can handle KeyListener actions
        scene.setOnKeyPressed(new EventHandler<KeyEvent>(){
        public void handle(KeyEvent e){
            if(e.getCode() == KeyCode.ENTER){ // Apply changes
                FXMLController.applyButtonPress(new ActionEvent());
            }
            if(e.getCode() == KeyCode.ESCAPE){ // Close the program
                stage.close();
            }
            if(e.getCode() == KeyCode.M){ // Mute
            	FXMLController.mute();
            	FXMLController.applyButtonPress(new ActionEvent());
            }
            if(e.getCode() == KeyCode.R){ // Reset settings
            	FXMLController.reset();
            }
        }
    });
    }
    
      public void KeyPressed(KeyEvent e){
       System.out.println("asd");
   }
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        launch(args);
        
 
    }
}