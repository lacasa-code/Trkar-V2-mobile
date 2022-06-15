import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';
import 'package:trkar/core/components/sub_cat_item.dart';
import 'package:trkar/core/helper/helper.dart';
import '../../../core/extensions/string.dart';

class CarAccessoriesSubCategoriesView extends StatelessWidget {
  const CarAccessoriesSubCategoriesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var subCatCubit = context.read<SubCategoriesCubit>();
    return BlocBuilder<SubCategoriesCubit, SubCategoriesState>(
      builder: (context, state) {
        if (state is SubCategoriesLoading) {
          return const LoaderWidget();
        }
        return Column(
          children: [
            Text(
              'car_accessories_categories'.translate,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Wrap(
              children: List.generate(
                subCatCubit.subCategories.length,
                (index) {
                  var subCat = subCatCubit.subCategories[index];
                  return SubCategoryItem(
                    title: Helper.currentLanguage == 'ar'
                        ? subCat.nameAr
                        : subCat.nameEn,
                    imagePath: subCat.image,
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
