Script started on 2020-04-18 12:06:09-0500
]0;jacob@DESKTOP-QKT72KA: ~/214/labs/10/java[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/10/java[00m$ cat Bird.java
/* Bird.java provides a Bird class.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Jacob Brink
 * Date: 4/24/2020
 * Lab: 10
 ******************************************************/

import java.io.*;

public class Bird
{

    /* default constructor
     * PostCond: myName == "".
     */
    public Bird() {
	myName = "";
    }

    /* explicit constructor
     * Receive: name, a String 
     * PostCond: myName == name.
     */
    public Bird(String name) {
	myName = name;
    }

    /* Name accessor
     * Return: myName.
     */
    public String getName() {
	return myName;
    }

    /* A Bird's Call
     * Return: a default bird-call ("Squawk!").
     */
    public String call() {
	return "Squaaaaaaaawk";
    }

    /* Output a Bird 
     * Output: Everything known about myself
     *          to the standard output stream.
     */
	public void print()
    {
	System.out.println( getName() + ' ' + getClass().getName()
			    + " says " + call() );
    } 

    private String myName;
}

]0;jacob@DESKTOP-QKT72KA: ~/214/labs/10/java[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/10/java[00m$ cat Birds.java
/* Birds.java illustrates inheritance and polymorphism.
 *
 * Begun by: Joel Adams, for CS 214 Lab 10 at Calvin College.
 * Completed by: Jacob Brink
 * Date: 4/24/2020
 * Lab: 10
 *********************************************************/

public class Birds {
  
  public static void main(String[] args) {
      System.out.println("\nWelcome to the Bird Park!\n");

      Bird bird0 = new Bird();

      Bird bird1 = new Bird("Hawkeye");
      bird1.print();

      Duck bird2 = new Duck("Donald");
      bird2.print();

     Goose bird3 = new Goose("Mother Goose");
     bird3.print();

     Owl bird4 = new Owl("Woodsey");
     bird4.print();
      System.out.println();
    }
}

]0;jacob@DESKTOP-QKT72KA: ~/214/labs/10/java[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/10/java[00m$ cat Duck.java
/* Duck.java provides a Duck subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Jacob Brink
 * Date: 4/24/2020
 * Lab: 10
 ******************************************************/

public class Duck extends Bird {
    
    /* explicit constructor
     * Receive: name, a String 
     * PostCond: myName == name.
     */
    public Duck(String name)
    {     
	super(name);
    } 

    
    public Duck() {
	super();
    }

    /* A Duck's Call
     * Return: a duck-call ("Quack!").
     */
    public String call()
    {
	return "Quack!";
    } 
}

]0;jacob@DESKTOP-QKT72KA: ~/214/labs/10/java[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/10/java[00m$ cat Goose.java
/* Goose.java provides a Goose subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Jacob Brink
 * Date: 4/24/2020
 * Lab: 10
 ******************************************************/

public class Goose extends Bird {

    /* explicit constructor
     * Receive: name, a String 
     * PostCond: myName == name.
     */
    public Goose(String name)
    {     
	super(name);
    }

    
    public Goose()
    {
	super();
    }

    /* A Goose's Call
     * Return: a goose-call ("Honk!").
     */
    public String call()
    {
	return "Honk!";
    }  

    
} 

]0;jacob@DESKTOP-QKT72KA: ~/214/labs/10/java[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/10/java[00m$ cat Makefile

Birds: Birds.java
	javac -deprecation Birds.java

clean:
	rm -f *.class *.o *~ *#

]0;jacob@DESKTOP-QKT72KA: ~/214/labs/10/java[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/10/java[00m$ C[Kcat Owl.javba[K[Ka
/* Owl.java provides an Owl subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Jacob Brink
 * Date: 4/24/2020
 * Lab: 10
 ******************************************************/

public class Owl extends Bird{

    /* explicit constructor
     * Receive: name, a String 
     * PostCond: myName == name.
     */
    public Owl() {
	super();
    }
    
    public Owl(String name) {
	super(name);
    }


    /* An Owl's Call
     * Return: an owl-call ("Whoo-hoo!").
     */
    public String call() {
	return "Whoo-hoo!";
    }

    
} 

]0;jacob@DESKTOP-QKT72KA: ~/214/labs/10/java[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/10/java[00m$ j[Kmake
javac -deprecation Birds.java
]0;jacob@DESKTOP-QKT72KA: ~/214/labs/10/java[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/10/java[00m$ java Birds 

Welcome to the Bird Park!

Hawkeye Bird says Squaaaaaaaawk
Donald Duck says Quack!
Mother Goose Goose says Honk!
Woodsey Owl says Whoo-hoo!

]0;jacob@DESKTOP-QKT72KA: ~/214/labs/10/java[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/labs/10/java[00m$ exit

Script done on 2020-04-18 12:06:49-0500
