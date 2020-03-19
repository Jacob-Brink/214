Script started on 2020-02-26 22:29:35-0500
]0;jpb34@gold15: ~/Documents/214/projects/03[01;32mjpb34@gold15[00m:[01;34m~/Documents/214/projects/03[00m$ javac Selection.java
]0;jpb34@gold15: ~/Documents/214/projects/03[01;32mjpb34@gold15[00m:[01;34m~/Documents/214/projects/03[00m$ java Selection 
Running tests...
Asserting getLetter(100) equals A
Success
Asserting getLetter(95) equals A
Success
Asserting getLetter(90) equals A
Success
Asserting getLetter(85) equals B
Success
Asserting getLetter(80) equals B
Success
Asserting getLetter(75) equals C
Success
Asserting getLetter(70) equals C
Success
Asserting getLetter(65) equals D
Success
Asserting getLetter(60) equals D
Success
Asserting getLetter(55) equals F
Success
Asserting getLetter(30) equals F
Success
]0;jpb34@gold15: ~/Documents/214/projects/03[01;32mjpb34@gold15[00m:[01;34m~/Documents/214/projects/03[00m$ cat Selection.java
/* Selection.java computes the letter grade given a student's average grade
 *
 * Input: percent grade
 * Precondition: percent grade is nonnegative and not above 100
 * Output: letter grade
 *
 * Begun by: Dr. Adams, for CS 214, at Calvin College.
 * Completed by: Jacob Brink
 * Date: 2/26/2020
 * Project: 03
 **********************************************************/


import java.util.Scanner;  // include class for Scanner

public class Selection {

     /* function getLetter computes the letter grade
      * Parameter: average, an integer
      * Precondition: average is nonnegative and not above 100
      * Returns: letter in string format
      */
     public static String getLetter(int average) {
	 switch(average / 10) {
	 case 10:
	     return "A";
	 case 9:
	     return "A";
	 case 8:
	     return "B";
	 case 7:
	     return "C";
	 case 6:
	     return "D";
	 default:
	     return "F";
	 }
     }


     /* function testGetLetter outputs clearly what is being tested and whether or not the test passed
      * Parameter: inputAverage (integer), expectedOutput (String)
      * Precondition: inputAverage is not negative and not greater than 100
      * Returns: void
      */
    public static void testGetLetter(int inputAverage, String expectedOutput) {
	System.out.println("Asserting getLetter(" + inputAverage + ") equals " + expectedOutput);
	if (getLetter(inputAverage) == expectedOutput)
	    System.out.println("Success");
	else
	    System.out.println("Fail");
    }

     /* function runTests runs tests on getLetter method
      * Parameter: none
      * Precondition: none
      * Returns: void
      */
    public static void runTests() {
	System.out.println("Running tests...");
	testGetLetter(100, "A");
	testGetLetter(95, "A");
	testGetLetter(90, "A");
	testGetLetter(85, "B");
	testGetLetter(80, "B");
	testGetLetter(75, "C");
	testGetLetter(70, "C");
	testGetLetter(65, "D");
	testGetLetter(60, "D");
	testGetLetter(55, "F");
	testGetLetter(30, "F");
    }
	
  // main program
  public static void main(String[] args) {
      runTests();
  } // main method

} // class CircleArea

]0;jpb34@gold15: ~/Documents/214/projects/03[01;32mjpb34@gold15[00m:[01;34m~/Documents/214/projects/03[00m$ exit

Script done on 2020-02-26 22:30:40-0500
