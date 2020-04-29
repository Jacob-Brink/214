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

