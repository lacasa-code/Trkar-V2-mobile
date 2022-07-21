import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/router/router.gr.dart';
import '../../core/components/circle_widget.dart';
import '../../core/extensions/string.dart';
import 'widgets/payment_method_card.dart';
import 'widgets/payment_method_empty_view.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  bool hasMethods = false;
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
      body: SizedBox(
        // height: MediaQuery.of(context).size.height,
        child: Stack(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                !hasMethods
                    ? const PaymentMethodEmptyView()
                    : const PaymentMethodsView(),
                const BoxHelper(
                  height: 65,
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(60),
                  child: RegisterButton(
                    radius: 10,
                    onPressed: () async {
                      var result = await context.router.push(
                        const ChooseCardTypeRouter(),
                      );
                      if (result == true) {
                        setState(() {
                          hasMethods = true;
                        });
                      }
                    },
                    title: 'add_new_payment_method',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodsView extends StatelessWidget {
  const PaymentMethodsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        BoxHelper(
          height: 35,
        ),
        PaymentMethodCard(),
        PaymentMethodCard(),
        PaymentMethodCard(),
      ],
    );
  }
}
