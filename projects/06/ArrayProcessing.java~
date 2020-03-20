/* ArrayProcessing.java is a driver for method avg().
 *
 * Started by: Prof. Adams, for CS 214 at Calvin College
 * 
 * Project: 06
 * Student Name: Jacob Brink
 * Date: 3/17/2020
 *
 * Precondition: theArray, is an array of double values.
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

