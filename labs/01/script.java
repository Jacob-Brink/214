Script started on 2020-02-06 12:37:47-0500
]0;jpb34@gold33: ~/Documents/214/labs/01[01;32mjpb34@gold33[00m:[01;34m~/Documents/214/labs/01[00m$ cat CircleArea.java
/* CircleArea.java computes the area of a circle.
 *
 * Input: The radius of the circle.
 * Precondition: The radius is a positive number.
 * Output: The area of the circle.
 *
 * Begun by: Dr. Adams, for CS 214, at Calvin College.
 * Completed by: Jacob Brink
 * Date: 2/6/2020
 **********************************************************/


import java.util.Scanner;  // include class for Scanner

public class CircleArea {

     /* function circleArea() computes a circle's area, given its radius.
      * Parameter: r, a double
      * Precondition: r is not negative.
      * Returns: the area of the circle
      */
     public static double circleArea(double r) {
        return Math.PI * r * r;               // return an expression
     } // circleArea method
	
  // main program
  public static void main(String[] args) {
      // prompt for radius
      System.out.println("\n\nTo compute the area of a circle,");
      System.out.print(" enter its radius: ");

      // Create a connection named keyboard to standard in
      Scanner keyboard = new Scanner(System.in);

      //Get the number from the user
      double radius = keyboard.nextDouble();

      // output area
      System.out.println("\nThe area is " + circleArea(radius) + "\n");
      System.out.printf("The area is %f\n\n", circleArea(radius));
      System.out.printf("The area is %.15f\n\n", circleArea(radius));
  } // main method

} // class CircleArea

]0;jpb34@gold33: ~/Documents/214/labs/01[01;32mjpb34@gold33[00m:[01;34m~/Documents/214/labs/01[00m$ javac -  deprecation CircleArea.java
]0;jpb34@gold33: ~/Documents/214/labs/01[01;32mjpb34@gold33[00m:[01;34m~/Documents/214/labs/01[00m$ java I CircleArea 


To compute the area of a circle,
 enter its radius: 1

The area is 3.141592653589793

The area is 3.141593

The area is 3.141592653589793

]0;jpb34@gold33: ~/Documents/214/labs/01[01;32mjpb34@gold33[00m:[01;34m~/Documents/214/labs/01[00m$ java CircleArea 


To compute the area of a circle,
 enter its radius: 2

The area is 12.566370614359172

The area is 12.566371

The area is 12.566370614359172

]0;jpb34@gold33: ~/Documents/214/labs/01[01;32mjpb34@gold33[00m:[01;34m~/Documents/214/labs/01[00m$ java CircleArea 


To compute the area of a circle,
 enter its radius: 2.5

The area is 19.634954084936208

The area is 19.634954

The area is 19.634954084936208

]0;jpb34@gold33: ~/Documents/214/labs/01[01;32mjpb34@gold33[00m:[01;34m~/Documents/214/labs/01[00m$ java CircleArea 


To compute the area of a circle,
 enter its radius: 4.99999

The area is 78.53950218079365

The area is 78.539502

The area is 78.539502180793650

]0;jpb34@gold33: ~/Documents/214/labs/01[01;32mjpb34@gold33[00m:[01;34m~/Documents/214/labs/01[00m$ exit
exit

Script done on 2020-02-06 12:39:03-0500
