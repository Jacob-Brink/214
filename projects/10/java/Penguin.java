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

