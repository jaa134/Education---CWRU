/**
 * A class to represent a Huffman Encoding Tree.
 */
public class HuffmanTree {
  
  /**
   * The root of the tree.
   */
  public static Node root;
  
  /**
   * An array to represent the Huffman Codes.
   */
  public static String[] codes = new String[127];
  
  /**
   * This constructor will initialize a tree.
   */
  public HuffmanTree(HuffArrayList list) {
    //make the tree
    makeTree(list);
    //determine it codes
    determineCodes();
  }
  
  /**
   * This method will construct the tree from the Huffman LinkedList.
   * @param list The linked list used.
   * @return root The root of the tree.
   */
  private static Node makeTree(HuffArrayList list) {
    //base case of just the root left in the list
    if(list.getList().size() <= 1) {
      //root is only item in list
      root = list.getList().get(0);
      return root;
    }
    //storing temporary nodes as a save for memory
    Node left = list.getList().get(0);
    Node right = list.getList().get(1);
    //assigning this temporary nodes in a subtree at the end of the list
    Node parent = new Node(null, left, right, left.getFreq() + right.getFreq());
    //add the parent node to the end of the list
    list.getList().add(parent);
    //removing the left and right child
    list.getList().remove(1);
    list.getList().remove(0);
    //sorting the list by frequencies
    java.util.Collections.sort(list.getList());
    //contracting the list til root node
    return makeTree(list);
  }
  
  /**
   * This method prints out the huffman tree in preorder transversal.
   */
  public void determineCodes() {
    //the tree must be established
    if (root != null) {
      //go through the tree
      preorderTraversal(root, "");
    }
  }
  
  /**
   * This method traverses the huffman tree.
   * @param node The node used for recursive traversal.
   * @param rep The huffman representation of a character.
   */
  private static void preorderTraversal(Node node, String rep) {
    //base case of the node being a leaf
    if(node.isLeaf()) {
      //assigning its huffman code to its location in an array
      codes[node.getChar()] = rep;
    }
    //going down the left side tree
    if(node.getLeftNode() != null) {
      //add a 0 to its huffman encoding
      preorderTraversal(node.getLeftNode(), rep + "0");
    }
    //going down the right side tree
    if(node.getRightNode() != null) {
      //add a 1 to its huffman encoding
      preorderTraversal(node.getRightNode(), rep + "1");
    }
  }
}