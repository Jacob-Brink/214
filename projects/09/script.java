Script started on 2020-04-18 10:54:40-0500
]0;jacob@DESKTOP-QKT72KA: ~/214/projects/09/java[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/09/java[00m$ cat Search.java
/* Search.java finds the position of values in Java linked lists.
 *
 * Begun by: Dr. Adams, CS 214 at Calvin College.
 * Completed by: Jacob Brink
 * Date: 4/17/2020
 * Project: 09
 */

import java.util.LinkedList;
import java.util.Iterator;
import java.util.Collections;

public class Search {

    public static void main(String [] args) {
	LinkedList<Integer> list1, list2, list3, list4;
	list1 = new LinkedList<Integer>();
	list2 = new LinkedList<Integer>();
	list3 = new LinkedList<Integer>();
	list4 = new LinkedList<Integer>();
	
	list1.add(99);    // 99, 88, 77, 66, 55
	list1.add(88);    // max is first
	list1.add(77);
	list1.add(66);  
	list1.add(55);

	list2.add(55);    // 55, 66, 77, 88, 99
	list2.add(66);    // max is last
	list2.add(77);  
	list2.add(88);  
	list2.add(99);  
  
	list3.add(55);    // 55, 77, 99, 88, 66
	list3.add(77);    // max is in the middle
	list3.add(99);  
	list3.add(88);  
	list3.add(66);  

	list4.add(55);    // 55, 77, 99, 88, 66
	list4.add(77);    // max is in the middle
	list4.add(100);  
	list4.add(88);  
	list4.add(66);

	System.out.println(String.format("Position of 99 (0) in List1: %s", searchList(list1, 99)));
	System.out.println(String.format("Position of 99 (4)in List2: %s", searchList(list2, 99)));
	System.out.println(String.format("Position of 99 (2) in List3: %s", searchList(list3, 99)));
	System.out.println(String.format("Position of 99 (-1) in List4: %s", searchList(list4, 99)));
    }

    /** searchList()
     *
     * @param: list, a LinkedList<Integer>; item, an integer
     * returns: position of integer if in list, else -1
     */
    public static int searchList(LinkedList<Integer> list, int item) {
	Iterator<Integer> listIterator = list.iterator();
	int position = -1;
	int count = 0;
	while (listIterator.hasNext()) {
	    if (listIterator.next() == item) {
		position = count;
		break;
	    }
	    count++;
	}
	return position;
    }

}

]0;jacob@DESKTOP-QKT72KA: ~/214/projects/09/java[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/09/java[00m$ javac Search.java
]0;jacob@DESKTOP-QKT72KA: ~/214/projects/09/java[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/09/java[00m$ java Search
Position of 99 (0) in List1: 0
Position of 99 (4)in List2: 4
Position of 99 (2) in List3: 2
Position of 99 (-1) in List4: -1
]0;jacob@DESKTOP-QKT72KA: ~/214/projects/09/java[01;32mjacob@DESKTOP-QKT72KA[00m:[01;34m~/214/projects/09/java[00m$ exit

Script done on 2020-04-18 10:54:58-0500
