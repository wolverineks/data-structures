public class BinaryTree {
  Node root;

  // Build Binary Tree
  public BinaryTree( int[] values ) {
    root = new Node(values[0]);

    for (int i = 1; i <= values.length - 1; i++) {
      Node new_node = new Node(values[i]);
      root.push(new_node);
    }
  }

  public Node getRoot() {
    return root;
  }

  public static int doesInclude( Node node, int key ) {
    return doesInclude(node, key, 0);
  }

  public static int doesInclude( Node node, int key, int result ) {
    if (node.getValue() == key) {
      result = 1;
    } else if (node.getValue() < key) {
      if (node.right != null) {
        result = doesInclude( node.right, key, result );
      }
    } else {
      if (node.left != null) {
        result = doesInclude( node.left, key, result );
      }
    }

    return result;
  }

}
