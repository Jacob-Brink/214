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

