part of 'sync_bloc.dart';

abstract class SyncState extends Equatable {
  const SyncState();

  @override
  List<Object?> get props => [];
}

class SyncInitial extends SyncState {}

class SyncLoading extends SyncState {}

class SyncSuccess extends SyncState {}

class SyncFailure extends SyncState {
  final String error;

  const SyncFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
