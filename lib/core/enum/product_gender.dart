enum Gender { men, women, unisex }

extension GenderText on Gender {
  String get text {
    switch (this) {
      case Gender.men:
        return "Men";
      case Gender.women:
        return "Women";
      case Gender.unisex:
        return "Unisex";
    }
  }
}
