Script started on 2020-02-27 16:10:13-0500
]0;jpb34@cs-ssh: ~/Documents/214/labs/04jpb34@cs-ssh:~/Documents/214/labs/04$ cat LogTable.java



/* LogTable.java displays a table of logarithms.
 *
 * Input: start, stop and increment, three doubles.
 * PRE: start < stop && increment > 0.
 * Output: A table of logarithms from start to stop,
 *         with increment as the step value.
 * Begun by: Nelesen, for CS 214 at Calvin College.
 * Completed by: Jacob Brink
 * Lab: 4
 * Date: 2/28/2020
 ********************************************************/
import java.util.Scanner; 		// Get input

class LogTable{

  public static void main(String[] args){
    Scanner keyboard = new Scanner(System.in);
    System.out.println("To display a table of logarithms,");
    System.out.println("enter the start, stop and increment values: ");
    double start, stop, increment;
    start = keyboard.nextDouble();
    stop = keyboard.nextDouble();
    increment = keyboard.nextDouble();

    double counter = start;
    while (counter <= stop) {
	System.out.println(String.format("The logarithm of %s is %s", counter, Math.log10(counter)));
	counter += increment;
    }

  }
}

]0;jpb34@cs-ssh: ~/Documents/214/labs/04jpb34@cs-ssh:~/Documents/214/labs/04$ javac LogTable.java
]0;jpb34@cs-ssh: ~/Documents/214/labs/04jpb34@cs-ssh:~/Documents/214/labs/04$ java l LogTable
To display a table of logarithms,
enter the start, stop and increment values: 
1
2
.5
The logarithm of 1.0 is 0.0
The logarithm of 1.5 is 0.17609125905568124
The logarithm of 2.0 is 0.3010299956639812
]0;jpb34@cs-ssh: ~/Documents/214/labs/04jpb34@cs-ssh:~/Documents/214/labs/04$ java LogTable
To display a table of logarithms,
enter the start, stop and increment values: 
0 1
20  40
2
The logarithm of 1.0 is 0.0
The logarithm of 3.0 is 0.47712125471966244
The logarithm of 5.0 is 0.6989700043360189
The logarithm of 7.0 is 0.8450980400142568
The logarithm of 9.0 is 0.9542425094393249
The logarithm of 11.0 is 1.0413926851582251
The logarithm of 13.0 is 1.1139433523068367
The logarithm of 15.0 is 1.1760912590556813
The logarithm of 17.0 is 1.2304489213782739
The logarithm of 19.0 is 1.2787536009528289
The logarithm of 21.0 is 1.3222192947339193
The logarithm of 23.0 is 1.3617278360175928
The logarithm of 25.0 is 1.3979400086720377
The logarithm of 27.0 is 1.4313637641589874
The logarithm of 29.0 is 1.462397997898956
The logarithm of 31.0 is 1.4913616938342726
The logarithm of 33.0 is 1.5185139398778875
The logarithm of 35.0 is 1.5440680443502757
The logarithm of 37.0 is 1.568201724066995
The logarithm of 39.0 is 1.591064607026499
]0;jpb34@cs-ssh: ~/Documents/214/labs/04jpb34@cs-ssh:~/Documents/214/labs/04$ exit

Script done on 2020-02-27 16:11:15-0500
