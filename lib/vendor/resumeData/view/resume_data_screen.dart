import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/addressesData/viewModel/countries/countries_cubit.dart';
import 'package:trkar/core/router/router.gr.dart';
import 'package:trkar/vendor/resumeData/view/widgets/online_payment_view.dart';
import 'package:trkar/vendor/resumeData/view/widgets/shipment_recipet_location_view.dart';
import 'package:trkar/vendor/resumeData/view/widgets/store_branch_view.dart';
import 'package:trkar/vendor/resumeData/view/widgets/store_identity_view.dart';
import 'package:trkar/vendor/resumeData/viewModel/createStore/create_store_cubit.dart';
import 'package:trkar/vendor/resumeData/viewModel/storeTypes/store_type_cubit.dart';
import 'package:im_stepper/stepper.dart';

import 'widgets/shipment_companies_view.dart';
import 'widgets/shop_information_view.dart';

class ResumeDataScreen extends StatefulWidget implements AutoRouteWrapper {
  const ResumeDataScreen({Key? key}) : super(key: key);

  @override
  _ResumeDataScreenState createState() => _ResumeDataScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    log('message route');
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AddressDataCubit(),
        ),
        BlocProvider(
          create: (context) => CreateStoreCubit(),
        ),
        BlocProvider(
          create: (context) => StoreTypeCubit(),
        ),
      ],
      child: this,
    );
  }
}

class _ResumeDataScreenState extends State<ResumeDataScreen> {
  var currentStep = 0;
  bool get isLast => currentStep == steps.length - 1;
  late AddressDataCubit addressDataCubit;
  late StoreTypeCubit storeTypeCubit;

  @override
  void initState() {
    addressDataCubit = context.read<AddressDataCubit>()..getCountries(context);
    storeTypeCubit = context.read<StoreTypeCubit>()..getStoreTypes(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: NumberStepper(
                enableStepTapping: false,
                numbers: List.generate(steps.length, (index) => index + 1),
                enableNextPreviousButtons: false,
                activeStep: currentStep,
                activeStepColor: Theme.of(context).primaryColor,
                numberStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: steps[currentStep],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                currentStep > 0
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            currentStep--;
                          });
                        },
                        icon: const Icon(
                          Icons.navigate_before,
                        ),
                      )
                    : const SizedBox(),
                Row(
                  children: [
                    Visibility(
                      visible: !isLast,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            currentStep++;
                          });
                        },
                        icon: const Icon(
                          Icons.skip_next,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (isLast) {
                          context.router.pushAndPopUntil(
                            const VendorHomeRouter(),
                            predicate: (_) => false,
                          );
                          return;
                        }
                        setState(() {
                          currentStep++;
                        });
                      },
                      icon: Icon(
                        isLast ? Icons.check : Icons.navigate_next,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> get steps {
    return [
      ShopInformationView(
        storeTypeCubit: storeTypeCubit,
      ),
      StoreIdentityView(addressDataCubit: addressDataCubit, context: context),
      const StoreBranchView(),
      const ShipmentRecipetLocationView(),
      const ShipmentCompaniesView(),
      const OnlinePayment()
    ];
  }
}
