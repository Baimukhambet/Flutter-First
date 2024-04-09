import 'package:flutter/material.dart';
import 'package:second/repositories/crypto_coins/crypto_coins.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    return ListTile(
    title: Text(coin.name, style: Theme.of(context).textTheme.labelLarge),
    subtitle: Text('\$'+coin.priceInUSD.toStringAsFixed(3), style: Theme.of(context).textTheme.labelSmall),
    onTap: () => (
      Navigator.pushNamed(context, '/coin', arguments: coin)
    ),
    leading: Image.network(coin.imageURL, height: 30, width: 30,),
    trailing: const Icon(Icons.arrow_forward_ios_rounded),
          );
  }
}