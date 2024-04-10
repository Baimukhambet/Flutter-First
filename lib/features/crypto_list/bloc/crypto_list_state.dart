part of 'crypto_list_bloc.dart';

abstract class CryptoListState {

}

class CryptoListInitial extends CryptoListState {}

class CryptoListLoading extends CryptoListState {}

class CryptoListLoaded extends CryptoListState {
  CryptoListLoaded({required this.cryptoList});

  final List<CryptoCoin> cryptoList;
}

class CryptoListLoadingFailure extends CryptoListState{}