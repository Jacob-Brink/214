/* NameTester.java is a 'driver' to test class Name.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: Jacob Brink
 * Date: 3/20/2020
 * Project: 08
 ************************************************************/

import java.io.*;
import java.util.Scanner;


public class TemperatureTester  
{

    public static Scanner keyboard;
    
    public static void main(String[] args)
    {
	keyboard = new Scanner(System.in);
	Temperature baseTemp, limitTemp;

	//get first temperature
	System.out.println("Enter baseTemp: ");
	try {
	    baseTemp = Temperature.read(keyboard);
	} catch (Exception e) {
	    System.out.println("Invalid Temperature");
	    return;
	}

	//get limit temperature
	System.out.println("Enter limitTemp: ");
	try {
	    limitTemp = Temperature.read(keyboard);
	} catch (Exception e) {
	    System.out.println("Invalid Temperature");
	    return;
	}

	
	System.out.println(String.format("Enter stepValue in scale %s", baseTemp.getScale()));
	double stepValue = keyboard.nextDouble();

	//loop either up or down depending on whether or not stepValue is negative or positive
	while ((stepValue > 0 ? Temperature.lessThan(baseTemp, limitTemp) : Temperature.lessThan(limitTemp, baseTemp)) || baseTemp.equals(limitTemp)) {
	    System.out.println(String.format("%8s\t%8s\t%8s", Temperature.getFahrenheit(baseTemp), Temperature.getCelsius(baseTemp), Temperature.getKelvin(baseTemp)));
	    try {
		baseTemp = baseTemp.raise(stepValue);
	    } catch (Exception e) {
		System.out.println("The change in temperature resulted in an invalid temperature");
		return;
	    };
	}
	    

    }
}



