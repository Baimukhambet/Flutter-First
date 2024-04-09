import 'package:dio/dio.dart';
import 'package:second/repositories/crypto_coins/crypto_coins.dart';


class CryptoCoinsRepository implements AbstractCoinsRepository {
  final Dio dio;

  CryptoCoinsRepository({required this.dio});

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,PEPE,BNB,AVA,SOL&tsyms=USD');
      // debugPrint(response.toString());
      final data = ((response.data as Map<String, dynamic>)['RAW']) as Map<String, dynamic>;
      final dataList = data.entries.map((e) {
        final coinInfo = (e.value as Map<String, dynamic>)['USD'];
        // debugPrint("COIN NAME IS $coinInfo");
        return CryptoCoin(
          name: e.key,
          priceInUSD: coinInfo['PRICE'],
          imageURL: 'https://www.cryptocompare.com/${coinInfo["IMAGEURL"]}');
      }).toList();
      return dataList;
  }
}