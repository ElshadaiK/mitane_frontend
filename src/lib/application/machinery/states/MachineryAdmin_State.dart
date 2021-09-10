import 'package:equatable/equatable.dart';

abstract class MachineryAdminState extends Equatable {
  const MachineryAdminState();

  @override
  List<Object> get props => [];
}

class MachineryAdminLoading extends MachineryAdminState {}

class MachineryAdminOperationSuccess extends MachineryAdminState {
  final Iterable<dynamic> machineries;

  MachineryAdminOperationSuccess([this.machineries = const []]);

  @override
  List<Object> get props => [machineries];
}

class MachineryAdminOperationFailure extends MachineryAdminState {}