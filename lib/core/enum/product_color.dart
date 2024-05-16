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
}
