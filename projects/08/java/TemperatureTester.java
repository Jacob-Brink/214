/* NameTester.java is a 'driver' to test class Name.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: Jacob Brink
 * Date: 3/20/2020
 * Project: 07
 ************************************************************/

import java.io.*;
import java.util.Scanner;


public class NameTester  
{

    public static Scanner keyboard;
    
    
    public static void main(String[] args)
    {
	keyboard = new Scanner(System.in);


	System.out.println("Enter baseTemp: ");
	Temperature baseTemp = Temperature.read(keyboard);


	System.out.println("Enter limitTemp: ");
	Temperature limitTemp = Temperature.read(keyboard);

	
	System.out.println(String.format("Enter stepValue in scale %s", baseTemp.getScale.toString()));
	double stepValue = keyboard.nextDouble();

	while (Temperature.lessThan(baseTemp, limitTemp)) {
	    System.out.println(String.format("%s\t%s\t%s", Temperature.getFahrenheit(baseTemp), Temperature.getCelsius(baseTemp), Temperature.getKelvin(baseTemp)));
	    baseTemp = baseTemp.raise(stepValue);
	}
	    

    }
}



