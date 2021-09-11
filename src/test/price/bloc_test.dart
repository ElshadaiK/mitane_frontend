import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mitane_frontend/application/price/bloc/price_bloc.dart';
import 'package:mitane_frontend/application/price/events/price_event.dart';
import 'package:mitane_frontend/application/price/states/price_state.dart';
import 'package:mitane_frontend/domain/price/entity/price_model.dart';
import 'package:mitane_frontend/infrastructure/price/repository/price_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockPriceRepository extends Mock implements PriceRepository{}

void main() {
  MockPriceRepository mockPriceRepository = MockPriceRepository();
  Map<String,dynamic> attributeMap = new Map<String,dynamic>();
  Future<List<dynamic>> createFutureUsers() async {
    return [PriceDaily(product: attributeMap, price: [])];
  }
  blocTest<PriceBloc , PriceState>(
    'PriceFetch emits [PriceFetch] when Success',
    
    build: () {
      when(() => mockPriceRepository.getPrice(DateTime.now()))
        .thenAnswer((realInvocation) => createFutureUsers());
      return PriceBloc();
    },
    act: (bloc) => bloc.add(PriceFetch()),
    expect: (){
      return [isA<PriceFetchFailed>()];
    },
  );


  }