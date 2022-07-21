import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:auto_route/auto_route.dart';
import 'package:trkar/auth/view/widgets/verfication_footer_widget.dart';
import 'package:trkar/auth/viewModel/confirmCode/confirm_code_cubit.dart';
import 'package:trkar/core/components/circle_widget.dart';
import 'package:trkar/core/components/loader_widget.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/router/router.gr.dart';
import 'package:trkar/core/themes/themes.dart';
import '../../core/components/sized_box_helper.dart';
import '../../core/extensions/string.dart';

class PhoneVerificationScreen extends StatefulWidget
    implements AutoRouteWrapper {
  const PhoneVerificationScreen({
    Key? key,
    this.stateOfVerification = 0,
    this.phoneNumber,
  }) : super(key: key);

  ///0 => customer_register 1=> vendor_register .. 2=> reset
  final int stateOfVerification;

  final String? phoneNumber;
  static const routeName = '/email_verfication';

  @override
  _PhoneVerificationScreenState createState() =>
      _PhoneVerificationScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    log('wrap');
    return BlocProvider(
      create: (_) => ConfirmCodeCubit(
        phoneNumber: phoneNumber ?? '',
      ),
      child: this,
    );
  }
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  late ConfirmCodeCubit confirmCode;

  @override
  void initState() {
    confirmCode = context.read<ConfirmCodeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('build');

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
      body: Stack(
        children: [
          Positioned(
            top: ScreenUtil().setHeight(335),
            right: -ScreenUtil().setWidth(430),
            bottom: ScreenUtil().setHeight(235),
            left: 0,
            child: const CircleWidget(),
          ),
          Positioned(
            top: ScreenUtil().setHeight(470),
            left: -ScreenUtil().setWidth(440),
            bottom: ScreenUtil().setHeight(80),
            right: 0,
            child: const CircleWidget(),
          ),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: widget.stateOfVerification == 1
                    ? VendorVerificationView(
                        phoneNumber: widget.phoneNumber,
                      )
                    : Column(
                        children: [
                          Text(
                            'email_verfication_desc'.translate,
                            style:
                                Theme.of(context).textTheme.headline5?.copyWith(
                                      fontSize: ScreenUtil().setSp(16),
                                    ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            't*****@lacasa.com',
                            style:
                                Theme.of(context).textTheme.headline4?.copyWith(
                                      fontSize: ScreenUtil().setSp(16),
                                    ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
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
                onResendPressed: () {},
              ),
              const BoxHelper(
                height: 50,
              ),
              BlocBuilder<ConfirmCodeCubit, ConfirmCodeState>(
                builder: (context, state) {
                  return SizedBox(
                    height: ScreenUtil().setHeight(55),
                    child: state is ConfirmCodeLoading
                        ? const LoaderWidget()
                        : RegisterButton(
                            radius: 10,
                            title: 'confirm',
                            onPressed: widget.stateOfVerification == 1
                                ? () => confirmCode.verifyCode(
                                      context,
                                    )
                                : () {
                                    var arg = ModalRoute.of(context)
                                        ?.settings
                                        .arguments;
                                    context.router.pushAndPopUntil(
                                      widget.stateOfVerification == 1
                                          ? const ResumeDataRouter()
                                          : const SplashRouter(),
                                      predicate: (_) => false,
                                    );
                                  },
                          ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class VendorVerificationView extends StatelessWidget {
  const VendorVerificationView({
    Key? key,
    this.phoneNumber,
  }) : super(key: key);

  final String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfirmCodeCubit, ConfirmCodeState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(
              'phone_verfication_header'.translate,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontSize: ScreenUtil().setSp(18),
                  ),
              textAlign: TextAlign.center,
            ),
            const BoxHelper(
              height: 10,
            ),
            Text(
              '${'phone_verfication_body'.translate} : \n ${phoneNumber?.replaceRange(0, 6, '*****')}',
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontSize: ScreenUtil().setSp(16),
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
