part of 'get_product_compatible_models_cubit.dart';

@immutable
abstract class GetProductCompatibleModelsState {}

class GetProductCompatibleModelsInitial
    extends GetProductCompatibleModelsState {}

class GetProductCompatibleModelsLoading
    extends GetProductCompatibleModelsState {}

class GetProductCompatibleModelsError extends GetProductCompatibleModelsState {}

class GetProductCompatibleModelsDone extends GetProductCompatibleModelsState {}
