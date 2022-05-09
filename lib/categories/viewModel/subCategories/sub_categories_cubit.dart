import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../model/sub_categories_model.dart';
import '../../repo/sub_categories_repo.dart';

part 'sub_categories_state.dart';

class SubCategoriesCubit extends Cubit<SubCategoriesState> {
  SubCategoriesCubit({
    @required this.parentId,
    this.categoryName,
  }) : super(SubCategoriesInitial());
  final dynamic parentId;
  final String? categoryName;

  List<SubCategory>? _subCategories = [];
  List<SubCategory> get subCategories => [...?_subCategories];

  Future<void> getSubCategories(
    context,
  ) async {
    emit(SubCategoriesLoading());
    var subCategoriesData = await SubCategoriesRepo.getSubCategories(
      context,
      parentId: parentId,
    );

    if (subCategoriesData == null) {
      emit(SubCategoriesNetworkError());

      return;
    }
    if (subCategoriesData.status == true) {
      _subCategories = subCategoriesData.data;
      emit(SubCategoriesDone());
    } else {
      emit(SubCategoriesError());
    }
  }
}
