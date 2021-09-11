import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/store/events/store_events.dart';
import 'package:mitane_frontend/application/store/states/store_state.dart';
import 'package:mitane_frontend/domain/store/entity/store_model.dart';
import 'package:mitane_frontend/infrastructure/store/repository/store_repository.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  final StoreRepository storeRepository;
  StoreBloc({required this.storeRepository}) : super(StoreInit());

  @override
  Stream<StoreState> mapEventToState(StoreEvent event) async* {
    if (event is FetchStore) {
      final stores = await storeRepository.getSelfStore();
      print(stores);
      if (stores != []) {
        yield StoreFetched(stores: stores);
      } else
        yield StoreFetchFailed();
    }
    if (event is FetchStoreAll) {
      final stores = await storeRepository.getAllStore();
      if (stores != []) {
        yield StoreAllFetched(stores: stores);
      } else
        yield StoreFetchFailed();
    }

    if (event is AddStore) {
      try {
        final storeCheck = await storeRepository.getSelfStore();
        if (storeCheck != []) {
          print('store exist');
          final result = await storeRepository.addItem(event.item);
          if (result) {
            print("added item");
            yield StoreAdded();
          } else {
            yield StoreAddFailed();
          }
        } else {
          final creatStore = await storeRepository.createStore();
          if (creatStore) {
            print('store created');
            yield StoreAddFailed();
          }
        }
      } catch (e) {
        yield StoreAddFailed();
      }
    }

    if (event is UpdateStore) {}
    if (event is DeleteStore) {}
  }
}
