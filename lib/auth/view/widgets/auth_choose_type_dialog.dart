import 'package:flutter/material.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/sized_box_helper.dart';

class AuthChooseTypeDialog extends StatelessWidget {
  const AuthChooseTypeDialog({
    Key? key,
    this.isLogin = true,
    required this.onVendorButtonPressed,
    required this.onCustomerButtonPressed,
  }) : super(key: key);
  final bool isLogin;
  final void Function() onVendorButtonPressed;
  final void Function() onCustomerButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RegisterButton(
            radius: 10,
            title: isLogin ? 'login_as_customer' : 'register_as_customer',
            onPressed: onCustomerButtonPressed,
          ),
          const BoxHelper(
            height: 25,
          ),
          RegisterButton(
            color: Colors.white,
            title: isLogin ? 'login_as_vendor' : 'register_as_vendor',
            onPressed: onVendorButtonPressed,
            radius: 10,
          ),
        ],
      ),
    );
  }
}
