import 'dart:developer';
import 'dart:io' show Platform;
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:trkar/core/components/custom_search_delegate.dart';
import '../extensions/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './register_field.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchAppBar({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Size get preferredSize => Size.fromHeight(ScreenUtil().setHeight(70));

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  var isTitle = false;
  @override
  Widget build(BuildContext context) {
    // log('can go back:=>${context.router.canNavigateBack} canpop:=>${context.router.canPopSelfOrChildren}');
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Row(
          children: [
            Visibility(
              visible: context.router.canPopSelfOrChildren && Platform.isIOS,
              child: IconButton(
                padding: EdgeInsets.zero,
                alignment: Alignment.center,
                onPressed: () {
                  log('scaff');
                  context.router.pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              onPressed: () {
                log('scaff');
                widget.scaffoldKey.currentState?.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
              ),
            ),
            Expanded(
              child: AnimatedCrossFade(
                duration: const Duration(
                  milliseconds: 200,
                ),
                crossFadeState: isTitle
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstChild: const SizedBox(),
                secondChild: InkWell(
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(),
                    );
                  },
                  child: RegisterField(
                    enabled: false,
                    textInputAction: TextInputAction.search,
                    thinBorder: true,
                    removePadding: true,
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.search,
                      ),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {},
                    ),
                    hintText: 'search_hint',
                  ),
                ),
              ),
            ),
            // IconButton(
            //   onPressed: () {
            //     setState(() {
            //       isTitle = !isTitle;
            //     });
            //   },
            //   icon: Icon(
            //     isTitle ? Icons.search : Icons.close,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
