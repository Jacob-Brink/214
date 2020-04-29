Script started on 2020-04-29 15:44:12-0400
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/java[00m$ cat Bird.java
/* Bird.java provides a Bird class.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Jacob Brink
 * Date: 4/29/2020
 * Project: 10
 ******************************************************/

import java.io.*;

public abstract class Bird
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
	System.out.println( getName() + ' ' + getClass().getName() + " just " + movement() + " past and said, " + call() );
    } 

    private String myName;

    /* movement abstract to be implemented by subclasses
     * Returns: movement description
     */
    public abstract String movement();
}

]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/java[00m$ cat Birds.java
/* Birds.java illustrates inheritance and polymorphism.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Jacob Brink
 * Date: 4/29/2020
 * Project: 10
 ******************************************************/

public class Birds {
  
    public static void main(String[] args) {
	System.out.println("\nWelcome to the Bird Park!\n");

	Bird bird0 = new WalkingBird();

	Bird bird1 = new WalkingBird("*Walking Bird Name*");
	bird1.print();

	Bird b0 = new FlyingBird();
	
	Bird b1 = new FlyingBird("*Flying Bird Name*");
	b1.print();

	Duck bird2 = new Duck("Donald");
	bird2.print();

	Goose bird3 = new Goose("Mother Goose");
	bird3.print();

	Owl bird4 = new Owl("Woodsey");
	bird4.print();

	Penguin bird5 = new Penguin("Super Tux");
	bird5.print();

	Ostrich bird6 = new Ostrich("Jacob");
	bird6.print();

	Kiwi bird7 = new Kiwi("Kiwi");
	bird7.print();

	System.out.println();
    }
}

]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/java[00m$ cat Duck.java
/* Duck.java provides a Duck subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Jacob Brink
 * Date: 4/29/2020
 * Project: 10
 ******************************************************/

public class Duck extends FlyingBird {
    
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

]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/java[00m$ cat FlyingBird.java
/* FlyingBird.java provides a FlyingBird class.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Jacob Brink
 * Date: 4/29/2020
 * Project: 10
 ******************************************************/

import java.io.*;

public class FlyingBird extends Bird
{

    /* default constructor
     * PostCond: myName == "".
     */
    public FlyingBird() {
	super();
    }

    /* explicit constructor
     * Receive: name, a String 
     * PostCond: myName == name.
     */
    public FlyingBird(String name) {
	super(name);
    }

    /* movement
     * Returns: movement description
     */
    @Override
    public String movement() {
	return "flew";
    }
     
}

]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/java[00m$ cat Goose.java
/* Goose.java provides a Goose subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Jacob Brink
 * Date: 4/29/2020
 * Project: 10
 ******************************************************/

public class Goose extends FlyingBird {

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

]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/java[00m$ cat Kiwi.java
/* Kiwi.java provides an Kiwi subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Jacob Brink
 * Date: 4/29/2020
 * Project: 10
 ******************************************************/

public class Kiwi extends WalkingBird {

    /* explicit constructor
     * Receive: name, a String 
     * PostCond: myName == name.
     */
    public Kiwi() {
	super();
    }
    
    public Kiwi(String name) {
	super(name);
    }


    /* An Kiwi's Call
     * Return: an kiwi-call ("Whoo-hoo!").
     */
    public String call() {
	return "*Kiwi Noises*";
    }

    
} 

]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/java[00m$ cat Ostrich.java
/* Ostrich.java provides an Ostrich subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Jacob Brink
 * Date: 4/29/2020
 * Project: 10
 ******************************************************/

public class Ostrich extends WalkingBird {

    /* explicit constructor
     * Receive: name, a String 
     * PostCond: myName == name.
     */
    public Ostrich() {
	super();
    }
    
    public Ostrich(String name) {
	super(name);
    }


    /* An Ostrich's Call
     * Return: an ostrich-call ("Whoo-hoo!").
     */
    public String call() {
	return "*Ostrich Noises*";
    }

    
} 

]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/java[00m$ C[Kcat Owl.java
/* Owl.java provides an Owl subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Jacob Brink
 * Date: 4/29/2020
 * Project: 10
 ******************************************************/

public class Owl extends FlyingBird {

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

]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/java[00m$ cat Penguin.java
/* Penguin.java provides an Penguin subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Jacob Brink
 * Date: 4/29/2020
 * Project: 10
 ******************************************************/

public class Penguin extends WalkingBird {

    /* explicit constructor
     * Receive: name, a String 
     * PostCond: myName == name.
     */
    public Penguin() {
	super();
    }
    
    public Penguin(String name) {
	super(name);
    }


    /* An Penguin's Call
     * Return: an penguin-call ("Whoo-hoo!").
     */
    public String call() {
	return "*Penguin Noises*";
    }

    
} 

]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/java[00m$ cat walkingir[K[K[KBird.jvaa[C[C[C[1PalkinBird.jvaaWalkinBird.jvaa
cat: WalkinBird.jvaa: No such file or directory
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/java[00m$ cat WalkinBird.jvaa[CgBird.jvaa
cat: WalkingBird.jvaa: No such file or directory
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/java[00m$ cat WalkingBird.jvaaavaa[C[C[C[K
/* WalkingBird.java provides a WalkingBird class.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Jacob Brink
 * Date: 4/29/2020
 * Project: 10
 ******************************************************/

import java.io.*;

public class WalkingBird extends Bird
{

    /* default constructor
     * PostCond: myName == "".
     */
    public WalkingBird() {
	super();
    }

    /* explicit constructor
     * Receive: name, a String 
     * PostCond: myName == name.
     */
    public WalkingBird(String name) {
	super(name);
    }

    /* movement
     * Returns: movement description
     */
    @Override
    public String movement() {
	return "walked";
    }
     
}

]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/java[00m$ ruby birds.jav[K[K[K[K[K[K[K[K[K[K[K[K[K[Kjavac birds.java
error: file not found: birds.java
Usage: javac <options> <source files>
use --help for a list of possible options
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/java[00m$ javac birds.java[C[1Pirds.javaBirds.java[1@o[1@o[1@p[1@s[1@ 
oops: command not found
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/java[00m$ oops javac Birds.java[C[C[1P[1P[1P[1P[1P
]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/java[00m$ java Birds

Welcome to the Bird Park!

*Walking Bird Name* WalkingBird just walked past and said, Squaaaaaaaawk
*Flying Bird Name* FlyingBird just flew past and said, Squaaaaaaaawk
Donald Duck just flew past and said, Quack!
Mother Goose Goose just flew past and said, Honk!
Woodsey Owl just flew past and said, Whoo-hoo!
Super Tux Penguin just walked past and said, *Penguin Noises*
Jacob Ostrich just walked past and said, *Ostrich Noises*
Kiwi Kiwi just walked past and said, *Kiwi Noises*

]0;jacob@DESKTOP-TMA4I98: ~/214/projects/10/java[01;32mjacob@DESKTOP-TMA4I98[00m:[01;34m~/214/projects/10/java[00m$ exit

Script done on 2020-04-29 15:47:01-0400
