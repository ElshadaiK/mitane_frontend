import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/product/events/product_events.dart';
import 'package:mitane_frontend/application/product/states/product_state.dart';
import 'package:mitane_frontend/infrastructure/product/repository/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository}) : super(ProductAdminLoading());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is ProductAdminLoad) {
      yield ProductAdminLoading();
      try {
        final productAdmins = await productRepository.fetchAll();
        print("Successfully listed");
        yield ProductAdminOperationSuccess(productAdmins);
      } catch (_) {
        yield ProductAdminOperationFailure();
      }
    }

    if (event is ProductAdminCreate) {
      try {
        await productRepository.create(event.product);
        print(event.product);
        final productAdmins = await productRepository.fetchAll();
        print("Successfully created and listed");
        yield ProductAdminOperationSuccess(productAdmins);
      } catch (_) {
        yield ProductAdminOperationFailure();
      }
    }

    if (event is ProductAdminUpdate) {
      try {
        await productRepository.update(event.product.id ?? "", event.product);
        final productAdmins = await productRepository.fetchAll();
        print("Successfully updated and listed");
        yield ProductAdminOperationSuccess(productAdmins);
      } catch (_) {
        yield ProductAdminOperationFailure();
      }
    }

    if (event is ProductAdminDelete) {
      try {
        await productRepository.delete(event.name);
        final productAdmins = await productRepository.fetchAll();
        print("Successfully deleted and listed");
        yield ProductAdminOperationSuccess(productAdmins);
      } catch (_) {
        yield ProductAdminOperationFailure();
      }
    }
  }
}
