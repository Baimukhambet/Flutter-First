class CryptoCoin {
  final String name;
  final double priceInUSD;
  final String imageURL;

  const CryptoCoin({
    required this.name,
    required this.priceInUSD,
    required this.imageURL,
    }
  );

  @override
  String toString() {
    // TODO: implement toString
    return '$name - $priceInUSD';
  }
}