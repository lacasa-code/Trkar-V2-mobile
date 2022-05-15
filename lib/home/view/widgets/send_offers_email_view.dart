import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/register_field.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/home/view/home_screen.dart';
import '../../../core/extensions/string.dart';

class SendOffersEmailView extends StatefulWidget {
  const SendOffersEmailView({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;

  @override
  State<SendOffersEmailView> createState() => _SendOffersEmailViewState();
}

class _SendOffersEmailViewState extends State<SendOffersEmailView> {
  var isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  widget.title ?? 'recieve_offersmail_header'.translate,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(15),
                  ),
                ),
              ),
              const RegisterField(
                thinBorder: true,
                labelText: 'email',
                keyboardType: TextInputType.emailAddress,
              ),
              Row(
                children: [
                  Checkbox(
                    onChanged: (v) {
                      setState(() {
                        isChecked = v ?? false;
                      });
                    },
                    value: isChecked,
                    activeColor: Colors.black,
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(250),
                    child: Text(
                      'recieve_offersmail'.translate,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(11),
                      ),
                    ),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'please_note'.translate,
                    ),
                    TextSpan(
                      text: 'privacy_policy'.translate,
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              RegisterButton(
                radius: 12,
                title: 'subscribe',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
