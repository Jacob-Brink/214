/* RectangleArea.java calculates the area of a Rectangle
 *
 * Input: The width and height of a rectangle
 * Precondition: Width and height are positive
 * Output: The area of the rectangle
 *
 * Begun by: Dr. Adams, for CS 214, at Calvin College.
 * Completed by: Jacob Brink
 * Date: 2/6/2020
 **********************************************************/


import java.util.Scanner;  // include class for Scanner

public class RectangleArea {
    
     /* function rectangleArea() computes a rectangle's area, given its width and height.
      * Parameter: width and height, doubles
      * Precondition: width and height are positive
      * Returns: the area of the rectangle
      */
    public static double rectangleArea(double width, double height) {
        return width * height;               // return an expression
     } // rectangleArea method
	
  // main program
  public static void main(String[] args) {
      // prompt for width and height
      System.out.println("\n\nTo compute the area of a rectangle,");

      // Create a connection named keyboard to standard in
      Scanner keyboard = new Scanner(System.in);

      //Get width
      System.out.print(" enter its width: ");
      double width = keyboard.nextDouble();

      //Get height
      System.out.print(" enter its height: ");
      double height = keyboard.nextDouble();
      
      // output area
      System.out.println("\nThe area is " + rectangleArea(width, height) + "\n");
      System.out.printf("The area is %f\n\n", rectangleArea(width, height));
      System.out.printf("The area is %.15f\n\n", rectangleArea(width, height));
  } // main method

} // class RectangleArea

