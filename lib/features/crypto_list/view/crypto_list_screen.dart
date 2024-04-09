import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:second/features/crypto_list/widgets/widgets.dart';
import 'package:second/repositories/crypto_coins/crypto_coins.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() {
    return _CryptoListScreenState();
  }
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;
  late final theme = Theme.of(context);

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinsList = await GetIt.I<AbstractCoinsRepository>().getCoinsList();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCryptoCoins();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.white,
        elevation: 1,
        title: Text('Crypto Currencies', style: theme.textTheme.titleLarge),
        backgroundColor: Colors.black,
      ),
      body: (_cryptoCoinsList == null) ? const Center(child: CircularProgressIndicator()) : 
        ListView.separated(
          padding: const EdgeInsets.only(top: 20),
        itemCount: _cryptoCoinsList!.length,
        separatorBuilder: (context, index) => Divider(color: Theme.of(context).dividerColor),
        itemBuilder: (context, i) => CryptoCoinTile(coin: _cryptoCoinsList![i])),
    );
  }


}

