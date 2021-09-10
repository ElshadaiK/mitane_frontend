import 'package:equatable/equatable.dart';

abstract class MachineryState extends Equatable {
  const MachineryState();

  @override
  List<Object> get props => [];
}

class MachineryAdminLoading extends MachineryState {}

class MachineryAdminOperationSuccess extends MachineryState {
  final Iterable<dynamic> machineries;

  MachineryAdminOperationSuccess([this.machineries = const []]);

  @override
  List<Object> get props => [machineries];
}

class MachineryAdminOperationFailure extends MachineryState {}
