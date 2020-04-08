Script started on 2020-04-08 10:49:15-0400
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/07[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/07[00m$ cat NameTester.java
/* NameTester.java is a 'driver' to test class Name.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: Jacob Brink
 * Date: 3/20/2020
 * Project: 07
 ************************************************************/

import java.io.*;
import java.util.Scanner;


public class NameTester  
{


  private static void runProjectTests()
  {
      Name aName = new Name("John", "Paul", "Jones");

      //test mutator methods
      System.out.println("Testing mutator methods");
      
      aName.setFirst("First");
      assert aName.getFirst().equals("First");
      assert aName.getMiddle().equals("Paul");
      assert aName.getLast().equals("Jones");
      
      aName.setMiddle("Middle");
      assert aName.getFirst().equals("First");
      assert aName.getMiddle().equals("Middle");
      assert aName.getLast().equals("Jones");

      
      aName.setLast("Last");
      assert aName.getFirst().equals("First");
      assert aName.getMiddle().equals("Middle");
      assert aName.getLast().equals("Last");

      //testing lfmi method
      System.out.println("Testing lfmi method");
      Name bName = new Name("Jacob", "Hymer", "Smith");
      assert bName.lfmi().equals("Smith, Jacob H.");

      //testing input method
      System.out.println("Testing read method");
      InputStream emptyStream = System.in;
      //reset input stream in case user types during test
      System.setIn(emptyStream);
      ByteArrayInputStream in = new ByteArrayInputStream(("Mike" + System.lineSeparator() + "Peter" + System.lineSeparator() + "Smith").getBytes());
      System.setIn(in);
      aName.read(new Scanner(System.in));
      assert aName.getFirst().equals("Mike");
      assert aName.getMiddle().equals("Peter");
      assert aName.getLast().equals("Smith");
      

  }
    
  public static void main(String[] args)
  {
      
      Name aName = new Name("John", "Paul", "Jones");
//
      assert aName.getFirst().equals("John") ;
      assert aName.getMiddle().equals("Paul") ;
      assert aName.getLast().equals("Jones") ;
//
      System.out.println(aName);
      assert aName.toString().equals("John Paul Jones");

      runProjectTests();
      
      System.out.println("All tests passed!");
  }
}

class Name
{
    private String myFirst, myMiddle, myLast;


    public Name(String first, String middle, String last)
    {
	
	myFirst = first;
	myMiddle = middle;
	myLast = last;
    }


    public void read(Scanner scanner) {
	myFirst = scanner.nextLine();
	myMiddle = scanner.nextLine();
	myLast = scanner.nextLine();
    }
    
    public String lfmi()
    {
	return String.format("%s, %s %s.", myLast, myFirst, myMiddle.charAt(0));
    }

    public void setFirst(String first)
    {
	this.myFirst = first;
    }

    public void setMiddle(String middle)
    {
	this.myMiddle = middle;
    }

    public void setLast(String last)
    {
	this.myLast = last;
    }

    public String getFirst()
    {
	return this.myFirst;
    }

    public String getMiddle()
    {
	return this.myMiddle;
    }

    public String getLast()
    {
	return this.myLast;
    }

    public String toString()
    {
	return myFirst + ' ' + myMiddle + ' ' + myLast;
    }
}


]0;jacob@DESKTOP-TMA4I98: ~/214/projects/07[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/07[00m$ jv[Kavac NameTester.java 
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/07[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/07[00m$ java -ea NameTEste[K[K[K[Ket[Kster
John Paul Jones
Testing mutator methods
Testing lfmi method
Testing read method
All tests passed!
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/07[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/07[00m$ exit

Script done on 2020-04-08 10:49:37-0400
