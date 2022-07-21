import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trkar/auth/viewModel/forgetPassword/forget_password_cubit.dart';
import 'package:trkar/core/components/circle_widget.dart';
import 'package:trkar/core/components/loader_widget.dart';
import '../../core/extensions/string.dart';
import 'package:trkar/auth/view/phone_verification_screen.dart';
import 'package:trkar/auth/view/widgets/header_widget.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/register_field.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:trkar/core/router/router.gr.dart';

class ForgetPasswordScreen extends StatefulWidget implements AutoRouteWrapper {
  const ForgetPasswordScreen({Key? key}) : super(key: key);
  static const routeName = '/forget_password';

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    // TODO: implement wrappedRoute
    return BlocProvider(
      create: (_) => ForgetPasswordCubit(),
      child: this,
    );
  }
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late ForgetPasswordCubit forgetPasswordCubit;

  @override
  void initState() {
    forgetPasswordCubit = context.read<ForgetPasswordCubit>();
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
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   title: Text(
      //     'forget_password'.translate,
      //   ),
      // ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const BoxHelper(
                    height: 100,
                  ),
                  SvgPicture.asset(
                    'assets/icons/svg/login-logo.svg',
                    // alignment: Al,
                  ),
                  const BoxHelper(
                    height: 30,
                  ),
                  // const HeaderWidget(
                  //   title: 'forget_password',
                  //   footer: 'enter_email',
                  // ),

                  Text(
                    'dont_worry'.translate,
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontSize: ScreenUtil().setSp(18),
                        ),
                  ),
                  Text(
                    'enter_email_to_restore'
                        .translate
                        .split('\n')
                        .first
                        .toTitleCase,
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontSize: ScreenUtil().setSp(18),
                        ),
                  ),
                  Text(
                    'enter_email_to_restore'
                        .translate
                        .split('\n')
                        .last
                        .toTitleCase,
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontSize: ScreenUtil().setSp(18),
                        ),
                  ),
                  // RichText(
                  //   text: TextSpan(
                  //     children: [],
                  //   ),
                  // ),

                  const BoxHelper(
                    height: 50,
                  ),
                  Form(
                    key: forgetPasswordCubit.formKey,
                    child: RegisterField(
                      hintText: 'email',
                      validator: forgetPasswordCubit.emailValidator,
                      controller: forgetPasswordCubit.emailController,
                      thinBorder: true,
                      prefixWithDivider: true,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                  ),
                  const BoxHelper(
                    height: 95,
                  ),
                  BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                    builder: (context, state) {
                      if (state is ForgetPasswordLoading) {
                        return const LoaderWidget();
                      }
                      return SizedBox(
                        height: ScreenUtil().setHeight(55),
                        child: RegisterButton(
                          radius: 10,
                          title: 'send_message',
                          onPressed: () =>
                              forgetPasswordCubit.forgetPassword(context),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: ScreenUtil().setHeight(335),
            right: -ScreenUtil().setWidth(430),
            bottom: ScreenUtil().setHeight(235),
            left: 0,
            child: CircleWidget(),
          ),
          Positioned(
            top: ScreenUtil().setHeight(470),
            left: -ScreenUtil().setWidth(440),
            bottom: ScreenUtil().setHeight(80),
            right: 0,
            child: const CircleWidget(),
          ),
        ],
      ),
    );
  }
}
