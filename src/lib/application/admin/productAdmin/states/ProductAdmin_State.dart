import 'package:equatable/equatable.dart';

abstract class ProductAdminState extends Equatable {
  const ProductAdminState();

  @override
  List<Object> get props => [];
}

class ProductAdminLoading extends ProductAdminState {}

class ProductAdminOperationSuccess extends ProductAdminState {
  final Iterable<dynamic> products;

  ProductAdminOperationSuccess([this.products = const []]);

  @override
  List<Object> get props => [products];
}

class ProductAdminOperationFailure extends ProductAdminState {}