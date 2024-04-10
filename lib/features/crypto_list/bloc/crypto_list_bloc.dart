import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:second/repositories/crypto_coins/models/crypto_coin.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        if(state is! CryptoListLoaded){
          emit(CryptoListLoading());
        }
        final coinList = await coinsRepository.getCoinsList();
        emit(CryptoListLoaded(cryptoList: coinList));
      } catch (e) {
        emit(CryptoListLoadingFailure());
      }
      finally {
        event.completer?.complete();
      }
    });


  }
  final AbstractCoinsRepository coinsRepository;
}