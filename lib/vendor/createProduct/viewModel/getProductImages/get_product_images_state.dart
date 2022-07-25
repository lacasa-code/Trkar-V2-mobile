part of 'get_product_images_cubit.dart';

@immutable
abstract class GetProductImagesState {}

class GetProductImagesInitial extends GetProductImagesState {}

class GetProductImagesLoading extends GetProductImagesState {}

class GetProductImagesError extends GetProductImagesState {}

class GetProductImagesDone extends GetProductImagesState {}
class DeleteLoading extends GetProductImagesState {}
class Deleted extends GetProductImagesState {}
class Error extends GetProductImagesState {}
