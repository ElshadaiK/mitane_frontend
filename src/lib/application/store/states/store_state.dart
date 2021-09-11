import 'package:mitane_frontend/domain/store/entity/store_model.dart';

abstract class StoreState{}

class StoreInit extends StoreState{}

class StoreFetching extends StoreState{}

class StoreFetched extends StoreState{
  final dynamic stores;
  StoreFetched({required this.stores});
}
class StoreAllFetched extends StoreState{
  final List<dynamic> stores;
  StoreAllFetched({required this.stores});
}
class StoreFetchedAll extends StoreState{
  final dynamic stores;
  StoreFetchedAll({required this.stores});
}

class StoreFetchFailed extends StoreState{}


class StoreAdded extends StoreState{}

class StoreAdding extends StoreState{}

class StoreAddFailed extends StoreState{}

class StoreUpdate extends StoreState{}
class StoreUpdating extends StoreState{}

class StoreUpdateFailed extends StoreState{}

class StoreDelete extends StoreState{}
class StoreDeleting extends StoreState{}

class StoreDeleteFailed extends StoreState{}

