import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:trkar/categories/viewModel/parentOfSubCategory/parent_of_sub_category_cubit.dart';
import 'package:trkar/core/components/result_dialog.dart';
import 'package:trkar/vendor/createProduct/viewModel/getProductCompatibleModels/get_product_compatible_models_cubit.dart';
import 'package:trkar/vendor/createProduct/viewModel/getProductImages/get_product_images_cubit.dart';
import 'package:trkar/vendor/createProduct/viewModel/getProductQuantity/get_product_quantity_cubit.dart';
import 'package:trkar/vendor/createProduct/viewModel/getProductTags/get_product_tags_cubit.dart';
import '../../../../core/helper/laravel_exception.dart';
import '../../../../filterCars/viewModel/carMades/filter_cars_cubit.dart';
import '../../../createProduct/view/create_product_screen.dart';
import '../../../createProduct/viewModel/createProduct/create_product_cubit.dart';
import '../../../createProduct/viewModel/productsType/products_type_cubit.dart';
import '../../../createProduct/viewModel/storeBranches/store_branches_cubit.dart';
import '../../model/my_products_model.dart';
import '../../repo/my_products_repo.dart';
import '../productDetails/product_details_cubit.dart';

part 'my_products_state.dart';

class MyProductsCubit extends Cubit<MyProductsState> {
  MyProductsCubit() : super(MyProductsInitial());

  List<Product>? _products = [];
  List<Product> get products => [...?_products];
  List<Widget> get productsView => [
        ...List.generate(
          _products?.length ?? 0,
          (
            index,
          ) {
            var product = _products?[index];
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => CreateProductCubit(
                    pageIndex: index,
                    product: product,
                  ),
                ),
                BlocProvider(
                  create: (context) => StoreBranchesCubit(),
                ),
                BlocProvider(
                  create: (context) => GetProductCompatibleModelsCubit(),
                ),
                BlocProvider(
                  create: (context) => GetProductQuantityCubit(),
                ),
                BlocProvider(
                  create: (context) => GetProductImagesCubit(),
                ),
                BlocProvider(
                  create: (context) => GetProductTagsCubit(),
                ),
                BlocProvider(
                  create: (context) => ProductDetailsCubit(),
                ),
                BlocProvider(
                  create: (context) => ParentOfSubCategoryCubit(),
                ),
              ],
              child: CreateProductView(
                key: ValueKey(
                  index,
                ),
              ),
            );
          },
        ).toList()
      ];

  Future<void> getMyProducts(context) async {
    emit(MyProductsLoading());

    try {
      var myProductsData = await MyProductsRepo.getMyProducts(context);

      if (myProductsData == null) {
        log('nullData');
        emit(MyProductsError());
        return;
      }
      if (myProductsData.status == true) {
        _products = myProductsData.data?.data;
        emit(MyProductsDone());
      } else {
        emit(MyProductsError());
      }
    } on LaravelException catch (error) {
      log('error ${error.exception}');
      showDialog(
        context: context,
        builder: (_) => ResultDialog(
          resultType: ResultType.error,
          message: error.exception,
        ),
      );
      emit(MyProductsError());
    }
  }
}
