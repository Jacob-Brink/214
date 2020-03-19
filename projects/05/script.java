Script started on 2020-03-12 20:54:01-0400
]0;jpb34@gold01: ~/Documents/214/projects/05[01;32mjpb34@gold01[00m:[01;34m~/Documents/214/projects/05[00m$ javac Roots.java 
]0;jpb34@gold01: ~/Documents/214/projects/05[01;32mjpb34@gold01[00m:[01;34m~/Documents/214/projects/05[00m$ j java Roots 

Enter A: 
1

Enter B: 
1

Enter C: 
1

*** quadraticRoots(): b^2 - 4ac is negative!
The given parameters do not yield roots
]0;jpb34@gold01: ~/Documents/214/projects/05[01;32mjpb34@gold01[00m:[01;34m~/Documents/214/projects/05[00m$ java Roots 

Enter A: 
0

Enter B: 
1

Enter C: 
1

*** QuadraticRoots(): a is zero!
The given parameters do not yield roots
]0;jpb34@gold01: ~/Documents/214/projects/05[01;32mjpb34@gold01[00m:[01;34m~/Documents/214/projects/05[00m$ java Roots 

Enter A: 
2

Enter B: 
5

Enter C: 
3
The roots are -1.0 and -1.5
]0;jpb34@gold01: ~/Documents/214/projects/05[01;32mjpb34@gold01[00m:[01;34m~/Documents/214/projects/05[00m$ jav   cat Roots.. java
/* Root.java is a class and program that calculates roots if given quadratic parameters are valid
 * 
 * Begun by: Serita Nelesen
 * Completed by: Jacob Brink
 * Date: 3/11/2020
 * Project: 5
 ***************************************************************/

import java.util.Scanner;
import java.lang.Math;

// java class Split
public class Roots
{

  // main program
  public static void main(String[] args)
    {
      Scanner keyboard = new Scanner(System.in);
      // prompt for the string
      System.out.println("\nEnter A: ");
      double a = keyboard.nextDouble();

      System.out.println("\nEnter B: ");
      double b = keyboard.nextDouble();

      System.out.println("\nEnter C: ");
      double c = keyboard.nextDouble();

      double[] roots = new double[2];
      if (rooter(a, b, c, roots))
	  System.out.println(String.format("The roots are %s and %s", roots[0], roots[1]));
      else
	  System.out.println("The given parameters do not yield roots");
      
    }
  
  /* rooter() returns true for valid quadratic input, false else and modifies the given int array with the roots
   * Receive: 	a, b, c, and an integer array of size 2 that will store the results if valid
   *****************************************************/
    public static boolean rooter(double a, double b, double c, double[] roots) {

	int root1,root2;

	if (a != 0) {

	    double arg = Math.pow(b, 2.0) - 4 * a * c;

	    if (arg >= 0) {
		roots[0] = (-b + Math.sqrt(arg))/(2*a);
		roots[1] = (-b - Math.sqrt(arg))/(2*a);
		return true;
	    } else {
		System.out.println("\n*** quadraticRoots(): b^2 - 4ac is negative!");
		roots[0] = roots[1] = 0.0;
		return false;
	    }
	} else {
	    System.out.println("\n*** QuadraticRoots(): a is zero!");
	    roots[0] = roots[1] = 0.0;
	    return false;
	}
    }


}
]0;jpb34@gold01: ~/Documents/214/projects/05[01;32mjpb34@gold01[00m:[01;34m~/Documents/214/projects/05[00m$ exit

Script done on 2020-03-12 20:56:35-0400
