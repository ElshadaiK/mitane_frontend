import 'package:mitane_frontend/domain/store/entity/store_model.dart';

abstract class StoreEvent{}


class FetchStore extends StoreEvent{}
class FetchStoreAll extends StoreEvent{}
class AddStore extends StoreEvent{
  final StoreItem item;
  AddStore({required this.item});
}

class UpdateStore extends StoreEvent{}

class DeleteStore extends StoreEvent{}