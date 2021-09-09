import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:mitane_frontend/application/product/events/product_events.dart';
import 'package:mitane_frontend/application/product/states/product_state.dart';
import 'package:mitane_frontend/infrastructure/repository/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository}) : super(ProductInitial());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    yield ProductFetching();

    if (event is ProductFetch) {
      final response = await productRepository.getProduct();
    }
  }
}
