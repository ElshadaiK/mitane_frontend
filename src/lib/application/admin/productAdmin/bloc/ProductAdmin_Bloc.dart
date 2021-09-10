import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/admin/productAdmin/events/ProductAdmin_Event.dart';
import 'package:mitane_frontend/application/admin/productAdmin/states/ProductAdmin_State.dart';
import 'package:mitane_frontend/infrastructure/admin/productAdmin/repository/ProductAdmin_Repository.dart';

class ProductAdminBloc extends Bloc<ProductAdminEvent, ProductAdminState> {
  final ProductAdminRepository productAdminRepository;

  ProductAdminBloc({required this.productAdminRepository}) : super(ProductAdminLoading());

  @override
  Stream<ProductAdminState> mapEventToState(ProductAdminEvent event) async* {
    if (event is ProductAdminLoad) {
      yield ProductAdminLoading();
      try {
        final productAdmins = await productAdminRepository.fetchAll();
        print("Successfully listed");
        yield ProductAdminOperationSuccess(productAdmins);
      } catch (_) {
        yield ProductAdminOperationFailure();
      }
    }

    if (event is ProductAdminCreate) {
      try {
        await productAdminRepository.create(event.product);
        print(event.product);
        final productAdmins = await productAdminRepository.fetchAll();
        print("Successfully created and listed");
        yield ProductAdminOperationSuccess(productAdmins);
      } catch (_) {
        yield ProductAdminOperationFailure();
      }
    }

    if (event is ProductAdminUpdate) {
      try {
        await productAdminRepository.update(event.product.id ?? "", event.product);
        final productAdmins = await productAdminRepository.fetchAll();
        print("Successfully updated and listed");
        yield ProductAdminOperationSuccess(productAdmins);
      } catch (_) {
        yield ProductAdminOperationFailure();
      }
    }

    if (event is ProductAdminDelete) {
      try {
        await productAdminRepository.delete(event.name);
        final productAdmins = await productAdminRepository.fetchAll();
        print("Successfully deleted and listed");
        yield ProductAdminOperationSuccess(productAdmins);
      } catch (_) {
        yield ProductAdminOperationFailure();
      }
    }
  }
}