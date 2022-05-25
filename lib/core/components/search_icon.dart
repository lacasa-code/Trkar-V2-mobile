import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/search/viewModel/search/search_cubit.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({
    Key? key,
    this.categoryId,
  }) : super(key: key);
  final dynamic categoryId;
  @override
  Widget build(BuildContext context) {
    return const SizedBox();
    /**
      return IconButton(
      onPressed: () {
        showDialog(
          // isScrollControlled: true,
          context: context,
          builder: (_) => AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Container(
              height: ScreenUtil().setHeight(285),
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider<SearchCubit>(
                    create: (_) => SearchCubit(),
                  ),
                  BlocProvider<SubCategoriesCubit>(
                    create: (_) => SubCategoriesCubit(),
                  ),
                ],
                child: SearchScreen(
                  categoryId: categoryId,
                ),
              ),
            ),
          ),
        );
        // NavigationService.push(
        //   page: SearchScreen.routeName,
        //   arguments: categoryId,
        // );
      },
      color: Colors.black,
      icon: const Icon(
        Icons.search,
      ),
    );
     */
  }
}
