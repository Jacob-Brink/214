Script started on 2020-03-20 12:34:06-0500
]0;jacob@DESKTOP-QKT72KA: ~/214/projects/06[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/06[00m$ cat ArrayProcessing.java
/* ArrayProcessing.java is a driver for method avg().
 *
 * Started by: Prof. Adams, for CS 214 at Calvin College
 * 
 * Project: 06
 * Student Name: Jacob Brink
 * Date: 3/17/2020
 *
 * Precondition: size is positive
 * Output: the ArrayProcessing of the numbers in theArray.
 ***************************************************************/

import java.io.*;
import java.util.Scanner;

public class ArrayProcessing
{
    public static Scanner keyboard;
    
  public static void main(String[] args) {
      keyboard = new Scanner(System.in);
      System.out.println("Enter size of array: "); 
      if (keyboard ==null)
	  System.out.println("hello");
      int size = keyboard.nextInt();
      double[] anArray = new double[size];
      arrayFiller(anArray);
      printer(anArray);
  }

  
  /* arrayFiller() is a method that reads user input into the values of the array
   * in an array.
   * Receive: anArray, an array of doubles.
   * Return: void
   **************************************************************/
  public static void arrayFiller(double anArray[]) {
     for (int i = 1; i <= anArray.length; i++) {
	  System.out.println(String.format("Enter value for element %s", i));
	  double value = keyboard.nextDouble();
	  anArray[i-1] = value;
      }
  }
  

  /* printer() is a method that prints the values of the array
   * in an array.
   * Receive: anArray, an array of doubles.
   * Return: void (prints the values separated by new lines)
   **************************************************************/
  public static void printer(double anArray[]) {
      System.out.println("Values you entered are:");
      for (double value : anArray)
	  System.out.println(value);
  }
    
}

]0;jacob@DESKTOP-QKT72KA: ~/214/projects/06[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/06[00m$ javac ArrayProcessing.java 
]0;jacob@DESKTOP-QKT72KA: ~/214/projects/06[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/06[00m$ java ArrayProcessing 
Enter size of array: 
5
Enter value for element 1
1
Enter value for element 2
5
Enter value for element 3
2
Enter value for element 4
3
Enter value for element 5
4
Values you entered are:
1.0
5.0
2.0
3.0
4.0
]0;jacob@DESKTOP-QKT72KA: ~/214/projects/06[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/06[00m$ java ArrayProcessing 
Enter size of array: 
0
Values you entered are:
]0;jacob@DESKTOP-QKT72KA: ~/214/projects/06[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/06[00m$ java ArrayProcessing 
Enter size of array: 
-1
Exception in thread "main" java.lang.NegativeArraySizeException: -1
	at ArrayProcessing.main(ArrayProcessing.java:26)
]0;jacob@DESKTOP-QKT72KA: ~/214/projects/06[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/06[00m$ exit

Script done on 2020-03-20 12:34:40-0500
