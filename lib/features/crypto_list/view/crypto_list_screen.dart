import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:second/features/crypto_list/bloc/crypto_list_bloc.dart';
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
  late final theme = Theme.of(context);
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    // TODO: implement initState
    _cryptoListBloc.add(LoadCryptoList());

    super.initState();
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
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _cryptoListBloc.add(LoadCryptoList(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if(state is CryptoListLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.only(top: 20),
                itemCount: state.cryptoList.length,
                separatorBuilder: (context, index) => Divider(color: Theme.of(context).dividerColor),
                itemBuilder: (context, i) => CryptoCoinTile(coin: state.cryptoList[i]));
            }
            if(state is CryptoListLoadingFailure) {
              return Center(
                child: Column(
                  children: [
                    const Text("Something went wrong.",
                      style: TextStyle(fontSize: 28, color: Colors.white)
                    ),
                    const Text("Please try again",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey
                      )
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () => _cryptoListBloc.add(LoadCryptoList()),
                      child: const Text('Try again'),
                    )
                  ],
                )
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ) 
      
      // (_cryptoCoinsList == null) ? const Center(child: CircularProgressIndicator()) : 
      //   ListView.separated(
      //     padding: const EdgeInsets.only(top: 20),
      //   itemCount: _cryptoCoinsList!.length,
      //   separatorBuilder: (context, index) => Divider(color: Theme.of(context).dividerColor),
      //   itemBuilder: (context, i) => CryptoCoinTile(coin: _cryptoCoinsList![i])),
    );
  }


}

