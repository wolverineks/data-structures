public class NodeTest {
  public static void main( String[] args ) {
    Node node1 = new Node(1);
    Node node2 = new Node(2);
    Node node3 = new Node(3);
    Node node4 = new Node(4);

    test("node.value",
      1,
      node1.value
    );

    node1.push(node3);
    test("node.push",
      3,
      node1.right.getValue()
    );

    node1.push(node2);
    test("node.push",
      2,
      node3.left.getValue()
    );

    node1.push(node4);
    test("node.push",
      4,
      node3.right.getValue()
    );

    int[] values = { 0, 5, 1, 3, 7, 2, 6, 9, 4 };
    BinaryTree tree = new BinaryTree(values);
    Node root = tree.getRoot();

    test("new BinaryTree - root",
      0,
      root.getValue()
    );

    test("new BinaryTree - 5",
      5,
      root.right.getValue()
    );

    test("new BinaryTree - 9",
      9,
      root.right.right.right.getValue()
    );

    test("BinaryTree.doesInclude(node, key)",
      1,
      BinaryTree.doesInclude(root, 0)
    );

    test("BinaryTree.doesInclude(node, key)",
      1,
      BinaryTree.doesInclude(root, 5)
    );

    test("BinaryTree.doesInclude(node, key)",
      1,
      BinaryTree.doesInclude(root, 9)
    );

    test("BinaryTree.doesInclude(node, key)",
      0,
      BinaryTree.doesInclude(root, 11)
    );
  }

  static final String ANSI_RED = "\u001B[31m";
  static final String ANSI_RESET = "\u001B[0m";

  static void test( String testName, int expected, int actual ) {
    double startTime = System.nanoTime();
    boolean result = expected == actual;
    double endTime = System.nanoTime();
    double durationInMicroseconds = (endTime - startTime) / 1000;

    if (result) {
      System.out.println(
        testName + "\n" +
        "PASS: (" + durationInMicroseconds + " μs)"
      );
    } else {
      System.out.println(
        ANSI_RED + "\n" +
        testName + "\n" +
        "Expected: " + expected + "\n" +
        "Actual:   " + actual + "\n" +
        "FAIL: (" + durationInMicroseconds + " μs)" + "\n" +
        ANSI_RESET);
    }
    System.out.println("----------------------------------");
  }
}
