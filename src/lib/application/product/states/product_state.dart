import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductAdminLoading extends ProductState {}

class ProductAdminOperationSuccess extends ProductState {
  final Iterable<dynamic> products;

  ProductAdminOperationSuccess([this.products = const []]);

  @override
  List<Object> get props => [products];
}

class ProductAdminOperationFailure extends ProductState {}
