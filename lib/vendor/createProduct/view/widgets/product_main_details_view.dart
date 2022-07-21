import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/vendor/createProduct/viewModel/createProduct/create_product_cubit.dart';

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
    return Row(
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
                ? Icon(
                    Icons.image_outlined,
                    color: MainStyle.lightGreyColor,
                    size: ScreenUtil().radius(50),
                  )
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
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                removePadding: true,
                hintText: 'product_name_ar',
                validator: createProductCubit.nameArValidate,
                formatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp('[a-zA-Z ]'),
                  ),
                ],
                controller: createProductCubit.nameArController,
              ),
              const BoxHelper(
                height: 10,
              ),
              RegisterField(
                controller: createProductCubit.nameEnController,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                removePadding: true,
                hintText: 'product_name_en',
                validator: createProductCubit.nameEnValidate,
                formatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp('[a-zA-Z ]'),
                  ),
                ],
              ),
              const BoxHelper(
                height: 10,
              ),
              CreateProductPriceField(
                controller: createProductCubit.actualPriceController,
                validation: createProductCubit.productPriceValidate,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
