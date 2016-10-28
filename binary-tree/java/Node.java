public class Node {
  public int value;
  public Node left;
  public Node right;

  // Constructor
  public Node(int input) {
    setValue(input);
  }

  // Value Setter
  public void setValue(int input) {
    value = input;
  }

  // Value Getter
  public int getValue() {
    return value;
  }

  // Push New Node Into Binary Tree
  public void push(Node node) {
    if (getValue() < node.getValue()) {
      if (right == null) {
        right = node;
      } else {
        right.push(node);
      }
    } else {
      if (left == null) {
        left = node;
      } else {
        left.push(node);
      }
    }
  }
}
