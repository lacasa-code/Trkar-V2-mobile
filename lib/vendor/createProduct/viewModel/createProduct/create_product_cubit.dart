import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:textfield_tags/textfield_tags.dart';

import 'package:trkar/core/components/result_dialog.dart';
import 'package:trkar/core/helper/laravel_exception.dart';
import 'package:trkar/core/extensions/string.dart';
import 'package:trkar/vendor/createProduct/repo/create_product_repo.dart';
import 'package:trkar/vendor/createProduct/viewModel/storeBranches/store_branches_cubit.dart';
import '../../repo/add_quantity_to_branch_repo.dart';
import '../../repo/add_product_tag_repo.dart';

import '../../model/branch_quantity_fields.dart';
import '../../view/widgets/create_product_dropdown_tile.dart';

part 'create_product_state.dart';

enum ViewMode {
  basicInformation,
  allInformation,
}

class CreateProductCubit extends Cubit<CreateProductState> {
  CreateProductCubit() : super(CreateProductInitial());

  // final List<CategoryDropdownModel> _categoryList = [];

  // List<CategoryDropdownModel> get categoryList => [..._categoryList];
  int? _productTypeId,
      manufacturerId,
      originalCountryId,
      carMadeId,
      carModelId,
      storeId,
      carEngineId,
      manufacturingYearId;
  final formKey = GlobalKey<FormState>();
  var nameArController = TextEditingController();
  var nameEnController = TextEditingController();
  var actualPriceController = TextEditingController();
  var priceAfterDiscountController = TextEditingController();
  var descArController = TextEditingController();
  var descEnController = TextEditingController();
  var serialNumberController = TextEditingController();
  var productTagController = TextfieldTagsController();
  var priceController = TextEditingController();
  var minimumQuantityController = TextEditingController();
  List<String> productTags = [];
  final List<BranchQuantityFields> _branchQuantityFields = [
    BranchQuantityFields(
      quantityController: TextEditingController(),
      quantityReminderController: TextEditingController(),
    ),
  ];
  List<BranchQuantityFields> get branchQuantityFields =>
      [..._branchQuantityFields];

  String? nameArValidate(String? v) {
    if (v!.isEmpty) {
      return 'required'.translate.toTitleCase;
    }
    return null;
  }

  String? nameEnValidate(String? v) {
    if (v!.isEmpty) {
      return 'required'.translate.toTitleCase;
    }
    return null;
  }

  String? productPriceValidate(String? v) {
    if (v!.isEmpty) {
      return 'required'.translate.toTitleCase;
    }
    return null;
  }

  String? productPriceAfterDiscountValidate(String? v) {
    if (v!.isEmpty) {
      return 'price_after_discount_required'.translate.toTitleCase;
    }
    return null;
  }

  String? priceValidate(String? v) {
    if (v!.isEmpty) {
      return 'price_required'.translate.toTitleCase;
    }
    return null;
  }

  String? categoryValidate(String? v) {
    if (v == null) {
      return 'category_required'.translate.toTitleCase;
    }
    return null;
  }

  String? subcategoryValidate(String? v) {
    if (v == null) {
      return 'sub_category_required'.translate.toTitleCase;
    }
    return null;
  }

  String? productTypeValidate(String? v) {
    if (v == null) {
      return 'product_type_required'.translate.toTitleCase;
    }
    return null;
  }

  String? serialNumberValidate(String? v) {
    if (v!.isEmpty) {
      return 'product_no_required'.translate.toTitleCase;
    }
    return null;
  }

  String? priceAfterDiscountValidate(String? v) {
    if (v!.isEmpty) {
      return 'price_after_discount_required'.translate.toTitleCase;
    }
    return null;
  }

  String? descriptionArValidate(String? v) {
    if (v!.isEmpty) {
      return 'description_ar_required'.translate.toTitleCase;
    }
    return null;
  }

  String? descriptionEnValidate(String? v) {
    if (v!.isEmpty) {
      return 'description_en_required'.translate.toTitleCase;
    }
    return null;
  }

  String? quantityValidate(String? v) {
    if (v!.isEmpty) {
      return 'quantity_required'.translate.toTitleCase;
    }
    return null;
  }

  String? quantityReminderValidate(String? v) {
    if (v!.isEmpty) {
      return 'quantity_reminder_required'.translate.toTitleCase;
    }
    return null;
  }

  String? minimumQuantityValidate(String? v) {
    if (v!.isEmpty) {
      return 'minimum_quantity_required'.translate.toTitleCase;
    }
    return null;
  }

  String? productTagValidate(String? v) {
    if (v!.isEmpty) {
      return 'product_tags_required'.translate.toTitleCase;
    }
    return null;
  }

  String? manufacturerValidate(String? v) {
    if (v == null) {
      return 'manufacturers_required'.translate.toTitleCase;
    }
    return null;
  }

  String? manufacturingYearValidate(String? v) {
    if (v == null) {
      return 'manufacturing_year_required'.translate.toTitleCase;
    }
    return null;
  }

  String? countryOfOriginValidate(String? v) {
    if (v == null) {
      return 'country_of_origin_required'.translate.toTitleCase;
    }
    return null;
  }

  String? branchValidate(String? v) {
    if (v == null) {
      return 'branch_required'.translate.toTitleCase;
    }
    return null;
  }

  String? modelValidate(String? v) {
    if (v == null && carMadeId != null) {
      return 'model_required'.translate.toTitleCase;
    }
    return null;
  }

  String? engineValidate(String? v) {
    if (v == null && carMadeId != null) {
      return 'engine_required'.translate.toTitleCase;
    }
    return null;
  }

  List<int> _categoryIds = [];
  ViewMode _viewMode = ViewMode.basicInformation;
  File? _pickedImage;
  List<int> get categoryIds => [..._categoryIds];
  File? get pickedImage => _pickedImage;
  int? get productTypeId => _productTypeId;
  ViewMode get viewMode => _viewMode;

  void pickImage() async {
    var pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage == null) {
      return;
    }
    _pickedImage = File(pickedImage.path);
    emit(ProductImagePicked());
  }

  void validateCategoryId(
    int categoryId, {
    required int categoryIndex,
  }) {
    log('length is ${categoryIds.length}');
    if (categoryIndex == -1) {
      _categoryIds.clear();
    }
    for (var i = 0; i < _categoryIds.length; i++) {
      if (i > categoryIndex) {
        _categoryIds.removeAt(i);
      }
    }
    log('length is ${categoryIds.length}');
    var index = _categoryIds.indexWhere((element) => element == categoryId);

    if (index >= 0) {
      for (var i = 0; i < _categoryIds.length; i++) {
        if (i > index) {
          _categoryIds.removeAt(i);
        }
      }
    } else {
      _categoryIds.add(categoryId);
    }
    emit(CategoryDropDownStateChanged());
  }

  Future<void> createProduct(
    BuildContext context,
  ) async {
    if (!validate() || _pickedImage == null) {
      if (_pickedImage == null) {
        Fluttertoast.showToast(
          msg: 'product_image_required'.translate,
          backgroundColor: Colors.red,
        );
      }
      return;
    }
    emit(CreateProductLoading());
    try {
      var createProductData = await CreateProductRepo.createNewProduct(
        context,
        body: {
          'name_ar': nameArController.text,
          'name_en': nameEnController.text,
          'details_ar': descArController.text,
          'details_en': descEnController.text,
          'actual_price': actualPriceController.text,
          'product_type_id': productTypeId,
          'discount': priceAfterDiscountController.text,
          'image': _pickedImage == null
              ? null
              : await MultipartFile.fromFile(_pickedImage?.path ?? ''),
          'category_id': categoryIds.first,
          'subcategory_id': categoryIds.last,
          'year_id': manufacturingYearId,
          'manufacturer_id': manufacturerId,
          'original_country_id': originalCountryId,
          'store_id': context.read<StoreBranchesCubit>().storeId,
          'serial_number': serialNumberController.text,
          'price': priceController.text,
          if (carMadeId != null) ...{
            'car_made_id': carMadeId,
            'car_model_id': carModelId,
            'car_engine_id': carEngineId,
          },
          if (productTypeId == 2) ...{
            'minimum_quntity': minimumQuantityController.text,
          },
        },
      );
      if (createProductData == null) {
        emit(CreateProductError());
        showDialog(
          context: context,
          builder: (_) => ResultDialog(
            resultType: ResultType.failed,
            message: 'network'.translate,
          ),
        );
        return;
      }
      if (createProductData.status == true) {
        for (var i = 0; i < _branchQuantityFields.length; i++) {
          var field = _branchQuantityFields[i];
          await addQuantityToBranch(
            context,
            body: {
              'product_id': createProductData.data?.id,
              'quantity_reminder': field.quantityReminderController.text,
              'quantity': field.quantityController.text,
              'branch_id': field.branchId,
            },
          );
          await Future.delayed(
            const Duration(milliseconds: 1),
            () {},
          );
        }
        for (var i = 0; i < productTagController.getTags!.length; i++) {
          var tag = productTagController.getTags![i];
          await addProductTags(
            context,
            body: {
              'product_id': createProductData.data?.id,
              'name': tag,
            },
          );
          await Future.delayed(
            const Duration(milliseconds: 1),
            () {},
          );
        }
        Fluttertoast.showToast(
          msg: createProductData.message ?? '',
        );
        emit(CreateProductDone());
      } else {
        var errorMessage = '';
        if (createProductData.message != null) {
          errorMessage = createProductData.message ?? '';
        } else if (createProductData.errorMessages != null) {
          createProductData.errorMessages?.forEach((key, value) {
            errorMessage += '${value[0]} \n';
          });
        }
        showDialog(
          context: context,
          builder: (_) => ResultDialog(
            resultType: ResultType.failed,
            message: errorMessage,
          ),
        );
        emit(CreateProductError());
      }
    } on LaravelException catch (error) {
      emit(CreateProductError());

      showDialog(
        context: context,
        builder: (_) => ResultDialog(
          resultType: ResultType.failed,
          message: error.exception,
        ),
      );
    }
  }

  Future<void> addQuantityToBranch(
    context, {
    required Map<String, dynamic> body,
  }) async {
    try {
      var addToBranchData = await AddQuantityToBranchRepo.addQuantity(
        context,
        body: body,
      );
      if (addToBranchData == null) {
        emit(CreateProductError());
        showDialog(
          context: context,
          builder: (_) => ResultDialog(
            resultType: ResultType.failed,
            message: 'network'.translate,
          ),
        );
        return;
      }
      if (addToBranchData.status == false) {
        emit(CreateProductError());
        showDialog(
          context: context,
          builder: (_) => ResultDialog(
            resultType: ResultType.failed,
            message: addToBranchData.message ?? 'something_wrong'.translate,
          ),
        );
        return;
      }
    } on LaravelException catch (error) {
      emit(CreateProductError());
      showDialog(
        context: context,
        builder: (_) => ResultDialog(
          resultType: ResultType.failed,
          message: error.exception,
        ),
      );
      return;
    }
  }

  Future<void> addProductTags(
    context, {
    required Map<String, dynamic> body,
  }) async {
    try {
      var addProductTagData = await AddProductTagRepo.addTag(
        context,
        body: body,
      );
      if (addProductTagData == null) {
        emit(CreateProductError());
        showDialog(
          context: context,
          builder: (_) => ResultDialog(
            resultType: ResultType.failed,
            message: 'network'.translate,
          ),
        );
        return;
      }
      if (addProductTagData.status == false) {
        emit(CreateProductError());
        showDialog(
          context: context,
          builder: (_) => ResultDialog(
            resultType: ResultType.failed,
            message: addProductTagData.message ?? 'something_wrong'.translate,
          ),
        );
        return;
      }
    } on LaravelException catch (error) {
      emit(CreateProductError());
      showDialog(
        context: context,
        builder: (_) => ResultDialog(
          resultType: ResultType.failed,
          message: error.exception,
        ),
      );
      return;
    }
  }

  // void addToCategoryList({
  //   required CategoriesCubit categoriesCubit,
  //   required int parentId,
  //   required int dropdownId,
  // }) {
  //   for (var i = 0; i < _categoryList.length; i++) {
  //     log("ID=>${_categoryList[i].id}");
  //   }

  //   log('categoryId = $parentId');
  //   log('categoryHasChild = ${categoriesCubit.hasSubCategory(parentId)}');
  //   _categoryList.add(CategoryDropdownModel(
  //     id: dropdownId,
  //     dropdown: CreateProductDropdownTile(
  //       enabled: true,
  //       title: _categoryList.isEmpty
  //           ? 'category'
  //           : _categoryList.length == 1
  //               ? 'sub_category'
  //               : 'sub_sub_category',
  //       values: categoriesCubit
  //           .subCategories(parentId)
  //           .map((e) => e.name ?? '')
  //           .toList(),
  //       onChanged: (v) {
  //         if (v == null) {
  //           return;
  //         }
  //         var dropdownIndex =
  //             _categoryList.indexWhere((e) => e.id == dropdownId);
  //         log('dropdownIndex => $dropdownIndex id $dropdownId');
  //         if (dropdownIndex >= 0) {
  //           for (var i = 0; i < _categoryList.length; i++) {
  //             if (i > dropdownIndex) {
  //               _categoryList.removeAt(i);
  //             }
  //           }
  //         }
  //         var categoryId = categoriesCubit.allcategory
  //             .firstWhere((element) => element.name == v)
  //             .id;

  //         _categoryId = categoryId;
  //         if (categoriesCubit.hasSubCategory(
  //           categoryId,
  //         )) {
  //           addToCategoryList(
  //             categoriesCubit: categoriesCubit,
  //             parentId: categoryId ?? 0,
  //             dropdownId: _categoryList.length + 1,
  //           );
  //         }
  //       },
  //     ),
  //   ));
  //   log('length => ${_categoryList.length}');

  //   emit(CategoryDropDownStateChanged());
  // }

  void changeProductTypeId(int? productTypeId) {
    if (productTypeId == null) {
      return;
    }
    _productTypeId = productTypeId;
    emit(ProductTypeStateChanged());
  }

  bool validate() => formKey.currentState?.validate() ?? false;

  void changeViewMode(context) {
    if (!validate() || pickedImage == null) {
      showDialog(
        context: context,
        builder: (_) => ResultDialog(
          resultType: ResultType.none,
          message: 'enter_product_data'.translate,
        ),
      );

      return;
    }
    _viewMode = ViewMode.allInformation;
    emit(ViewModeStateChanged());
  }

  addQuantityFields() {
    _branchQuantityFields.add(
      BranchQuantityFields(
        quantityController: TextEditingController(),
        quantityReminderController: TextEditingController(),
      ),
    );
    emit(QuantityFieldsAdded());
  }

  deleteFields(int index) {
    _branchQuantityFields.removeAt(index);
    emit(QuantityFieldsAdded());
  }

  void onTagsFieldChanged(String value) {
    if (value.isEmpty) {
      productTags.clear();
      return;
    }
    productTags = value.split(',');
  }
}
