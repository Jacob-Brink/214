Script started on 2020-03-20 13:26:04-0500
]0;jacob@DESKTOP-QKT72KA: ~/214/labs/07[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/07[00m$ java NameTester[6Pmake javacat NameTester.java
/* NameTester.java is a 'driver' to test class Name.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: Jacob Brink
 * Date: 3/20/2020
 * Lab: 07
 ************************************************************/

public class NameTester  
{
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


]0;jacob@DESKTOP-QKT72KA: ~/214/labs/07[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/07[00m$ cat NameTester.java[4Pjava NameTester[6Pmake java
javac -deprecation NameTester.java
]0;jacob@DESKTOP-QKT72KA: ~/214/labs/07[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/07[00m$ make javacat NameTester.java[4Pjava NameTester
John Paul Jones
All tests passed!
]0;jacob@DESKTOP-QKT72KA: ~/214/labs/07[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/07[00m$ exit

Script done on 2020-03-20 13:26:12-0500
