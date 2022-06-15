import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';
import 'package:trkar/core/components/sub_cat_item.dart';
import 'package:trkar/core/helper/helper.dart';
import '../../../core/extensions/string.dart';


class CarBrakesSubCategoriesView extends StatelessWidget {
  const CarBrakesSubCategoriesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SubCategoriesCubit subCategoriesCubit = context.read<SubCategoriesCubit>();
    log('subCategory=>');
    return BlocBuilder<SubCategoriesCubit, SubCategoriesState>(
      builder: (context, state) {
        if (state is SubCategoriesLoading) {
          return const LoaderWidget();
        }
        return Column(
          children: [
            Text(
              'please_choose_brakes_category'.translate,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Wrap(
              children: List.generate(
                subCategoriesCubit.subCategories.length,
                (index) {
                  var subCat = subCategoriesCubit.subCategories[index];
                  return SubCategoryItem(
                    imagePath: subCat.image,
                    title: Helper.currentLanguage == 'ar'
                        ? subCat.nameAr
                        : subCat.nameEn,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

