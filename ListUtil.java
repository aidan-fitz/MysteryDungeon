import java.util.*;

public class ListUtil {

  public static Object oneOf(List l, Random rng) {
    int i = rng.nextInt(l.size());
    return l.get(i);
  }

  public static Object anotherOf(List l, Object alreadyChosen, Random rng) {
    Object elem = null;
    while (elem == null || Arrays.asList(alreadyChosen).contains(elem)) {
      elem = oneOf(l, rng);
    }
    return elem;
  }

}

