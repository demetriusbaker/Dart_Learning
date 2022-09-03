class Letter {
  late String symbol;
  late int count;

  Letter({required this.symbol, required this.count});

  @override
  String toString() => '${this.symbol} - ${this.count}';
}
