import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/register_field.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/helper.dart';
import '../../core/extensions/string.dart';

class CreateNewPaymentMethodScreen extends StatefulWidget {
  const CreateNewPaymentMethodScreen({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
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
              onPressed: () {},
              child: Text(
                'terms'.translate,
                textAlign: TextAlign.start,
              ),
            ),
            BoxHelper(
              height: 20,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(60),
              child: RegisterButton(
                radius: 12,
                onPressed: () {},
                title: 'add_this_card',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpiryDateFieldView extends StatelessWidget {
  const ExpiryDateFieldView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SizedBox(
        height: ScreenUtil().setHeight(50),
        child: Row(
          children: [
            Row(
              children: [
                SizedBox(
                  width: ScreenUtil().setWidth(60),
                  child: RegisterField(
                    removePadding: true,
                    keyboardType: TextInputType.phone,
                    noLocalHintText: 'YY',
                    textAlign: TextAlign.center,
                    maxLength: 2,
                    formatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    thinBorder: true,
                  ),
                ),
                const BoxHelper(
                  width: 15,
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(60),
                  child: RegisterField(
                    textAlign: TextAlign.center,
                    removePadding: true,
                    keyboardType: TextInputType.phone,
                    noLocalHintText: 'MM',
                    maxLength: 2,
                    formatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    thinBorder: true,
                  ),
                ),
              ],
            ),
            const BoxHelper(
              width: 20,
            ),
            Text(
              'expiry_date'.translate,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
