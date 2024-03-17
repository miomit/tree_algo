import 'package:graph_dot/source/i_tree.dart';

class Node implements ITree{
  final int val;

  Node? leftChild;
  Node? rightChild;

  Node(this.val);

  @override
  List<(String, ITree)> getChilds() {
    List<(String, ITree)> res = [];
    if (leftChild != null) res.add(("-", leftChild!));
    if (rightChild != null) res.add(("+", rightChild!));
    return res;
  }
  
  @override
  String getLabel() {
    return val.toString();
  }
}