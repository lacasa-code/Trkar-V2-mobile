import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trkar/core/helper/laravel_exception.dart';
import '../../model/get_product_compatible_models_model.dart';
import '../../repo/get_product_compatible_models_repo.dart';

part 'get_product_compatible_models_state.dart';

class GetProductCompatibleModelsCubit
    extends Cubit<GetProductCompatibleModelsState> {
  GetProductCompatibleModelsCubit()
      : super(GetProductCompatibleModelsInitial());

  List<CompatibleModel>? _compatibleModels = [];
  List<CompatibleModel> get compatibleModels => [...?_compatibleModels];

  Future<void> getCompatibleModels(
    context, {
    @required int? productId,
  }) async {
    emit(GetProductCompatibleModelsLoading());
    try {
      var compatibleModelsData =
          await GetProductCompatibleModelsRepo.getCompatibleModels(
        context,
        productId: productId,
      );

      if (compatibleModelsData == null) {
        emit(GetProductCompatibleModelsError());
        return;
      }
      if (compatibleModelsData.status == true) {
        _compatibleModels = compatibleModelsData.data;
        emit(GetProductCompatibleModelsDone());
      } else {
        emit(GetProductCompatibleModelsError());
      }
    } on LaravelException catch (error) {
      emit(GetProductCompatibleModelsError());
    }
  }
}
