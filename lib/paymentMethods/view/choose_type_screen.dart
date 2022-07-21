import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
import 'package:trkar/core/router/router.gr.dart';
import '../../core/components/circle_widget.dart';
import '../../core/extensions/string.dart';
import 'widgets/payment_type_card.dart';

class ChooseCardTypeScreen extends StatefulWidget {
  const ChooseCardTypeScreen({Key? key}) : super(key: key);

  @override
  State<ChooseCardTypeScreen> createState() => _ChooseCardTypeScreenState();
}

class _ChooseCardTypeScreenState extends State<ChooseCardTypeScreen> {
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
          Column(
            children: [
              PaymentTypeCard(
                imagePath: 'assets/icons/master-card.png',
                title: 'Credit / Debit Card',
                onPressed: () async {
                  var result = await context.router.push(
                    CreateNewPaymentMethodRouter(),
                  );
                  if (result == true) {
                    context.router.pop(result);
                  }
                },
              ),
              PaymentTypeCard(
                imagePath: 'assets/icons/pay-pal.png',
                title: 'PayPal',
                onPressed: () async {
                  var result = await context.router.push(
                    CreateNewPaymentMethodRouter(),
                  );
                  if (result == true) {
                    context.router.pop(result);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
