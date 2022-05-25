import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/filterCars/viewModel/carMades/filter_cars_cubit.dart';
import 'package:trkar/home/view/widgets/my_drawer.dart';
import '../../../core/extensions/string.dart';

class AllCarMadesScreen extends StatefulWidget {
  const AllCarMadesScreen({Key? key}) : super(key: key);
  static const routeName = '/all-car-mades';

  @override
  State<AllCarMadesScreen> createState() => _AllCarMadesScreenState();
}

class _AllCarMadesScreenState extends State<AllCarMadesScreen> {
  late FilterCarsCubit filterCarsCubit;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    filterCarsCubit = context.read<FilterCarsCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: IconButton(
      //     onPressed: () {
      //       NavigationService.goBack();
      //     },
      //     color: Colors.black,
      //     icon: const Icon(
      //       Icons.arrow_back,
      //     ),
      //   ),
      //   title: Text(
      //     'all_brands'.translate,
      //     style: const TextStyle(
      //       color: Colors.black,
      //     ),
      //   ),
      // ),
      drawer: const MyDrawer(),

      appBar: SearchAppBar(scaffoldKey: scaffoldKey),
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Wrap(
                runSpacing: ScreenUtil().setHeight(20),
                spacing: ScreenUtil().setWidth(30),
                children: List.generate(
                  filterCarsCubit.carMades.length,
                  (index) {
                    var carMade = filterCarsCubit.carMades[index];
                    return Image.network(
                      carMade.image ?? '',
                      fit: BoxFit.cover,
                      height: ScreenUtil().setHeight(90),
                      width: ScreenUtil().setHeight(90),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
