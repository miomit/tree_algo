import 'dart:convert';
import 'dart:io';
import 'package:tree_algo/tree.dart';

void main() {
  Tree tree = Tree();
  tree.exportPNG("test");
  while (true) {
    final line = stdin.readLineSync(encoding: utf8) ?? "";
    if (line.split(" ") case [String opr, String arg])
    {
      if (int.tryParse(arg) case int num) {
          switch (opr) 
          {
            case "+": 
              tree.append(num);
            break;
            case "-": 
              tree.remove(num);
            break;
            case "?": 
              Tree(tree.find(num)).exportPNG("find");
            break;

            default: continue;
          }

          tree.exportPNG("test");
      }
    } else {
      switch (line) {
        case "max":
          print(tree.max());
          break;
        case "min":
          print(tree.min());
          break;
      }
    }
  }
    
}