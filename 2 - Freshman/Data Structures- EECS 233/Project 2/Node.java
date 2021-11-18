public class Node implements Comparable<Node>{
  
  /**
   * The character stored in the node.
   */
  private Character character;
  
  /**
   * The left child of this node.
   */
  private Node left;
  
  /**
   * The right child of this node;
   */
  private Node right;
  
  /**
   * The frequency that the charracter this node stores occurs in the subjected file.
   */
  private int frequency;
  
  /**
   * A constructor method to initialize all of the fields.
   * @param character The character stored in the node.
   * @param left The left child of this node.
   * @param right The right child of this node;
   * @param frequency The frequency that the charracter this node stores occurs in the subjected file.
   */
  public Node(Character character, Node left, Node right, int frequency) {
    this.character = character;
    this.left = left;
    this.right = right;
    this.frequency = frequency;
  }
  
  /**
   * A getter method for the character.
   * @return char The character of this node.
   */
  public Character getChar() {
    return this.character;
  }
  
  /**
   * A setter method for character.
   * @param c The character of this node.
   */
  public void setChar(char c) {
    this.character = c;
  }
  
  /**
   * A getter method for the left child.
   * @return The left child to this node.
   */
  public Node getLeftNode() {
    return this.left;
  }
  
  /**
   * A setter method for the left child.
   * @param Node The left child to this node.
   */
  public void setLeftNode(Node n) {
    this.left = n;
  }
  
  /**
   * A getter method for the right child.
   * @return Node The right child to this node.
   */
  public Node getRightNode() {
    return this.right;
  }
  
  /**
   * A setter method for the right child.
   * @param n The right child to this node.
   */
  public void setRightNode(Node n) {
    this.right = n;
  }
  
  /**
   * A getter method for the frequency.
   * @return int The frequency of the character.
   */
  public int getFreq() {
    return this.frequency;
  }
  
  /**
   * A setter method for the frequency.
   * @param i The frequency of the character.
   */
  public void setFreq(int i) {
    this.frequency = i;
  }
  
  /**
   * A helper method to determine if the node is a leaf. Aids the making of the Huffman Binary Tree.
   * @return boolean The truth to the current node having no children.
   */
  public boolean isLeaf() {
    return (left == null && right == null);
  }
  
  /**
   * A helper method that will compare two node's frequency's. This will aid in building the Huffman Binary Tree.
   * @param node2 The second node needed for a comparison.
   * @return int The difference in frequency values.
   */
  @Override
  public int compareTo(Node node2) {
    //difference in frequencies
    return this.frequency - node2.frequency;
  }
}