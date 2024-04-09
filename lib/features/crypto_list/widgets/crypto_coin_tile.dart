import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
    title: Text(name, style: Theme.of(context).textTheme.labelLarge),
    subtitle: Text("Subtitle", style: Theme.of(context).textTheme.labelSmall),
    onTap: () => (
      Navigator.pushNamed(context, '/coin', arguments: name)
    ),
    leading: SvgPicture.asset(
      'assets/bitcoin_logo.svg',
      width: 30,
      height: 30,
    ),
    trailing: const Icon(Icons.arrow_forward_ios_rounded),
          );
  }
}