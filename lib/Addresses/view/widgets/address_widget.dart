import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Addresses/model/my_addresses_model.dart';
import '../../../Addresses/viewModel/addNewAddress/add_new_address_cubit.dart';
import '../../../core/components/custom_new_dialog.dart';
import '../../../core/extensions/string.dart';
import '../../../core/helper/helper.dart';

import '../../../../core/themes/screen_utility.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/helper/navigator.dart';
import '../../../core/components//sized_box_helper.dart';
import '../add_new_address_screen.dart';
import '../../../core/components/option_item.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    Key? key,
    this.governorate,
    this.subTitle,
    this.isDefault = false,
    this.showLocationIcon = true,
    this.showOptionsMenu = true,
    this.verticalPadding = 10,
    this.radius = 14,
    this.address,
  }) : super(key: key);
  final String? governorate;
  final String? subTitle;
  final bool isDefault;
  final bool showLocationIcon, showOptionsMenu;
  final num verticalPadding;
  final double radius;
  final Address? address;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: verticalPadding.toDouble(),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: const BorderSide(
              color: MainStyle.lightGreyColor,
            ),
          ),
          child: Container(
            decoration: isDefault
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: MainStyle.mainColor,
                      width: ScreenUtil().setWidth(4),
                    ),
                  )
                : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 5, bottom: 5, right: 10),
                  child: Row(
                    children: [
                      showLocationIcon
                          ? Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 1.0,
                                  color: MainStyle.lightGreyColor,
                                ),
                              ),
                              child: const Icon(
                                Icons.location_on_outlined,
                                color: MainStyle.darkGreyColor,
                              ),
                            )
                          : const SizedBox(),
                      const BoxHelper(
                        width: 5,
                      ),
                      Text(
                        governorate ?? 'Full Name',
                        style: MainTheme.headerStyle4,
                      ),
                      const Spacer(),
                      showLocationIcon && showOptionsMenu
                          ? IconButton(
                              icon: const Icon(
                                Icons.more_horiz,
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (_) => AddressModalBottomSheet(
                                          onDelete: () {
                                            NavigationService.goBack();
                                          },
                                          onEdit: () {
                                            NavigationService.goBack();
                                            NavigationService.push(
                                              page: MultiBlocProvider(
                                                providers: [
                                                  BlocProvider<
                                                      AddNewAddressCubit>(
                                                    create: (_) =>
                                                        AddNewAddressCubit(
                                                      context: context,
                                                      address: address,
                                                    ),
                                                  ),
                                                ],
                                                child:
                                                    const AddNewAddressScreen(
                                                        // isEdit: true,
                                                        ),
                                              ),
                                            );
                                          },
                                        ));
                              },
                            )
                          : const Icon(
                              Icons.abc,
                              color: Colors.transparent,
                            ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, bottom: 10, top: 5, right: 15),
                  child: Text(
                    subTitle ??
                        'Country - Area - District - Street - Home Number - Floor Number - Appartment Number',
                    style: MainTheme.subTextStyle,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Positioned(
        //   // bottom: ScreenUtil().setHeight(10),
        //   left: 0,
        //   right: 0,
        //   top: 0,
        //   bottom: 0,
        //   child: Visibility(
        //     visible: state is DeleteAddressLoading,
        //     child: Container(
        //       width: double.infinity,
        //       color: Colors.black26,
        //       child: const Center(
        //         child: CircularProgressIndicator(),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

class AddressModalBottomSheet extends StatelessWidget {
  const AddressModalBottomSheet({
    Key? key,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);
  final void Function() onDelete;
  final void Function() onEdit;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Helper.appDirection,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
            border: Border.all(
              width: 1,
              color: Theme.of(context).primaryColor,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                OptionItem(
                  title: 'make_default',
                  icons: Icons.check_circle_outline,
                  onPressed: () {
                    NavigationService.goBack();
                  },
                ),
                OptionItem(
                  title: 'edit',
                  icons: 'assets/icons/edit_note.png',
                  onPressed: onEdit,
                ),
                OptionItem(
                  title: 'delete',
                  icons: Icons.delete_outline,
                  onPressed: onDelete,
                  showDivider: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
