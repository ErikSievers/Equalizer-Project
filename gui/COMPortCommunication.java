package dataprojektgui;

import gnu.io.*;

import java.io.OutputStream;
import java.util.Enumeration;
import java.util.Scanner;


/**
 *
 * @author Iranzamini
 */

public class COMPortCommunication {
    public SerialPort serialPort;
    private CommPortIdentifier portId = null;
    private static int TIME_OUT = 2000;
    private static final int BAUD_RATE = 9600;
    private OutputStream output;
    Scanner inputName;
    public CommPortIdentifier[] pList = new CommPortIdentifier[4];
    
    public void init(){ // test function
        CommPortIdentifier ports = null;
        Enumeration portEnum = CommPortIdentifier.getPortIdentifiers();
        while(portEnum.hasMoreElements()){
            ports = (CommPortIdentifier)portEnum.nextElement();
            if(ports.getPortType() == CommPortIdentifier.PORT_SERIAL
               &&ports.getName().equals("COM3")){//Hardcoded COM3 (was COM1) to use on my laptop, we should improve this.
                System.out.println("COM port found: " + ports.getName());
                portId = ports;
                break;
            }
        }
        if(portId == null){
            System.out.print("COM port not found :( ");
            System.exit(0);
        }
        
    }
    public static void resetPortList(CommPortIdentifier[] p){ // Removes all elements from the COM port list.
    	for (int i=0;i<4;i++)
    		p[i]=null;
    }
    
    public void refresh(){ // Refreshes the list of COM ports.
    	int counter = 0;
    	resetPortList(pList);
    	CommPortIdentifier ports = null;
        Enumeration portEnum = CommPortIdentifier.getPortIdentifiers();
        while(portEnum.hasMoreElements()){
        	ports = (CommPortIdentifier) portEnum.nextElement();
        	if (ports.getName().contains("COM")){
        		pList[counter] = ports;
        		counter++;
        	}
        }
    }
    
    public boolean connect(CommPortIdentifier p){ // connect to the port p. Returns true if successful, false if not.
    	
    	try{
    	serialPort = (SerialPort) p.open(this.getClass().getName(), TIME_OUT);
    	serialPort.setSerialPortParams(BAUD_RATE, SerialPort.DATABITS_8, SerialPort.STOPBITS_1, SerialPort.PARITY_NONE); // 9600 baud rate, 8 bits, 1 stop bit, no parity bit.
    	output = serialPort.getOutputStream();
    	return true;
    	}catch(PortInUseException e){
    		System.out.println("Port already in use");
                return false;
    	}catch(NullPointerException e2){
    		System.out.println("Port might have disconnected");
                return false;
    	}catch(UnsupportedCommOperationException e3){
    		System.out.println(e3.toString());
                return false;
    	}catch(Exception e){
    		e.toString();
    		return false;
    	}
    }
    
    public void connect(){ // test function
        CommPortIdentifier ports = null;
        Enumeration portEnum = CommPortIdentifier.getPortIdentifiers();
        while(portEnum.hasMoreElements()){
            ports = (CommPortIdentifier)portEnum.nextElement();
            if(ports.getPortType() == CommPortIdentifier.PORT_SERIAL
               &&ports.getName().equals("COM1")){
            	connect(ports);
                break;
            }
        }
        if(portId == null){
            System.out.print("COM port not found :( ");
            System.exit(0);
        }
        
    }
    
    public void sendMsg(String s){ // send a string to the COM port, also used for testing.
    	try{
    	output.write(s.getBytes());
    	}catch(Exception e){
    		System.out.println(e.toString());
    		disconnect();
    	}
    	
    }
    public void send(byte b){
    	byte[] lol = new byte[1];
    	lol[0] =118;
    	try {
			output.write(lol);
		} catch (Exception e){
			e.toString();
			disconnect();
		}
    }
    
    public void send(byte[] b){
    	try {
            output.write(b);
            readFromPort();
            } catch (Exception e){
		e.toString();
		disconnect();
	}
    }
    
    public void disconnect(){ // disconnect from the COM port.
    	if(serialPort!=null){
    		serialPort.close();
    	}
    	serialPort = null;
    }
    
    private void readFromPort(){
        try
        {
            int i = 0;
            int a = serialPort.getInputStream().read();
            while (a!=-1){
                System.out.println(i + " : " + a);
                a = serialPort.getInputStream().read();
                i++;
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    /*public static void main(String[] args){
    	
    	COMPortCommunication COM = new COMPortCommunication();
    	COM.disconnect();
    	COM.refresh();
    	COM.connect(COM.pList[0]);
    	COM.sendMsg("lol");
    	//COM.send((byte)1);
    	//System.out.println((byte)0b01);
    	try{
    	
    	int a = COM.serialPort.getInputStream().read();
    	while (a!=-1){
            System.out.println(a);
            a = COM.serialPort.getInputStream().read();
    	}
    	}catch(Exception e){
    		System.out.println(e.getMessage());
    	}
    	COM.disconnect();
        
    }*/
    
}