part of 'crypto_list_bloc.dart';

abstract class CryptoListState extends Equatable{}

class CryptoListInitial extends CryptoListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CryptoListLoading extends CryptoListState {
  List<Object?> get props => [];
}

class CryptoListLoaded extends CryptoListState {
  CryptoListLoaded({required this.cryptoList});

  final List<CryptoCoin> cryptoList;
  @override
  List<Object?> get props => [cryptoList];
}

class CryptoListLoadingFailure extends CryptoListState{
  CryptoListLoadingFailure({this.exception});
  
  final Object? exception;
  @override
  List<Object?> get props => [exception];
}