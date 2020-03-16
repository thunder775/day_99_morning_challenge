//  Good morning! Here's your coding interview problem for today.
//
//  Suppose an arithmetic expression is given as a binary tree. Each leaf is an
//  integer and each internal node is one of '+', '−', '∗', or '/'.
//
//  Given the root to such a tree, write a function to evaluate it.
//
//  For example, given the following tree:
//
//         *
//      /     \
//     +       +
//    /  \    / \
//   3    2  4   5
//  You should return 45, as it is (3 + 2) * (4 + 5).
class Node {
  String value;
  Node right;
  Node left;

  Node({this.value, this.left, this.right});
}

dynamic resolveTree(Node head) {
  dynamic a;
  dynamic b;
  // check head's left node is a leaf
  if (head.left.left == null) {
    a = int.parse(head.left.value);
  }

  // check head's right node is a leaf
  if (head.right.left == null) {
    b = int.parse(head.right.value);
  }
  //left node is not a leaf
  if (a == null) {
    a = resolveTree(head.left);
  }
  //right node is not a leaf
  if (b == null) {
    b = resolveTree(head.right);
  }
  return doCalculation(a, b, head.value);
}

Map<String, Function> operations = {
  '+':(dynamic a , dynamic b )=>a+b,
  '-':(dynamic a , dynamic b )=>a-b,
  '*':(dynamic a , dynamic b )=>a*b,
  '/':(dynamic a , dynamic b )=>a/b,
};

dynamic doCalculation(dynamic a, dynamic b, String exp) {
  return operations[exp](a,b);
}

void main() {
  Node d = Node(value: '3');
  Node e = Node(value: '2');
  Node f = Node(value: '4');
  Node g = Node(value: '2');
  Node b = Node(value: '3', left: d, right: e);
  Node c = Node(value: '/', left: f, right: g);
  Node a = Node(value: '*', right: b, left: c);
  print(resolveTree(a));
}
