import 'package:flutter/material.dart';
import 'package:second/features/crypto_list/widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() {
    return _CryptoListScreenState();
  }
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final List<String> names = ['Bitcoin', 'PEPE'];
  late final theme = Theme.of(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.white,
        title: Text('Crypto Currencies', style: theme.textTheme.titleLarge),
        backgroundColor: Colors.black,
      ),
      body: ListView.separated(
        itemCount: names.length,
        separatorBuilder: (context, index) => Divider(color: Theme.of(context).dividerColor),
        itemBuilder: (context, i) => CryptoCoinTile(name: names[i])),
    );
  }
}

