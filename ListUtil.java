import java.util.*;

public class ListUtil {

  public static <T> T oneOf(List<T> l, Random rng) {
    int i = rng.nextInt(l.size());
    return l.get(i);
  }

  public static <T> T anotherOf(List<T> l, T... alreadyChosen, Random rng) {
    T elem;
    while (elem == null || Arrays.asList(alreadyChosen).contains(elem)) {
      elem = oneOf(l, rng);
    }
    return elem;
  }

}

