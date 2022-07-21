import 'package:flutter/material.dart';

import '../../../../categories/viewModel/categories/categories_cubit.dart';
import '../../../../core/components/register_field.dart';
import '../../../../core/components/searchable_dropdown_widget.dart';
import '../../../../core/components/sized_box_helper.dart';
import '../../../../core/themes/screen_utility.dart';



class VendorSearchView extends StatelessWidget {
  const VendorSearchView({
    Key? key,
    required this.categoriesCubit,
  }) : super(key: key);

  final CategoriesCubit categoriesCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: RegisterField(
              textInputAction: TextInputAction.search,
              thinBorder: true,
              removePadding: true,
              prefixIcon: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: MainStyle.lightGreyColor,
                ),
                onPressed: () {},
              ),
              hintText: 'search_hint',
            ),
          ),
          BoxHelper(
            width: 5,
          ),
          Expanded(
            flex: 2,
            child: SearchableDropDownWidget(
              removePadding: true,
              values: categoriesCubit.mainCategory
                  .map(
                    (e) => e.name ?? '',
                  )
                  .toList(),
              onChanged: (v) {},
              labelText: 'categories',
            ),
          ),
        ],
      ),
    );
  }
}
