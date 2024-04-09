import 'package:second/features/crypto_coin/crypto_coin.dart';
import 'package:second/features/crypto_list/crypto_list.dart';

final routes =  {
        '/':(context) => const CryptoListScreen(),
        '/coin':(context) => const CryptoCoinScreen()
      };