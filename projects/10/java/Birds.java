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

