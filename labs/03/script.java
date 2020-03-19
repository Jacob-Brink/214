Script started on 2020-02-20 13:04:59-0500
]0;jpb34@gold04: ~/Documents/214/labs/03[01;32mjpb34@gold04[00m:[01;34m~/Documents/214/labs/03[00m$ cat year_codes.
year_codes.adb  year_codes.clj  year_codes.rb   
]0;jpb34@gold04: ~/Documents/214/labs/03[01;32mjpb34@gold04[00m:[01;34m~/Documents/214/labs/03[00m$ cat year_codes.
year_codes.adb  year_codes.clj  year_codes.rb   
]0;jpb34@gold04: ~/Documents/214/labs/03[01;32mjpb34@gold04[00m:[01;34m~/Documents/214/labs/03[00m$ cat year_codes.           year    YearCodes.java
/* YearCodes.java is a driver for function yearCode().
 * Student: Jacob Brink
 * Date: 2/20/2020
 * Lab: 03
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 ****************************************************************/

import java.util.Scanner;

public class YearCodes {

    
   public static void main(String[] args) {
      Scanner keyboard = new Scanner(System.in);
      System.out.println("\nEnter your academic year: "); // prompt

      String year = keyboard.next();      // read year
      System.out.println(yearCode(year)); // display its code
   }

   /***************************************************************
    * yearCode() converts an academic year into its integer code.
    *
    * Receive: year, a string.
    * PRE: yearName == one of {freshman, sophomore, junior, or senior}.
    * Return: the integer code corresponding to year.
    */
    
    public static int yearCode(String year)
    {
	if (year.equals("freshman"))
	    return 1;
	else if (year.equals("sophomore"))
	    return 2;
	else if (year.equals("junior"))
	    return 3;
	else if (year.equals("senior"))
	    return 4;
	else
	    return 0;
    }
    
}
]0;jpb34@gold04: ~/Documents/214/labs/03[01;32mjpb34@gold04[00m:[01;34m~/Documents/214/labs/03[00m$ javac YearCodes.java
]0;jpb34@gold04: ~/Documents/214/labs/03[01;32mjpb34@gold04[00m:[01;34m~/Documents/214/labs/03[00m$ java ya  YearCodes

Enter your academic year: 
freshman
1
]0;jpb34@gold04: ~/Documents/214/labs/03[01;32mjpb34@gold04[00m:[01;34m~/Documents/214/labs/03[00m$ java YearCodes

Enter your academic year: 
sophm omore
2
]0;jpb34@gold04: ~/Documents/214/labs/03[01;32mjpb34@gold04[00m:[01;34m~/Documents/214/labs/03[00m$ java YearCodes

Enter your academic year: 
junior
3
]0;jpb34@gold04: ~/Documents/214/labs/03[01;32mjpb34@gold04[00m:[01;34m~/Documents/214/labs/03[00m$ java YearCodes

Enter your academic year: 
senior
4
]0;jpb34@gold04: ~/Documents/214/labs/03[01;32mjpb34@gold04[00m:[01;34m~/Documents/214/labs/03[00m$ java YearCodes

Enter your academic year: 
should_be_s zero
0
]0;jpb34@gold04: ~/Documents/214/labs/03[01;32mjpb34@gold04[00m:[01;34m~/Documents/214/labs/03[00m$ yep it was

Command 'yep' not found, did you mean:

  command 'rep' from deb rep
  command 'iep' from deb emboss
  command 'xep' from deb pvm-examples
  command 'yap' from deb yap
  command 'dep' from deb go-dep
  command 'yes' from deb coreutils
  command 'yelp' from deb yelp

Try: apt install <deb name>

]0;jpb34@gold04: ~/Documents/214/labs/03[01;32mjpb34@gold04[00m:[01;34m~/Documents/214/labs/03[00m$ exit

Script done on 2020-02-20 13:07:39-0500
