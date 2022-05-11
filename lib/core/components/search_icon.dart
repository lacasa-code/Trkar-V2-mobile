import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({
    Key? key,
    this.categoryId,
  }) : super(key: key);
  final dynamic categoryId;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (_) => BlocProvider(
            create: (_) => SubCategoriesCubit(),
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SearchModalBottomSheet(
                categoryId: categoryId,
              ),
            ),
          ),
        );
      },
      color: Colors.black,
      icon: const Icon(
        Icons.search,
      ),
    );
  }
}
