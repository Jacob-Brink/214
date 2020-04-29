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

