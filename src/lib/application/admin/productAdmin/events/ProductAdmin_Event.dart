import 'package:equatable/equatable.dart';
import 'package:mitane_frontend/domain/admin/productAdmin/entity/ProductAdmin.dart';

abstract class ProductAdminEvent extends Equatable {
  const ProductAdminEvent();
}

class ProductAdminLoad extends ProductAdminEvent {
  const ProductAdminLoad();

  @override
  List<Object> get props => [];
}

class ProductAdminCreate extends ProductAdminEvent {
  final Product product;

  const ProductAdminCreate(this.product);

  @override
  List<Object> get props => [product];

  @override
  String toString() => 'User Created {User: $product}';
}

class ProductAdminUpdate extends ProductAdminEvent {
  final Product product;

  const ProductAdminUpdate(this.product);

  @override
  List<Object> get props => [product];

  @override
  String toString() => 'User Updated {User: $product}';
}

class ProductAdminDelete extends ProductAdminEvent {
  final String name;

  const ProductAdminDelete(this.name);

  @override
  List<Object> get props => [name];

  @override
  toString() => 'User Deleted {User Id: $name}';
}