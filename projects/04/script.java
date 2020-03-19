Script started on 2020-02-28 15:22:18-0500
]0;jpb34@maroon15: ~/Documents/214/projects/04[01;32mjpb34@maroon15[00m:[01;34m~/Documents/214/projects/04[00m$ cat Factorial.java
/* Factorial.java displays a table of logarithms.
 *
 * Input: start, stop and increment, three doubles.
 * PRE: start < stop && increment > 0.
 * Output: A table of logarithms from start to stop,
 *         with increment as the step value.
 * Begun by: Nelesen, for CS 214 at Calvin College.
 * Completed by: Jacob Brink
 * Project: 4
 * Date: 2/28/2020
 ********************************************************/
import java.util.Scanner; 		// Get input

class Factorial{

    public static double factorial(double n) {
	double answer = 1.0;
	for (int i = 2; i <=n; i++) {
	    answer *= i;
	}
	return answer;	
    }
    
  public static void main(String[] args){
    Scanner keyboard = new Scanner(System.in);
    System.out.println("Enter a number: ");
    double n = keyboard.nextDouble();
    System.out.println(String.format("The factorial for %s is %s", n, factorial(n)));
  }
}

]0;jpb34@maroon15: ~/Documents/214/projects/04[01;32mjpb34@maroon15[00m:[01;34m~/Documents/214/projects/04[00m$ javac Factorial.java
]0;jpb34@maroon15: ~/Documents/214/projects/04[01;32mjpb34@maroon15[00m:[01;34m~/Documents/214/projects/04[00m$ ./  java Factorial
Enter a number: 
4
The factorial for 4.0 is 24.0
]0;jpb34@maroon15: ~/Documents/214/projects/04[01;32mjpb34@maroon15[00m:[01;34m~/Documents/214/projects/04[00m$ java Factorial
Enter a number: 
5
The factorial for 5.0 is 120.0
]0;jpb34@maroon15: ~/Documents/214/projects/04[01;32mjpb34@maroon15[00m:[01;34m~/Documents/214/projects/04[00m$ exit

Script done on 2020-02-28 15:22:57-0500
