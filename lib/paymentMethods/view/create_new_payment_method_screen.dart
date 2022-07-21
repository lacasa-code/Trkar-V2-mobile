import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/register_field.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/router/router.gr.dart';
import '../../core/components/circle_widget.dart';
import '../../core/extensions/string.dart';
import 'widgets/expiry_date_field_view.dart';

class CreateNewPaymentMethodScreen extends StatefulWidget {
  const CreateNewPaymentMethodScreen({
    Key? key,
    this.isEdit = false,
  }) : super(key: key);
  final bool isEdit;

  @override
  State<CreateNewPaymentMethodScreen> createState() =>
      _CreateNewPaymentMethodScreenState();
}

class _CreateNewPaymentMethodScreenState
    extends State<CreateNewPaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'payment_methods'.translate,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          color: Colors.black,
          onPressed: () {
            context.router.pop();
          },
          iconSize: ScreenUtil().radius(15),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: ScreenUtil().setHeight(270),
            right: -ScreenUtil().setWidth(445),
            bottom: ScreenUtil().setHeight(145),
            left: 0,
            child: const CircleWidget(),
          ),
          Positioned(
            top: ScreenUtil().setHeight(379),
            left: -ScreenUtil().setWidth(430),
            bottom: ScreenUtil().setHeight(50),
            right: 0,
            child: const CircleWidget(),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text(
                    'enter_your_credit_card_information'.translate,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                RegisterField(
                  hintText: 'name_on_card',
                  formatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp('[a-zA-Z ]'),
                    ),
                  ],
                  thinBorder: true,
                ),
                RegisterField(
                  hintText: 'card_number',
                  keyboardType: TextInputType.phone,
                  maxLength: 16,
                  formatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  thinBorder: true,
                ),
                const ExpiryDateFieldView(),
                RegisterField(
                  keyboardType: TextInputType.phone,
                  noLocalHintText: 'CVV',
                  maxLength: 3,
                  formatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  thinBorder: true,
                ),
                TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                      Colors.transparent,
                    ),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                    ),
                    alignment: Helper.appAlignment,
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  onPressed: () {
                    context.router.push(
                      const TermsAndConditionsScreen(),
                    );
                  },
                  child: Text(
                    'terms'.translate,
                    textAlign: TextAlign.start,
                  ),
                ),
                const BoxHelper(
                  height: 20,
                ),
                widget.isEdit
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: ScreenUtil().setHeight(40),
                            width: ScreenUtil().setWidth(90),
                            child: RegisterButton(
                              removePadding: true,
                              radius: 12,
                              onPressed: () {
                                context.router.pop(true);
                              },
                              title: 'update',
                            ),
                          ),
                          const BoxHelper(
                            width: 10,
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(40),
                            width: ScreenUtil().setWidth(90),
                            child: RegisterButton(
                              color: Colors.white,
                              isDeleteButton: true,
                              removePadding: true,
                              radius: 12,
                              onPressed: () {
                                context.router.pop(true);
                              },
                              title: 'delete',
                            ),
                          ),
                        ],
                      )
                    : SizedBox(
                        height: ScreenUtil().setHeight(60),
                        child: RegisterButton(
                          radius: 12,
                          onPressed: () {
                            context.router.pop(true);
                          },
                          title: 'add_this_card',
                        ),
                      ),
                const BoxHelper(
                  height: 130,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
