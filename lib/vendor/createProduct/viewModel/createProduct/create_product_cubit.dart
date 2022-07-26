import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:trkar/categories/viewModel/parentOfSubCategory/parent_of_sub_category_cubit.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/filterCars/viewModel/carMades/filter_cars_cubit.dart';
import 'package:trkar/vendor/createProduct/viewModel/getProductCompatibleModels/get_product_compatible_models_cubit.dart';
import 'package:trkar/vendor/createProduct/viewModel/getProductImages/get_product_images_cubit.dart';
import 'package:trkar/vendor/createProduct/viewModel/getProductQuantity/get_product_quantity_cubit.dart';
import 'package:trkar/vendor/createProduct/viewModel/getProductTags/get_product_tags_cubit.dart';
import 'package:trkar/vendor/home/viewModel/productDetails/product_details_cubit.dart';

import '../../../../core/components/result_dialog.dart';
import '../../../../core/helper/laravel_exception.dart';
import '../../../../core/extensions/string.dart';
import '../../../../core/helper/helper.dart';
import '../../../home/model/my_products_model.dart';
import '../../../home/viewModel/home/home_cubit.dart';
import '../../model/product_images_model.dart';
import '../../repo/create_product_repo.dart';
import '../../viewModel/storeBranches/store_branches_cubit.dart';
import '../../repo/add_quantity_to_branch_repo.dart';
import '../../repo/add_product_tag_repo.dart';
import '../../repo/add_product_compatible_models_repo.dart';
import '../../repo/store_additional_images_repo.dart';
import '../../../../filterCars/model/cars_model.dart';
import '../../../../filterCars/repo/car_model_repo.dart';

import '../../model/branch_quantity_fields.dart';

part 'create_product_state.dart';

enum ViewMode {
  basicInformation,
  allInformation,
}

class CreateProductCubit extends Cubit<CreateProductState> {
  CreateProductCubit({
    required this.pageIndex,
    this.product,
  }) : super(CreateProductInitial()) {
    if (product != null) {
      nameArController.text = product?.nameAr ?? '';
      nameEnController.text = product?.nameEn ?? '';
      actualPriceController.text = product?.actualPrice ?? '';
      discountController.text = product?.discount ?? '';
      descArController.text = product?.detailsAr ?? '';
      descEnController.text = product?.detailsAr ?? '';
      serialNumberController.text = product?.serialNumber ?? '';
      priceController.text = product?.price ?? '';
      manufacturerId = int.tryParse(product?.manufacturerId ?? '');
      originalCountryId = int.tryParse(product?.originalCountryId ?? '');
      carMadeId = int.tryParse(product?.carMadeId ?? '');
      carModelId = int.tryParse(product?.carModelId ?? '');
      storeId = int.tryParse(product?.storeId ?? '');
      carEngineId = int.tryParse(product?.carEngineId ?? '');
      manufacturingYearId = int.tryParse(product?.yearId ?? '');
      productUploadedImage = product?.image;
      _productTypeId = int.tryParse(
        product?.productTypeId ?? '',
      );
      categoryId = int.parse(
        product?.categoryId ?? '0',
      );
      _subcategoryId = int.tryParse(
        product?.subcategoryId ?? '',
      );
      log('subCat is now $_subcategoryId subCat e ${product?.subcategoryId}');
    

      emit(ProductDataFetched());
    }
  }
  final int pageIndex;
  final Product? product;

  // final List<CategoryDropdownModel> _categoryList = [];

  // List<CategoryDropdownModel> get categoryList => [..._categoryList];
  int? _productTypeId,
      manufacturerId,
      originalCountryId,
      carMadeId,
      carModelId,
      storeId,
      carEngineId,
      manufacturingYearId,
      categoryId,
      _subcategoryId;
  final formKey = GlobalKey<FormState>();
  var nameArController = TextEditingController();
  var nameEnController = TextEditingController();
  var actualPriceController = TextEditingController();
  var discountController = TextEditingController();
  var descArController = TextEditingController();
  var descEnController = TextEditingController();
  var serialNumberController = TextEditingController();
  var productTagController = TextfieldTagsController();
  var priceController = TextEditingController();
  var minimumQuantityController = TextEditingController();
  String? productUploadedImage;
  List<String> productTags = [];
  List<ProductImagesModel> _additionalImages = [];
  List<Car>? _carModel = [];
  List<int> _carModelIds = [];
  List<String> initialTagsValue = [];
  List<String> initialCompatibleValue = [];
  List<BranchQuantityFields> _branchQuantityFields = [
    BranchQuantityFields(
      quantityController: TextEditingController(),
      quantityReminderController: TextEditingController(),
    ),
  ];
  List<ProductImagesModel> get additionalImages => [..._additionalImages];
  List<Car> get carModels => [...?_carModel];
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
      return 'discount_required'.translate.toTitleCase;
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

  Future<void> getAllCarModels(
    context,
  ) async {
    emit(CreateProductCarModelLoading());
    var carModelData = await CarModelsRepo.getCarModels(context);

    if (carModelData == null) {
      emit(CarModelError());

      return;
    }
    if (carModelData.status == true) {
      emit(CarModelDone());

      _carModel = carModelData.data;
    } else {
      emit(CarModelError());
    }
  }

  Future<void> createProduct(
    BuildContext context,
  ) async {
    if (!validate() ||
        ((_pickedImage == null || _additionalImages.isEmpty) &&
            product == null)) {
      if (product == null) {
        if (_pickedImage == null) {
          Fluttertoast.showToast(
            msg: 'product_image_required'.translate,
            backgroundColor: Colors.red,
          );
        }
        if (_additionalImages.isEmpty) {
          Fluttertoast.showToast(
            msg: 'additional_product_images_required'.translate,
            backgroundColor: Colors.red,
          );
        }
      }
      return;
    }
    emit(CreateProductLoading());
    try {
      var storeCubit = context.read<StoreBranchesCubit>();
      var createProductData = await CreateProductRepo.createNewProduct(
        context,
        productId: product?.id,
        body: {
          'name_ar': nameArController.text,
          'name_en': nameEnController.text,
          'details_ar': descArController.text,
          'details_en': descEnController.text,
          'actual_price': actualPriceController.text,
          'product_type_id': productTypeId,
          if (discountController.text.isEmpty) ...{
            'discount': discountController.text,
          },
          'image': _pickedImage == null
              ? null
              : await MultipartFile.fromFile(_pickedImage?.path ?? ''),
          'category_id': categoryIds.first,
          'subcategory_id': categoryIds.last,
          'year_id': manufacturingYearId,
          'manufacturer_id': manufacturerId,
          'original_country_id': originalCountryId,
          'store_id': storeCubit.storeId,
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
              'branch_id': field.branchId ?? storeCubit.branches.first.id,
            },
            quantityId: field.quantityId,
          );
          await Future.delayed(
            const Duration(milliseconds: 1),
            () {},
          );
        }
        for (var i = 0; i < productTagController.getTags!.length; i++) {
          var index = context
                  .read<ProductDetailsCubit>()
                  .productData
                  ?.productTags
                  ?.indexWhere(
                    (element) =>
                        element.name == productTagController.getTags![i],
                  ) ??
              -1;
          if (index >= 1) {
            continue;
          }
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
        for (var i = 0; i < _carModelIds.length; i++) {
          var id = _carModelIds[i];
          await addProductCompatibleModels(
            context,
            body: {
              'product_id': createProductData.data?.id,
              'car_model_id': id,
            },
          );
          await Future.delayed(
            const Duration(milliseconds: 1),
            () {},
          );
        }
        await addProductImages(
          context,
          productId: createProductData.data?.id,
        );
        Fluttertoast.showToast(
          msg: createProductData.message ?? '',
        );
        emit(CreateProductDone());
        Future.delayed(
          const Duration(
            milliseconds: 2,
          ),
          () {
            if (product != null) {
              changeViewMode(
                context,
                viewMode: ViewMode.basicInformation,
              );
            } else {
              context.read<HomeCubit>().deleteByIndex(
                    pageIndex,
                  );
            }
          },
        );
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
    @required int? quantityId,
  }) async {
    try {
      var addToBranchData = await AddQuantityToBranchRepo.addQuantity(
        context,
        body: body,
        quantityId: quantityId,
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

  Future<void> addProductImages(
    context, {
    int? productId,
  }) async {
    try {
      List<MultipartFile> productImages = [];
      var imageToUpload = _additionalImages
          .where((element) => element.pickedFile != null)
          .toList();
      for (var i = 0; i < imageToUpload.length; i++) {
        var image = imageToUpload[i];
        var compressAndGetFile =
            await Helper.compressAndGetFile(image.pickedFile!);

        productImages.add(
          await MultipartFile.fromFile(
            compressAndGetFile.path,
          ),
        );
      }
      var addProductTagData =
          await StoreAdditionalProductImagesRepo.storeImages(
        context,
        body: {
          'product_id': productId,
          'image[]': productImages,
        },
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

  Future<void> addProductCompatibleModels(
    context, {
    required Map<String, dynamic> body,
  }) async {
    try {
      var addProductTagData =
          await AddProductCompatibleModelsRepo.addCompatibleModels(
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

  void changeProductTypeId(int? productTypeId) {
    if (productTypeId == null) {
      return;
    }
    _productTypeId = productTypeId;
    emit(ProductTypeStateChanged());
  }

  void pickAdditionalImages() async {
    var additionalImages = await Helper.selectImages(
      imageCount: 5,
    );
    if (additionalImages.isNotEmpty) {
      _additionalImages.addAll(
        additionalImages.map(
          (e) => ProductImagesModel(
            pickedFile: e,
          ),
        ),
      );
      emit(ProductImageListStateChanged());
    }
  }

  bool validate() => formKey.currentState?.validate() ?? false;

  void changeViewMode(
    context, {
    ViewMode? viewMode,
  }) {
    if (!validate() || (pickedImage == null && product == null)) {
      showDialog(
        context: context,
        builder: (_) => ResultDialog(
          resultType: ResultType.none,
          message: 'enter_product_data'.translate,
        ),
      );

      return;
    }
    _viewMode = viewMode ?? ViewMode.allInformation;
    emit(ViewModeStateChanged());
    if (product != null) {
      getProductData(
        context,
      );
    }
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

  deleteFields(
    int index,
    BuildContext context,
  ) async {
    var deleteFromApi = _branchQuantityFields[index].quantityId != null;
    if (deleteFromApi) {
      var deleteField =
          await context.read<GetProductQuantityCubit>().deleteBranchQuantity(
                context,
                quantityId: _branchQuantityFields[index].quantityId,
              );
      if (deleteField) {
        _branchQuantityFields.removeAt(index);
      }
    } else {
      _branchQuantityFields.removeAt(index);
    }
    emit(QuantityFieldsAdded());
  }

  onImageRemoved(int index, BuildContext context) async {
    var isDeleteFromAPI = _additionalImages[index].imageId != null;
    if (isDeleteFromAPI) {
      var networkImagesList = _additionalImages
          .where((element) => element.imageId != null)
          .toList();
      if (networkImagesList.length == 1) {
        showDialog(
          context: context,
          builder: (_) => ResultDialog(
            resultType: ResultType.none,
            message: 'one_image_warning'.translate,
          ),
        );
        return;
      }

      var deletedImage =
          await context.read<GetProductImagesCubit>().deleteProductImage(
                context,
                imageId: _additionalImages[index].imageId,
              );
      if (deletedImage) {
        _additionalImages.removeAt(index);
      }
    } else {
      _additionalImages.removeAt(index);
    }
    emit(ProductImageListStateChanged());
  }

  void onCompatibleModelsChanged(
    List<String>? values,
  ) {
    if (values == null) {
      return;
    }
    List<int> ids = [];
    for (var i = 0; i < values.length; i++) {
      var index =
          _carModel?.indexWhere((element) => element.name == values[i]) ?? -1;
      if (index >= 0) {
        ids.add(_carModel![index].id!);
      }
    }
    _carModelIds = ids;
  }

  Future<void> getSubCatsOfCategoryIds(
    BuildContext context,
  ) async {
    var subCat = context.read<SubCategoriesCubit>();
    for (var i = 0; i < _categoryIds.length; i++) {
      var hasSubCat = await subCat.hasSubCategories(
        _categoryIds[i],
        context,
      );
      if (hasSubCat) {
        await subCat.getSubCategories(
          context,
          id: _categoryIds[i],
        );
        await Future.delayed(
          const Duration(milliseconds: 2),
        );
      }
    }
  }

  Future<void> getProductData(
    BuildContext context,
  ) async {
    int? productId = product?.id;
    emit(ProductDataFetching(
      productId: productId,
    ));
    log('your subCatId=> $_subcategoryId');
    var parentsCubit = context.read<ParentOfSubCategoryCubit>();
    var hasParents = await parentsCubit.parentOfSubCategory(
      context,
      subcategoryId: _subcategoryId,
    );
    if (hasParents) {
      _categoryIds = parentsCubit.parentsIds;
      log('hasParents =>$hasParents catLength => ${_categoryIds.length}');
      getSubCatsOfCategoryIds(context);
    }
    await Future.delayed(
      const Duration(milliseconds: 3),
    );
    // var compatibleModels = context.read<GetProductCompatibleModelsCubit>();
    // var imagesCubit = context.read<GetProductImagesCubit>();
    // var productQuantityCubit = context.read<GetProductQuantityCubit>();
    // var tagsCubit = context.read<GetProductTagsCubit>();
    var productDetailsCubit = context.read<ProductDetailsCubit>();
    await productDetailsCubit.getProductData(
      context,
      productId: productId,
    );
    var filtersCubit = context.read<FilterCarsCubit>();

    if (productDetailsCubit.productData == null) {
      getProductData(
        context,
      );
      return;
    }
    await filtersCubit.getManufacturer(
      context,
      categoryId: categoryId,
    );

    var productData = productDetailsCubit.productData;
    initialCompatibleValue = productData!.productCompatibleModels!
        .map(
          (e) =>
              Helper.currentLanguage == 'ar' ? e.nameAr ?? '' : e.nameEn ?? '',
        )
        .toList();

    _additionalImages = productData.productImages!
        .map(
          (e) => ProductImagesModel(
            imageId: e.id,
            networkImage: e.image,
          ),
        )
        .toList();

    List<BranchQuantityFields> _fields = [];
    for (var i = 0; i < productData.productQuantity!.length; i++) {
      var branchQuantity = productData.productQuantity![i];
      _fields.add(
        BranchQuantityFields(
          quantityId: branchQuantity.id,
          quantityController:
              TextEditingController(text: branchQuantity.quantity),
          quantityReminderController:
              TextEditingController(text: branchQuantity.quantityReminder),
          branchId: branchQuantity.id,
        ),
      );
      _branchQuantityFields = _fields;
    }

    initialTagsValue = productData.productTags!
        .map(
          (e) => e.name ?? '',
        )
        .toList();
    try {
      for (var i = 0; i < initialTagsValue.length; i++) {
        productTagController.addTag = initialTagsValue[i];
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
      );
    }
    if (carMadeId != null) {
      await filtersCubit.getCarMades(context);

      await Future.delayed(
        const Duration(milliseconds: 3),
      );
      filtersCubit.getCarModels(
        context,
        carMadeId: carMadeId,
      );
    }
    if (carModelId != null) {
      await Future.delayed(
        const Duration(milliseconds: 3),
      );
      filtersCubit.getCarEngines(context, carModelId: carModelId);
    }

    emit(ProductDataFetched());
  }

  @override
  Future<void> close() {
    nameArController.dispose();
    nameEnController.dispose();
    actualPriceController.dispose();
    discountController.dispose();
    descArController.dispose();
    descEnController.dispose();
    serialNumberController.dispose();
    productTagController.dispose();
    priceController.dispose();
    minimumQuantityController.dispose();

    for (var i = 0; i < _branchQuantityFields.length; i++) {
      var field = _branchQuantityFields[i];
      field.quantityController.dispose();
      field.quantityReminderController.dispose();
    }

    return super.close();
  }
}
