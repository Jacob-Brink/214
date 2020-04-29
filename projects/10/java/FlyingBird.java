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

