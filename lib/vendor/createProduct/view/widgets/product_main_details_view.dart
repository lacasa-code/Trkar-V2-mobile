import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trkar/core/components/delete_dialog.dart';
import 'package:trkar/core/components/loader_widget.dart';
import 'package:trkar/vendor/createProduct/viewModel/createProduct/create_product_cubit.dart';
import 'package:trkar/vendor/createProduct/viewModel/deleteProduct/delete_product_cubit.dart';
import 'package:trkar/vendor/home/viewModel/home/home_cubit.dart';

import '../../../../core/components/register_field.dart';
import '../../../../core/components/sized_box_helper.dart';
import '../../../../core/themes/screen_utility.dart';
import 'create_product_price_view.dart';

class ProductMainDetailsView extends StatelessWidget {
  const ProductMainDetailsView({
    Key? key,
    required this.createProductCubit,
  }) : super(key: key);
  final CreateProductCubit createProductCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            createProductCubit.product != null
                ? BlocBuilder<DeleteProductCubit, DeleteProductState>(
                    builder: (context, state) {
                      if (state is DeleteProductLoading) {
                        return const LoaderWidget();
                      }
                      return IconButton(
                        onPressed: () => showDialog(
                          context: context,
                          builder: (_) => DeleteDialog(
                            onDeleted: () => context
                                .read<DeleteProductCubit>()
                                .deleteProduct(context),
                          ),
                        ),
                        padding: EdgeInsets.zero,
                        icon: Transform.scale(
                          scale: 0.6,
                          child: SvgPicture.asset(
                            'assets/icons/svg/vendor/delete.svg',
                          ),
                        ),
                      );
                    },
                  )
                : InkWell(
                    onTap: () => context.read<HomeCubit>().deleteByIndex(
                          createProductCubit.pageIndex,
                        ),
                    child: CircleAvatar(
                      radius: ScreenUtil().radius(10),
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: ScreenUtil().radius(10),
                      ),
                    ),
                  ),
            const BoxHelper(
              height: 5,
            ),
          ],
        ),
        Row(
          children: [
            InkWell(
              onTap: () => createProductCubit.pickImage(),
              child: Container(
                height: ScreenUtil().setHeight(120),
                width: ScreenUtil().setWidth(100),
                decoration: BoxDecoration(
                  color: const Color(0xffF3F4F5),
                  border: Border.all(
                    color: MainStyle.lightGreyColor,
                  ),
                ),
                child: createProductCubit.pickedImage == null
                    ? (createProductCubit.productUploadedImage == null
                        ? Icon(
                            Icons.image_outlined,
                            color: MainStyle.lightGreyColor,
                            size: ScreenUtil().radius(50),
                          )
                        : Image.network(
                            createProductCubit.productUploadedImage!,
                            fit: BoxFit.cover,
                          ))
                    : Image.file(
                        createProductCubit.pickedImage!,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const BoxHelper(
              width: 15,
            ),
            SizedBox(
              width: ScreenUtil().setWidth(185),
              child: Column(
                children: [
                  RegisterField(
                    hintTextSize: ScreenUtil().setSp(13),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    removePadding: true,
                    hintText: 'product_name_ar',
                    validator: createProductCubit.nameArValidate,
                    hintFontWeight: FontWeight.normal,
                    // formatters: [
                    //   FilteringTextInputFormatter.allow(
                    //     RegExp('[a-zA-Z ]'),
                    //   ),
                    // ],
                    controller: createProductCubit.nameArController,
                  ),
                  const BoxHelper(
                    height: 10,
                  ),
                  RegisterField(
                    hintTextSize: ScreenUtil().setSp(13),
                    controller: createProductCubit.nameEnController,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    removePadding: true,
                    hintFontWeight: FontWeight.normal,
                    hintText: 'product_name_en',
                    validator: createProductCubit.nameEnValidate,
                    // formatters: [
                    //   FilteringTextInputFormatter.allow(
                    //     RegExp('[a-zA-Z ]'),
                    //   ),
                    // ],
                  ),
                  const BoxHelper(
                    height: 10,
                  ),
                  CreateProductPriceField(
                    hintTextSize: ScreenUtil().setSp(13),
                    controller: createProductCubit.priceController,
                    validation: createProductCubit.productPriceValidate,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
