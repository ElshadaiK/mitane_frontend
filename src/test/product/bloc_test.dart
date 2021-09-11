import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mitane_frontend/application/product/bloc/product_bloc.dart';
import 'package:mitane_frontend/application/product/events/product_events.dart';
import 'package:mitane_frontend/application/product/states/product_state.dart';
import 'package:mitane_frontend/domain/product/entity/product_model.dart';
import 'package:mitane_frontend/infrastructure/product/repository/product_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockProductRepository extends Mock implements ProductRepository{}

void main() {
  MockProductRepository mockProductRepository = MockProductRepository();
  
  final product = Product(category: "some",id: "aa",name: "aaa");

  Future<List<Product>> createFutureProducts() async {
    return [Product(category: "some",id: "aa",name: "aaa")];
  }
  Future<Product> createFutureProduct() async {
    return Product(category: "some",id: "aa",name: "aaa");
  }
  Future<void> createFutureVoid() async {
    return;
  }
  blocTest<ProductBloc, ProductState>(
    'ProductAdminLoad emits [UserAdminOperationSuccess] when Success',
    
    build: () {
      when(() => mockProductRepository.fetchAll())
        .thenAnswer((realInvocation) => createFutureProducts());
      return ProductBloc(productRepository: mockProductRepository);
    },
    act: (bloc) => bloc.add(ProductAdminLoad()),
    expect: (){
      return [ isA<ProductAdminLoading>(),isA<ProductAdminOperationSuccess>()];
    },
  );

  blocTest<ProductBloc , ProductState>(
    'ProductAdminCreate emits [UserAdminOperationSuccess] when Success',
    
    build: () {
      when(() => mockProductRepository.create(product))
        .thenAnswer((realInvocation) => createFutureProduct());
      when(() => mockProductRepository.fetchAll())
        .thenAnswer((realInvocation) => createFutureProducts());
      return ProductBloc(productRepository: mockProductRepository);
    },
    act: (bloc) => bloc.add(ProductAdminCreate(product)),
    expect: (){
      return [isA<ProductAdminOperationSuccess>()];
    },
  );

  blocTest<ProductBloc , ProductState>(
    'ProductAdminUpdate emits [UserAdminOperationSuccess] when Success',
    
    build: () {
      when(() => mockProductRepository.update("aa", product))
        .thenAnswer((realInvocation) => createFutureProduct());
      when(() => mockProductRepository.fetchAll())
        .thenAnswer((realInvocation) => createFutureProducts());
      return ProductBloc(productRepository: mockProductRepository);
    },
    act: (bloc) => bloc.add(ProductAdminUpdate(product)),
    expect: (){
      return [isA<ProductAdminOperationSuccess>()];
    },
  );
  
  blocTest<ProductBloc , ProductState>(
    'ProductAdminDelete emits [UserAdminOperationSuccess] when failure',
    
    build: () {
      when(() => mockProductRepository.delete("aa"))
        .thenAnswer((realInvocation) => createFutureVoid());
      when(() => mockProductRepository.fetchAll())
        .thenAnswer((realInvocation) => createFutureProducts());
      return ProductBloc(productRepository: mockProductRepository);
    },
    act: (bloc) => bloc.add(ProductAdminDelete("aa")),
    expect: (){
      return [isA<ProductAdminOperationSuccess>()];
    },
  );

  }