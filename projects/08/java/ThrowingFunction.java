/* ThrowingFunction.java is a function that can throw an exception
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: Jacob Brink
 * Date: 4/15/2020
 * Project: 08
 ************************************************************/

import java.util.function.Function;

//allows for an exception to be thrown from a function
@FunctionalInterface
public interface ThrowingFunction<T, R> {
    R apply(T t) throws Exception;
}
