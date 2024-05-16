import 'package:flutter/material.dart';

enum ProductColor { black, white, red }

extension ProductColorText on ProductColor {
  String get text {
    switch (this) {
      case ProductColor.black:
        return "Black";
      case ProductColor.red:
        return "Red";
      case ProductColor.white:
        return "White";
    }
  }

  Color get value {
    switch (this) {
      case ProductColor.black:
        return Colors.black;
      case ProductColor.red:
        return Colors.red;
      case ProductColor.white:
        return Colors.white;
    }
  }
}
