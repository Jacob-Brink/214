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

