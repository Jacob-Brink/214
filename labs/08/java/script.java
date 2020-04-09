Script started on 2020-04-09 15:31:16-0400
]0;jacob@DESKTOP-TMA4I98: ~/214/labs/08/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/08/java[00m$ cat Name.java[K[K[K[K[KTester.java
/* NameTester.java is a 'driver' to test class Name.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: Jacob Brink
 * Date: 4/10/2020
 * Lab: 8
 ************************************************************/


public class NameTester  
{
  public static void main(String[] args)
  {
      Name aName = new Name("John", "Paul", "Jones");

      assert aName.getFirst().equals("John") ;
      assert aName.getMiddle().equals("Paul") ;
      assert aName.getLast().equals("Jones") ;

      System.out.println(aName);
      assert aName.toString().equals("John Paul Jones");

      System.out.println("All tests passed!");
  }
}
]0;jacob@DESKTOP-TMA4I98: ~/214/labs/08/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/08/java[00m$ cat Name.J[Kjava
/* Name.java implements class Name.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: Jacob Brink
 * Date: 4/10/2020
 * Lab: 8
 ************************************************************/

// the Name class appears outside of the rest of the program
class Name {

  // Name object constructor with initialization  
  public Name(final String first, final String middle, final String last) {
      myFirst = first;
      myMiddle = middle;
      myLast = last;
  }
 
  // extractor for first name of a Name object
  public final String getFirst() {
      return myFirst;
  }

  // extractor for middle name of a Name object
  public final String getMiddle() {
      return myMiddle;
  }

  // extractor for last name of a Name object
  public final String getLast() {
      return myLast;
  }
  
  // return string created by piecing together first, middle, and last names
  public final String toString() {
      return myFirst + ' ' + myMiddle + ' ' + myLast;
  }

  private String myFirst, myMiddle, myLast;  // private instance variables
}

]0;jacob@DESKTOP-TMA4I98: ~/214/labs/08/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/08/java[00m$ ls
Makefile  Name.class  Name.java  Name.java~  NameTester.class  [0m[01;32mNameTester.java[0m  [01;32mNameTester.java~[0m  script.java
]0;jacob@DESKTOP-TMA4I98: ~/214/labs/08/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/08/java[00m$ make
make: Nothing to be done for 'NameTester'.
]0;jacob@DESKTOP-TMA4I98: ~/214/labs/08/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/08/java[00m$ java NameTester
John Paul Jones
All tests passed!
]0;jacob@DESKTOP-TMA4I98: ~/214/labs/08/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/labs/08/java[00m$ exit

Script done on 2020-04-09 15:31:49-0400
