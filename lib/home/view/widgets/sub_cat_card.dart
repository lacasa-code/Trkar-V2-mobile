import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/categories/viewModel/categories/categories_cubit.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';

class SubCatCard extends StatefulWidget {
  const SubCatCard({
    Key? key,
    this.catID,
    this.title,
  }) : super(key: key);
  final int? catID;
  final String? title;

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
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: list.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    child: Text(
                      widget.title ?? '',
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(12),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            : ExpansionTile(
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
                      list.forEach((r) {
                        subCategory.add(
                          SubCatCard(
                            title: r.name,
                            catID: r.id,
                          ),
                        );
                      });
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
