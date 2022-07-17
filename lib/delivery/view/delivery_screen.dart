import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:trkar/addressesData/viewModel/countries/countries_cubit.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/home/view/widgets/my_drawer.dart';
import '../../core/extensions/string.dart';
import 'package:flag/flag.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/core/components/loader_widget.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({Key? key}) : super(key: key);
  static const routeName = '/delivery-screen';

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
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
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   title: Text(
      //     'delivery'.translate,
      //     style: const TextStyle(
      //       color: Colors.black,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.arrow_back,
      //     ),
      //     color: Colors.black,
      //     onPressed: () {
      //       NavigationService.goBack();
      //     },
      //   ),
      // ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                'delivery'.translate.toUpperCase(),
                style: TextStyle(
                  color: const Color(0xff82919A),
                  fontSize: ScreenUtil().setSp(17),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Row(
                // Icon(countriesFlag[IsoCode.EG])
                children: [
                  Flag.fromCode(
                    FlagsCode.EG,
                    height: ScreenUtil().setHeight(40),
                    width: ScreenUtil().setWidth(40),
                  ),
                  const BoxHelper(
                    width: 10,
                  ),
                  Text(
                    'TO Egypt',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(14),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.attach_money,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text(
                'SR 8.56',
              ),
              subtitle: Text('${'delivery_costed'.translate} SR123'),
            ),
            ListTile(
              leading: Icon(
                Icons.attach_money,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text(
                'SR 0.00',
              ),
              subtitle: Text(
                  '${'free_delivery'.translate} SR123 ${'and_above'.translate}'),
            ),
            const VatDetailsView(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: const Color(0xffF3F4F5),
              child: Column(
                children: [
                  Text(
                    'delivery_for_island'.translate,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: ScreenUtil().setSp(15),
                    ),
                  ),
                  const BoxHelper(
                    height: 10,
                  ),
                  const ShippingCostItem(
                    title: 'Gibraltar',
                  ),
                  const ShippingCostItem(
                    title: 'Isle of Man (GB)',
                  ),
                  const ShippingCostItem(
                    title: 'Jersey (GB)',
                  ),
                  const ShippingCostItem(
                    title: 'Guernsey (GB)',
                  ),
                ],
              ),
            ),
            BlocBuilder<AddressDataCubit, AddressDataState>(
              builder: (context, state) {
                if (state is CountryLoading) {
                  return const LoaderWidget();
                }
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Wrap(
                    children: [
                      ...List.generate(
                        3,
                        (index) {
                          var country = addressDataCubit.countries[index];
                          return CountryShipCostItem(
                            countryName: country.name,
                            countryCode: country.countryCode,
                            cost: '434',
                          );
                        },
                      )
                    ],
                  ),
                );
              },
            ),
            const DeliveryDetailsView(),
          ],
        ),
      ),
    );
  }
}

class DeliveryDetailsView extends StatelessWidget {
  const DeliveryDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DeliveryDetailsItem(
          title: 'delivery_times'.translate,
          subTitle: 'delivery_times_body'.translate,
          leadingIcon: Icon(
            Icons.timelapse_outlined,
            color: Theme.of(context).primaryColor,
          ),
        ),
        DeliveryDetailsItem(
          title: 'in_stock'.translate,
          subTitle: 'in_stock_body'.translate,
          leadingIcon: const Icon(
            FontAwesome5.box,
            color: Colors.green,
          ),
        ),
        DeliveryDetailsItem(
          title: 'not_in_stock'.translate,
          subTitle: 'not_in_stock_body'.translate,
          leadingIcon: const Icon(
            FontAwesome5.box,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}

class DeliveryDetailsItem extends StatelessWidget {
  const DeliveryDetailsItem(
      {Key? key,
      required this.leadingIcon,
      required this.subTitle,
      required this.title})
      : super(key: key);
  final String title, subTitle;
  final Widget leadingIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingIcon,
      title: Text(
        title,
        style: TextStyle(
          color: const Color(0xff82919A),
          fontSize: ScreenUtil().setSp(17),
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          subTitle,
          style: const TextStyle(
            color: Color(0xff82919A),
          ),
        ),
      ),
    );
  }
}

class CountryShipCostItem extends StatelessWidget {
  const CountryShipCostItem({
    Key? key,
    this.cost,
    this.countryCode,
    this.countryName,
  }) : super(key: key);
  final String? countryName;
  final String? countryCode;
  final String? cost;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Flag.fromString(
            countryCode!,
            height: ScreenUtil().setHeight(40),
            width: ScreenUtil().setWidth(40),
          ),
          const BoxHelper(
            width: 10,
          ),
          Text(
            countryName ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff82919A),
            ),
          ),
          const BoxHelper(
            width: 10,
          ),
          Container(
            color: const Color(0xffF3F4F5),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text(
              'SR 14.5',
              style: TextStyle(
                color: Color(0xff82919A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShippingCostItem extends StatelessWidget {
  const ShippingCostItem({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.4,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              // color: Theme.of(context).primaryColor,
              fontSize: ScreenUtil().setSp(15),
            ),
          ),
          Text(
            'SR14.09',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              // color: Theme.of(context).primaryColor,
              fontSize: ScreenUtil().setSp(15),
            ),
          ),
        ],
      ),
    );
  }
}

class VatDetailsView extends StatelessWidget {
  const VatDetailsView({
    Key? key,
    // required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = 'vat_desc'.translate.split('\n').where((element) {
      return element != 'vat_desc'.translate.split('\n').first;
    }).toList();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            'vat_desc'.translate.split('\n').first,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: RichText(
            // textAlign: TextAlign.center,
            text: TextSpan(
              children: List.generate(list.length, (index) {
                // log('${list[index]} $index ');
                return TextSpan(
                  text: '${index > 0 ? '* ' : ''}${list[index]} \n\n',
                  style: TextStyle(
                    fontWeight: index == 0 ? FontWeight.bold : null,
                    color: Colors.black,
                    fontSize: ScreenUtil().setSp(15),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
