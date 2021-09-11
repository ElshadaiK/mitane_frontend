import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mitane_frontend/application/machinery/states/machinery_state.dart';
import 'package:mitane_frontend/infrastructure/machinery/data_provider/machinery_provider.dart';
import 'package:mitane_frontend/application/machinery/events/machinery_events.dart';
import 'package:mitane_frontend/application/machinery/bloc/machinery_bloc.dart';
import 'package:mitane_frontend/infrastructure/machinery/repository/machinery_repository.dart';
import 'package:mitane_frontend/domain/machinery/entity/machinery_model.dart';

import 'package:mocktail/mocktail.dart';

class MockMachineryBloc extends MockBloc<MachineryEvent, MachineryState>
    implements MachineryBloc {}

class MockMachineryRepository extends Mock implements MachineryRepository {}

void main() {
  MockMachineryRepository machineryRepository = MockMachineryRepository();
  
  final machinery = Machinery(id: "1", name: "Tractor");
  Future<List<Machinery>> createMachineries() async {
    return [Machinery(id: "1", name: "Tractor")];
  }

  Future<Machinery> createMachinery() async {
    return Machinery(id: "1", name: "Tractor");
  }

  ;

  setUp(() {
    machineryRepository = MockMachineryRepository();
    // machineryBloc =
    //     machineryBloc(machineryRepository: machineryRepository);
  });

  blocTest<MachineryBloc, MachineryState>(
      'emits [machineryLoading,machineryAdminOperationSuccess] when successful',
      build: () {
        when(() => machineryRepository.fetchAll())
            .thenAnswer((invocation) => createMachineries());
        return MachineryBloc(machineryRepository: machineryRepository);
      },
      act: (bloc) => bloc.add(MachineryAdminLoad()),
      expect: () {
        return [MachineryAdminLoading(), isA<MachineryAdminOperationSuccess>()];
      });

  blocTest<MachineryBloc, MachineryState>(
      'emits [machineryLoading,machineryAdminOperationFailure] when unsuccessful',
      build: () {
        return MachineryBloc(machineryRepository: machineryRepository);
      },
      act: (bloc) => bloc.add(MachineryAdminLoad()),
      expect: () {
        return [MachineryAdminLoading(), MachineryAdminOperationFailure()];
      });

  blocTest<MachineryBloc, MachineryState>(
      'emits [MachineryLoading,MachineryAdminOperationSuccess] when successful',
      build: () {
        when(() => machineryRepository.create(machinery))
            .thenAnswer((invocation) => createMachinery());
        when(() => machineryRepository.fetchAll())
            .thenAnswer((invocation) => createMachineries());
        return MachineryBloc(machineryRepository: machineryRepository);
      },
      act: (bloc) => bloc.add(MachineryAdminCreate(machinery)),
      expect: () {
        return [isA<MachineryAdminOperationSuccess>()];
      });

  blocTest<MachineryBloc, MachineryState>(
      'emits [MachineryAdminOperationSuccess] when successful',
      build: () {
        when(() => machineryRepository.update("1", machinery))
            .thenAnswer((invocation) => createMachinery());
        when(() => machineryRepository.fetchAll())
            .thenAnswer((invocation) => createMachineries());
        return MachineryBloc(machineryRepository: machineryRepository);
      },
      act: (bloc) => bloc.add(MachineryAdminUpdate(machinery)),
      expect: () {
        return [isA<MachineryAdminOperationSuccess>()];
      });

  blocTest<MachineryBloc, MachineryState>(
      'emits [machineryAdminOperationSuccess] when successful',
      build: () {
        when(() => machineryRepository.delete("1"))
            .thenAnswer((invocation) => createMachinery());
        when(() => machineryRepository.fetchAll())
            .thenAnswer((invocation) => createMachineries());
        return MachineryBloc(machineryRepository: machineryRepository);
      },
      act: (bloc) => bloc.add(MachineryAdminDelete("1")),
      expect: () {
        return [isA<MachineryAdminOperationSuccess>()];
      });
}
