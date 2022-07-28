import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/vendor/createProduct/view/create_product_screen.dart';

import '../../../../categories/viewModel/categories/categories_cubit.dart';
import '../../../../filterCars/viewModel/carMades/filter_cars_cubit.dart';
import '../../../createProduct/viewModel/createProduct/create_product_cubit.dart';
import '../../../createProduct/viewModel/productsType/products_type_cubit.dart';
import '../../../createProduct/viewModel/storeBranches/store_branches_cubit.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<Widget> _createProductView = [];
  List<Widget> get createProductView => [
        ..._createProductView,
      ];

  void addNewProduct() {
    _createProductView.add(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CreateProductCubit(
              pageIndex: _createProductView.length - 1,
            ),
          ),
         
        ],
        child: CreateProductView(
          key: ValueKey(
            _createProductView.length,
          ),
        ),
      ),
    );
    emit(
      CreateProductViewStateChanged(),
    );
  }

  void deleteByIndex(int index) {
    log('length ${_createProductView.length} && index $index');
    _createProductView.removeAt(index);
    emit(CreateProductViewStateChanged());
  }
}
