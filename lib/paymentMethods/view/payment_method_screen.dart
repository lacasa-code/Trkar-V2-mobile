import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/router/router.gr.dart';
import '../../core/components/circle_widget.dart';
import '../../core/extensions/string.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
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
                const BoxHelper(
                  height: 150,
                ),
                SvgPicture.asset(
                  'assets/icons/svg/payment-method.svg',
                ),
                const BoxHelper(
                  height: 10,
                ),
                Text(
                  'payment_method'.translate,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(18),
                      ),
                ),
                const BoxHelper(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'payment_method_body'.translate,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: ScreenUtil().setSp(14),
                        ),
                  ),
                ),
                const BoxHelper(
                  height: 65,
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(60),
                  child: RegisterButton(
                    radius: 10,
                    onPressed: () {
                      context.router.push(
                        const CreateNewPaymentMethodRouter(),
                      );
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
