import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:characters/characters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../core/components/register_button.dart';
import '../../core/components/sized_box_helper.dart';
import '../../core/extensions/string.dart';
import '../../core/helper/helper.dart';
import '../viewModel/verifyEmail/verify_email_cubit.dart';
import 'widgets/verfication_footer_widget.dart';

class EmailVerificationScreen extends StatefulWidget
    implements AutoRouteWrapper {
  const EmailVerificationScreen({
    Key? key,
    required this.email,
    this.stateOfVerification,
    this.resendCode = false,
  }) : super(key: key);
  final String email;
  final int? stateOfVerification;
  final bool resendCode;

  @override
  _EmailVerificationScreenState createState() =>
      _EmailVerificationScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    log('wrap here');
    return BlocProvider(
      create: (context) => VerifyMyEmailCubit(
        emailAddress: email,
      ),
      child: this,
    );
  }
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  late VerifyMyEmailCubit confirmCode;
  late String emailAddress;

  @override
  void initState() {
    confirmCode = context.read<VerifyMyEmailCubit>();
    if (widget.resendCode) {
      confirmCode.resend(context);
    }
    var listOfCharacters = widget.email.characters.toList();
    var index = listOfCharacters.indexWhere((element) => element == '@');

    for (int i = 0; i < listOfCharacters.length; i++) {
      if (i != 0 && i < index) {
        listOfCharacters[i] = '*';
      }
    }
    emailAddress = listOfCharacters.join();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Visibility(
          visible: Navigator.canPop(context),
          child: IconButton(
            onPressed: () {
              context.router.pop();
            },
            color: Theme.of(context).iconTheme.color,
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                const BoxHelper(
                  height: 120,
                ),
                SvgPicture.asset(
                  'assets/icons/svg/login-logo.svg',
                  // alignment: Al,
                ),
                const BoxHelper(
                  height: 50,
                ),
                Text(
                  'email_verfication_desc'.translate,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        fontSize: ScreenUtil().setSp(16),
                      ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  emailAddress,
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontSize: ScreenUtil().setSp(16),
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const BoxHelper(
              height: 70,
            ),
            Form(
              key: confirmCode.formKey,
              child: Container(
                width: ScreenUtil().setWidth(240),
                padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: PinCodeTextField(
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: confirmCode.verificationCodeValidate,
                    controller: confirmCode.codeController,
                    pinTheme: PinTheme(
                      inactiveColor: const Color(0xffE6F2F2),
                      activeColor: const Color(0xffE6F2F2),
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    appContext: context,
                    length: 4,
                    onChanged: (v) {},
                    onCompleted: (v) {
                      // NavigationService.pushReplacementAll(
                      //   page: arg == 1 ? ResetPasswordScreen.routeName : '/',
                      // );
                    },
                  ),
                ),
              ),
            ),
            VerificationFooterText(
              onResendPressed: () => confirmCode.resend(context),
            ),
            const BoxHelper(
              height: 50,
            ),
            BlocBuilder<VerifyMyEmailCubit, VerifyEmailState>(
              builder: (context, state) {
                return SizedBox(
                  height: ScreenUtil().setHeight(55),
                  child:
                      //  state is VerifyEmailLoading
                      //     ? const LoaderWidget()
                      //     :
                      RegisterButton(
                    radius: 10,
                    title: 'confirm',
                    onPressed: () => confirmCode.verifyCode(
                      context,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
