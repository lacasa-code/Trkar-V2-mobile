import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/categories/viewModel/categories/categories_cubit.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/router/router.gr.dart';

class SubCatCard extends StatefulWidget {
  const SubCatCard({
    Key? key,
    this.catID,
    this.title,
    this.image,
  }) : super(key: key);
  final int? catID;
  final String? title;
  final String? image;

  @override
  State<SubCatCard> createState() => _SubCatCardState();
}

class _SubCatCardState extends State<SubCatCard> {
  late SubCategoriesCubit subCategoriesCubit;
  late CategoriesCubit categoriesCubit;
  List<Widget> subCategory = [];
  @override
  void initState() {
    subCategoriesCubit = context.read<SubCategoriesCubit>();
    categoriesCubit = context.read<CategoriesCubit>();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var list = categoriesCubit.subCategories(widget.catID ?? 0);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: list.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    onTap: () {
                      if (widget.catID == 519 || widget.catID == 844) {
                        context.router.pop();
                        context.navigateTo(
                          CategoriesRouter(
                            children: [
                              const CategoriesScreen(),
                              TyresScreen(
                                tabIndex: widget.catID,
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    leading: Image.network(
                      Helper.storageDomainUrl + (widget.image ?? ''),
                      errorBuilder: (_, __, ___) => Image.asset(
                        'assets/icons/edit_note.png',
                      ),
                    ),
                    title: Text(
                      widget.title ?? '',
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )
            : ExpansionTile(
                leading: Transform.scale(
                  scale: 1,
                  child: Image.network(
                    Helper.storageDomainUrl + (widget.image ?? ''),
                    errorBuilder: (_, __, ___) => Image.asset(
                      'assets/icons/edit_note.png',
                    ),
                  ),
                ),
                onExpansionChanged: (v) async {
                  if (v) {
                    var index = subCategoriesCubit.subCategories.indexWhere(
                      (element) => element.parentId == widget.catID.toString(),
                    );
                    //   if (index >= 0) {
                    // log('message joas');
                    //     return;
                    //   }

                    var newIndex = categoriesCubit
                        .subCategories(widget.catID ?? 0)
                        .indexWhere(
                          (element) =>
                              element.parentId == widget.catID.toString(),
                        );
                    if (newIndex >= 0) {
                      var list = categoriesCubit
                          .subCategories(widget.catID ?? 0)
                          .where((element) =>
                              element.parentId == widget.catID.toString())
                          .toList();
                      if (subCategory.isNotEmpty) {
                        return;
                      }
                      for (var r in list) {
                        subCategory.add(
                          SubCatCard(
                            title: r.name,
                            catID: r.id,
                            image: r.image,
                          ),
                        );
                      }
                      setState(() {});
                    }
                  }
                },
                children: subCategory,
                title: Text(
                  widget.title ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black),
                ),
              ));
  }
}
