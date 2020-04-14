/* ThrowingFunction.java is a function that can throw an exception
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: Jacob Brink
 * Date: 4/14/2020
 * Project: 08
 ************************************************************/

import java.util.function.Function;

@FunctionalInterface
public interface ThrowingFunction<T, R> {
    R apply(T t) throws Exception;
}
