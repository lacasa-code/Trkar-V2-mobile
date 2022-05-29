import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/home/view/widgets/my_drawer.dart';
import '../../core/extensions/media_query.dart';
import 'package:trkar/addressesData/viewModel/countries/countries_cubit.dart';
import 'package:trkar/core/components/searchable_dropdown_widget.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/home/view/widgets/send_offers_email_view.dart';
import '../../core/extensions/string.dart';

class SupportScreen extends StatefulWidget implements AutoRouteWrapper {
  const SupportScreen({Key? key}) : super(key: key);
  static const routeName = '/support-screen';

  @override
  State<SupportScreen> createState() => _SupportScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    // TODO: implement wrappedRoute
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
      appBar: SearchAppBar(scaffoldKey: scaffoldKey),
      drawer: const MyDrawer(),

      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.arrow_back,
      //     ),
      //     color: Colors.black,
      //     onPressed: () {
      //       NavigationService.goBack();
      //     },
      //   ),
      //   title: Text(
      //     'support'.translate,
      //     style: const TextStyle(color: Colors.black),
      //   ),
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      // ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: ScreenUtil().radius(75),
                    backgroundImage: const AssetImage(
                      'assets/images/support.jpg',
                    ),
                  ),
                  const BoxHelper(
                    height: 10,
                  ),
                  Text(
                    'support_header'.translate,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(15)),
                  ),
                  const BoxHelper(
                    height: 10,
                  ),
                  BlocBuilder<AddressDataCubit, AddressDataState>(
                    builder: (c, state) {
                      return state is CountryLoading
                          ? Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            )
                          : addressDataCubit.countries.isEmpty
                              ? const SizedBox()
                              : SearchableDropDownWidget(
                                  thinBorder: true,
                                  initialValue: addressDataCubit
                                      .getCountryById(int.parse(
                                          Helper.currentUser?.data?.countryId ??
                                              ''
                                                  '0'))
                                      ?.name,
                                  values: addressDataCubit.countries
                                      .map((e) => e.name ?? '')
                                      .toList(),
                                  labelText: 'country',
                                  onChanged: (v) {
                                    if (v == null) {
                                      return;
                                    }
                                    var country = addressDataCubit.countries
                                        .firstWhere(
                                            (element) => element.name == v);
                                    // updateUserProfileCubit.countryId =
                                    //     country.id.toString();
                                    addressDataCubit.getCities(
                                      context,
                                      countryId: country.id,
                                    );
                                  },
                                );
                    },
                  ),
                  const BoxHelper(
                    height: 10,
                  ),
                  SendOffersEmailView(
                    title: 'email_offers'.translate,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: context.width,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                color: Colors.grey.shade300,
              )),
              margin: EdgeInsets.zero,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: RegisterButton(
                  title: 'open_chat',
                  onPressed: () {},
                  radius: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
