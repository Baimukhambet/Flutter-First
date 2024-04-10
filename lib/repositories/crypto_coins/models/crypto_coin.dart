import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable{
  const CryptoCoin({
    required this.name,
    required this.priceInUSD,
    required this.imageURL,
    }
  );

  final String name;
  final double priceInUSD;
  final String imageURL;

  @override
  String toString() {
    // TODO: implement toString
    return '$name - $priceInUSD';
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [name, priceInUSD];
}