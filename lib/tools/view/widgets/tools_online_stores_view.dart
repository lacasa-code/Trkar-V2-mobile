import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';
import 'package:trkar/core/components/sub_cat_item.dart';
import 'package:trkar/core/helper/helper.dart';
import '../../../core/extensions/string.dart';
import '../../../core/components/sized_box_helper.dart';
import 'package:trkar/core/components/loader_widget.dart';

class ToolsOnlineStoresView extends StatelessWidget {
  const ToolsOnlineStoresView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var subCategory = context.read<SubCategoriesCubit>();
    return BlocBuilder<SubCategoriesCubit, SubCategoriesState>(
      builder: (context, state) {
        if (state is SubCategoriesLoading) {
          return const LoaderWidget();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'online_tools_store'.translate,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const BoxHelper(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'online_tools_store_desc'.translate,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: List.generate(
                subCategory.subCategories.length,
                (index) {
                  var subCat = subCategory.subCategories[index];
                  return PopupMenuButton(
                    itemBuilder: (context) => List.generate(
                      4,
                      (index) => PopupMenuItem(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/301.png',
                              height: ScreenUtil().setHeight(50),
                              width: ScreenUtil().setWidth(50),
                            ),
                            const Text(
                              'Cat Name',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    child: SubCategoryItem(
                      title: Helper.currentLanguage == 'ar'
                          ? subCat.nameAr
                          : subCat.nameEn,
                      imagePath: subCat.image,
                    ),
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
