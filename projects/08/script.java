Script started on 2020-04-15 17:17:17-0400
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/java[00m$ cat TemperatureTester.java
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



]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/java[00m$ cat te[K[KTemperature.java
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
	scaleString = scaleString.toUpperCase();
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


]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/java[00m$ javac TemperatureTester.java
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/java[00m$ java TEm[K[KemperatureTester
Enter baseTemp: 
12 F
Enter limitTemp: 
20 F
Enter stepValue in scale F
1
12.000° F	-11.111° C	262.039° K
13.000° F	-10.556° C	262.594° K
14.000° F	-10.000° C	263.150° K
15.000° F	-9.444° C	263.706° K
16.000° F	-8.889° C	264.261° K
17.000° F	-8.333° C	264.817° K
18.000° F	-7.778° C	265.372° K
19.000° F	-7.222° C	265.928° K
20.000° F	-6.667° C	266.483° K
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/java[00m$ java TemperatureTester
Enter baseTemp: 
0 C
Enter limitTemp: 
20 c
Enter stepValue in scale C
5
32.000° F	0.000° C	273.150° K
41.000° F	5.000° C	278.150° K
50.000° F	10.000° C	283.150° K
59.000° F	15.000° C	288.150° K
68.000° F	20.000° C	293.150° K
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/java[00m$ java TemperatureTester
Enter baseTemp: 
20 k
Enter limitTemp: 
10 K
Enter stepValue in scale K
-2
-423.670° F	-253.150° C	20.000° K
-427.270° F	-255.150° C	18.000° K
-430.870° F	-257.150° C	16.000° K
-434.470° F	-259.150° C	14.000° K
-438.070° F	-261.150° C	12.000° K
-441.670° F	-263.150° C	10.000° K
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/java[00m$ java TemperatureTester
Enter baseTemp: 
20 O
The given scale character does not match accepted values
Invalid Temperature
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/java[00m$ java TemperatureTester
Enter baseTemp: 
-200 K
The given temperature is not valid
Invalid Temperature
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/java[00m$ java TemperatureTester
Enter baseTemp: 
-200 C
Enter limitTemp: 
-500 F
The given temperature is not valid
Invalid Temperature
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/08/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/08/java[00m$ exit

Script done on 2020-04-15 17:18:58-0400
