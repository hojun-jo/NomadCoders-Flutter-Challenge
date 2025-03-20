enum PalElements {
  none("none"),
  grass("grass"),
  fire("fire");

  final String text;

  const PalElements(this.text);

  factory PalElements.fromString(String value) {
    return values.firstWhere((e) => e.text == value);
  }
}
