/* Temperature.java is a class representing Temperature
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: Jacob Brink
 * Date: 4/15/2020
 * Project: 08
 ************************************************************/

import java.io.*;
import java.util.Scanner;
import java.util.HashMap;

public class Temperature
{
    private static enum Scale {
	F, C, K	
    }

    private static HashMap<Scale, Double> scaleMinTemp;
    private static HashMap<Scale, ThrowingFunction<Temperature, Temperature>> otherToKelvin;
    private static HashMap<Scale, ThrowingFunction<Temperature, Temperature>> kelvinToOther;

    /* static runs code for static methods on first use
     * @precondition: none
     * @postcondition: scaleMinTemp, otherToKelvin, and kelvinToOther are populated
     */
    static {
	//set minimum temperatures
	scaleMinTemp = new HashMap<>();
	scaleMinTemp.put(Scale.F, (-459.67));
	scaleMinTemp.put(Scale.C, (-273.15));
	scaleMinTemp.put(Scale.K, 0.0);

	//A little hacky, but makes for clean code later XD
	//sets functions for converting from other to Kelvin
	otherToKelvin = new HashMap<>();
	otherToKelvin.put(Scale.F, (fahrenheitTemp) -> {
		return new Temperature((fahrenheitTemp.getDegrees() + 459.67) * 5/9, "K"); 
	    });
	otherToKelvin.put(Scale.C, (celsiusTemp) -> {
		return new Temperature((celsiusTemp.getDegrees() + 273.15), "K");
	    });
	otherToKelvin.put(Scale.K, (kelvinTemp) -> {
		return kelvinTemp;
	    });

	//sets functions for converting from kelvin to other
	kelvinToOther = new HashMap<>();
	kelvinToOther.put(Scale.F, (kelvin) -> {
		return new Temperature((kelvin.getDegrees() - 273.15) * 9/5 + 32, "F");
	    });
	kelvinToOther.put(Scale.C, (kelvin) -> {
		return new Temperature((kelvin.getDegrees() - 273.15), "C");
	    });
	kelvinToOther.put(Scale.K, (kelvin) -> {
		return kelvin;
	    });
	
    }

    private Scale scale;
    private double degrees;

    /* Temperature constructs a temperature object
     * @precondition: none
     * @returns: Temperature object if valid, else throws exception
     */    
    public Temperature(final double degrees, String scaleString) throws Exception {
	if (!isValid(degrees, scaleString))
	     throw new Exception("Parameters create an invalid temperature");
	    	    
	this.scale = Scale.valueOf(scaleString);
	this.degrees = degrees;
    }

    /* getScale()
     * @precondition: none
     * @returns: scale
     */    
    public Scale getScale() {
	return this.scale;
    }

    /* getDegrees()
     * @precondition: none
     * @returns: degrees
     */    
    public double getDegrees() {
	return this.degrees;
    }
    
    /* convertTemp converts temperature to any other scale
     * @precondition: none
     * @returns: same temperature with different scale
     */
    private static Temperature convertTemp(Temperature original, Scale newTemperatureScale) {
	try {
	    Temperature kelvinTemp = otherToKelvin.get(original.getScale()).apply(original);
	    Temperature newTemp = kelvinToOther.get(newTemperatureScale).apply(kelvinTemp);
	    return newTemp;
	} catch (Exception e) {
	    //This should never run since the original temperature is valid
	    return null;
	}
    }

    /* getFahrenheit gets Fahrenheit value of temperature
     * @precondition: none
     * @returns: new Temperature with same value in different scale
     */
    public static Temperature getFahrenheit(Temperature original) {
	return convertTemp(original, Scale.F);
    }

    /* getCelsius gets Celsius value of temperature
     * @precondition: none
     * @returns: new Temperature with same value in different scale
     */    
    public static Temperature getCelsius(Temperature original) {
	return convertTemp(original, Scale.C);
    }

    /* getKelvin gets Kelvin value of temperature
     * @precondition: none
     * @returns: new Temperature with same value in different scale
     */    
    public static Temperature getKelvin(Temperature original) {
	return convertTemp(original, Scale.K);
    }

    /* read reads and returns new Temperature
     * @precondition: none
     * @returns: new Temperature with same value in different scale
     *           if Temperature is invalid, throws exception
     */    
    public static Temperature read(Scanner scanner) throws Exception {
	String rawString = scanner.nextLine();
	String[] pieces = rawString.split(" ");
	double degrees = Double.parseDouble(pieces[0]);
	return new Temperature(degrees, pieces[1]);
    }

    /* raise raises temperature
     * @precondition: none
     * @returns: new Temperature with same degrees + delta
     *           if Temperature is invalid, throws exception
     */    
    public Temperature raise(double delta) throws Exception {
	return new Temperature(this.degrees + delta, scale.toString());
    }

    /* lower lowers temperature
     * @precondition: none
     * @returns: new Temperature with same degrees - delta
     *           if Temperature is invalid, throws exception
     */    
    public Temperature lower(double delta) throws Exception {
	return new Temperature(this.degrees - delta, scale.toString());
    }

    /* equals overrides equals operator
     * @precondition: none
     * @returns: true if equal, else false
     */    
    @Override
    public boolean equals(Object o) {
	if (o instanceof Temperature)
	    return Double.valueOf(getKelvin((Temperature) o).getDegrees()).equals(getKelvin(this).getDegrees());
	return false;
    }

    /* lessthan()
     * @precondition: none
     * @returns: true if left is less than, else false
     */    
    public static boolean lessThan(Temperature left, Temperature right) {
	return getKelvin(left).getDegrees() < getKelvin(right).getDegrees();
    }

    /* toString overrides stringify operation
     * @precondition: none
     * @returns: nicely formatted string
     */    
    @Override
    public String toString() {
	return String.format("%.3f° %s", this.degrees, this.scale.toString());
    }

    /* isValid checks if parameters and temperature is valid
     * @precondition: none
     * @returns: true if valid, else false
     */    
    public static boolean isValid(final double degrees, String scaleChar) {

	//check Scale type
	Scale scale;
	try {
	    scale = Scale.valueOf(scaleChar.toUpperCase());
	} catch (Exception e) {
	    System.out.println("The given scale character does not match accepted values");
	    return false;
	}

	
	//check that temperature is not below absolute zero
	if (degrees < scaleMinTemp.get(scale)) {
	    System.out.println("The given temperature is not valid");
	    return false;
	}
	
	
	return true;
	
    } 
    
}


