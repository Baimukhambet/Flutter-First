import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:second/repositories/crypto_coins/models/crypto_coin.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  CryptoCoin? _coin;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is CryptoCoin,
        "Provide argument of type CryptoCoin!");
    _coin = args as CryptoCoin;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CryptoCoinsRepository(dio: Dio()).getCoinsList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final theme = Theme.of(context);
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text(_coin!.name,
                  style: const TextStyle(color: Colors.white)),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context),
                color: Colors.white,
              ),
              backgroundColor: Colors.black,
            ),
            body: Container(
              padding: const EdgeInsets.all(20),
              // color: Colors.black,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(240),
                // boxShadow: [BoxShadow(color: Colors.black, offset: Offset.fromDirection(1.0))]
              ),
              child: Column(
                children: [
                  DecoratedBox(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 34, 35, 32),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child:
                        Image.network(_coin!.imageURL, height: 120, width: 120),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Current price: ',
                          style: theme.textTheme.titleLarge),
                      Text('\$${_coin!.priceInUSD.toStringAsFixed(3)}',
                          style: theme.textTheme.titleLarge)
                    ],
                  ),
                ],
              ),
            )));
  }
}
