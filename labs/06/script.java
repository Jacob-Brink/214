Script started on 2020-03-20 09:12:22-0500
]0;jacob@DESKTOP-QKT72KA: ~/214/labs/06[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/06[00m$ cat Average.java
/* Average.java is a driver for method avg().
 *
 * Started by: Prof. Adams, for CS 214 at Calvin College
 *
 * Student Name: Jacob Brink
 * Date: 3/17/2020
 *
 * Precondition: theArray, is an array of double values.
 * Output: the average of the numbers in theArray.
 ***************************************************************/

import java.io.*;

public class Average
{
  public static void main(String[] args) {

      double[] array1 = {9.0, 8.0, 7.0, 6.0};
      double[] array0 = new double[0];

      // output the average of the values in the arrays
      System.out.println("The first average is " + avg(array0));
      System.out.println("The second average is " + avg(array1));
  }
  

  /* sum() is a method that computes the sum of all the values
   * in an array of doubles.
   * Receive: anArray, an array of doubles.
   * Return: the sum of the values in anArray.
   ************************************************************/

    public static double sum(double[] numbers) {
	double total = 0.0;
	for (int i = 0; i < numbers.length; i++){
	    total += numbers[i];
	}
	return total;
    }
  

  /* avg() is a method that computes the average of the values
   * in an array.
   * Receive: anArray, an array of doubles.
   * Return: the average of the values in anArray.
   **************************************************************/

    public static double avg(double[] numbers)  {
	if (numbers == null || numbers.length <= 0)
        return 0.0;
     else
        return sum(numbers) / numbers.length;
    }
    
}

]0;jacob@DESKTOP-QKT72KA: ~/214/labs/06[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/06[00m$ javac Average.java
]0;jacob@DESKTOP-QKT72KA: ~/214/labs/06[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/06[00m$ java Average
The first average is 0.0
The second average is 7.5
]0;jacob@DESKTOP-QKT72KA: ~/214/labs/06[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/06[00m$ exit

Script done on 2020-03-20 09:12:45-0500
