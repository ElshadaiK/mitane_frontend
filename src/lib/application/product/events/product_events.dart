import 'package:equatable/equatable.dart';
import 'package:mitane_frontend/domain/product/entity/product_model.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class ProductAdminLoad extends ProductEvent {
  const ProductAdminLoad();

  @override
  List<Object> get props => [];
}

class ProductAdminCreate extends ProductEvent {
  final Product product;

  const ProductAdminCreate(this.product);

  @override
  List<Object> get props => [product];

  @override
  String toString() => 'User Created {User: $product}';
}

class ProductAdminUpdate extends ProductEvent {
  final Product product;

  const ProductAdminUpdate(this.product);

  @override
  List<Object> get props => [product];

  @override
  String toString() => 'User Updated {User: $product}';
}

class ProductAdminDelete extends ProductEvent {
  final String name;

  const ProductAdminDelete(this.name);

  @override
  List<Object> get props => [name];

  @override
  toString() => 'User Deleted {User Id: $name}';
}
