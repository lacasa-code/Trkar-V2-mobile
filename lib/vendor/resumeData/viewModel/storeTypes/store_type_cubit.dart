import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trkar/vendor/resumeData/model/store_type_model.dart';
import '../../model/create_store_model.dart';
import '../../repo/store_types_repo.dart';

part 'store_type_state.dart';

class StoreTypeCubit extends Cubit<StoreTypeState> {
  StoreTypeCubit() : super(StoreTypeInitial());

  Future<void> getStoreTypes(context) async {
    emit(StoreTypeLoading());

    var storeData = await StoreTypesRepo.storeTypes(context);

    if (storeData == null) {
      emit(StoreTypeError());
      return;
    }
    if (storeData.status == true) {
      _types = storeData.data;
      emit(StoreTypeDone());
    } else {
      emit(StoreTypeError());
    }
  }

  List<StoreType>? _types = [];
  List<StoreType> get types => [...?_types];
}
