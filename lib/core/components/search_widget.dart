import 'package:flutter/material.dart';
import 'package:trkar/core/themes/screen_utility.dart';
import './custom_search_delegate.dart';
import './register_field.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    this.removePadding = true,
    this.suffixIcon,
  }) : super(key: key);
  final bool removePadding;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return RegisterField(
      enabled: false,
      onTap: () {
        showSearch(
          context: context,
          delegate: CustomSearchDelegate(),
        );
      },
      textInputAction: TextInputAction.search,
      thinBorder: true,
      removePadding: removePadding,
      prefixIcon: IconButton(
        icon: const Icon(
          Icons.search,
          color: MainStyle.lightGreyColor,
        ),
        onPressed: () {},
      ),
      suffixIcon: suffixIcon,
      hintText: 'search_hint',
    );
  }
}
