part of 'get_product_tags_cubit.dart';

@immutable
abstract class GetProductTagsState {}

class GetProductTagsInitial extends GetProductTagsState {}

class GetProductTagsLoading extends GetProductTagsState {}

class GetProductTagsError extends GetProductTagsState {}

class GetProductTagsDone extends GetProductTagsState {}
