part of 'store_branches_cubit.dart';

@immutable
abstract class StoreBranchesState {}

class StoreBranchesInitial extends StoreBranchesState {}

class BranchesLoading extends StoreBranchesState {}

class StoreLoading extends StoreBranchesState {}

class BranchesError extends StoreBranchesState {}

class StoreError extends StoreBranchesState {}

class BranchesDone extends StoreBranchesState {}

class StoreDone extends StoreBranchesState {}
