import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trkar/core/router/router.gr.dart';
import 'package:trkar/support/view/widgets/support_contact_button.dart';
import 'package:trkar/support/view/widgets/support_header.dart';
import 'package:trkar/support/view/widgets/support_send_email_view.dart';
import 'package:trkar/addressesData/viewModel/countries/countries_cubit.dart';
import '../../core/extensions/string.dart';

class SupportScreen extends StatefulWidget implements AutoRouteWrapper {
  const SupportScreen({Key? key}) : super(key: key);
  static const routeName = '/support-screen';

  @override
  State<SupportScreen> createState() => _SupportScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AddressDataCubit(),
      child: this,
    );
  }
}

class _SupportScreenState extends State<SupportScreen> {
  late AddressDataCubit addressDataCubit;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    addressDataCubit = context.read<AddressDataCubit>()..getCountries(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          'reach_support'.translate,
          style: Theme.of(context).textTheme.headline1?.copyWith(
                fontSize: ScreenUtil().setSp(15),
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          color: Theme.of(context).primaryIconTheme.color,
          iconSize: ScreenUtil().radius(15),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SupportHeader(),
          SupportContactButton(
            title: 'contact_live_chat',
            onPressed: () {},
            leadingSvgName: 'support',
          ),
          SupportContactButton(
            title: 'submit_a_request',
            onPressed: () {
              context.router.push(
                const SubmitRequestRouter(),
              );
            },
            leadingSvgName: 'submit-request-icon',
          ),
          const SupportSendEmailView(),
        ],
      ),
    );
  }
}
