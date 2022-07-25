import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trkar/core/helper/laravel_exception.dart';
import '../../model/get_product_tags_model.dart';
import '../../repo/get_product_tags_repo.dart';
part 'get_product_tags_state.dart';

class GetProductTagsCubit extends Cubit<GetProductTagsState> {
  GetProductTagsCubit() : super(GetProductTagsInitial());

  List<Tag>? _tags = [];
  List<Tag> get tags => [...?_tags];

  Future<void> getProductTags(
    context, {
    @required int? productId,
  }) async {
    emit(GetProductTagsLoading());
    try {
      var productTagsData = await GetProductTagsRepo.getProductTagsModel(
        context,
        productId: productId,
      );
      if (productTagsData == null) {
        emit(GetProductTagsError());
        return;
      }
      if (productTagsData.status == true) {
        _tags = productTagsData.data;
        emit(GetProductTagsDone());
      } else {
        emit(GetProductTagsError());
      }
    } on LaravelException catch (_) {
      emit(GetProductTagsError());
    }
  }
}
