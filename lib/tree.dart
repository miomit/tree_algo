import 'dart:io';

import 'package:graph_dot/source/graph.dart';
import 'package:tree_algo/node.dart';

class Tree {
  Node? root;

  Tree([this.root]);

  void append(int v) {
    appendNode(Node(v));
  }

  void appendNode(Node node) {
    if (root == null){
      root = node;
    } else {
      var n = root;
      do {
        if (node.val == n!.val) {
          return;
        } else if (node.val < n.val) {
          if (n.leftChild == null) {
            n.leftChild = node;
            break;
          } else {
            n = n.leftChild;
          }
        } else {
          if (n.rightChild == null) {
            n.rightChild = node;
            break;
          } else {
            n = n.rightChild;
          }
        }
      } while (n != null);
    }
  }

  Node? find(int v) {
    for (var n = root; n != null; v < n.val ? n = n.leftChild : n = n.rightChild) {
      if (v == n.val) {
        return n;
      }
    }
    return null;
  }

  void remove(int v) {
    if (root == null) return;
    for (var n = root, nOld = root; n != null; v < n.val ? n = n.leftChild : n = n.rightChild) {
      if (v == n.val) {
        if (nOld!.leftChild != null && nOld.leftChild!.val == v){
          nOld.leftChild = null;
        }
        if (nOld!.rightChild != null && nOld.rightChild!.val == v){
          nOld.rightChild = null;
        }
        if (v == root!.val) {
          root = null;
        }
        if (n.rightChild != null){
          appendNode(n.rightChild!);
        }
        if (n.leftChild != null){
          appendNode(n.leftChild!);
        }
        return;
      }
      nOld = n;
    }
  }

  int? max() {
    if (root == null) return null;
    var res = root!;
    while (res.rightChild != null) {
      res = res.rightChild!;
    }
    return res.val;
  }

  int? min() {
    if (root == null) return null;
    var res = root!;
    while (res.leftChild != null) {
      res = res.leftChild!;
    }
    return res.val;
  }

  void exportPNG(String name) {
    var g = root == null ? Graph() : Graph.parseTree(root!);
    File newFile = File("./$name.dot");
    newFile.writeAsStringSync(g.toDot());
    Process.runSync("dot", ["-Tpng", "-Gdpi=300", "$name.dot", "-o", "$name.png"]);
  }
}