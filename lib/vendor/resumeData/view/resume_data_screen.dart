import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/addressesData/viewModel/countries/countries_cubit.dart';
import 'package:trkar/core/components/dropdown_widget.dart';
import 'package:trkar/core/components/map_dialog.dart';
import 'package:trkar/core/components/searchable_dropdown_widget.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/router/router.gr.dart';
import '../../../core/extensions/string.dart';
import 'package:trkar/core/components/register_field.dart';
import 'package:im_stepper/stepper.dart';

class ResumeDataScreen extends StatefulWidget implements AutoRouteWrapper {
  const ResumeDataScreen({Key? key}) : super(key: key);

  @override
  _ResumeDataScreenState createState() => _ResumeDataScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    log('message route');
    return BlocProvider(
      create: (_) => AddressDataCubit(),
      child: this,
    );
  }
}

class _ResumeDataScreenState extends State<ResumeDataScreen> {
  var currentStep = 0;
  bool get isLast => currentStep == steps.length - 1;
  late AddressDataCubit addressDataCubit;

  @override
  void initState() {
    addressDataCubit = context.read<AddressDataCubit>()..getCountries(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      // ),
      // body: Stepper(
      //   physics: const ClampingScrollPhysics(),
      //   onStepTapped: (i) {
      //     setState(() {
      //       currentStep = i;
      //     });
      //   },
      //   key: UniqueKey(),
      //   controlsBuilder: (context, details) => Row(
      //     children: [
      //       Expanded(
      //         flex: 2,
      //         child: RegisterButton(
      //           radius: 10,
      //           title: isLast ? 'complete_regestration' : 'next',
      //           color: isLast ? null : Colors.blue,
      //           onPressed: () {
      //             if (isLast) {
      //               context.router.pushAndPopUntil(
      //                 const TabRoute(),
      //                 predicate: (_) => false,
      //               );
      //               return;
      //             }
      //             setState(() {
      //               currentStep++;
      //             });
      //           },
      //         ),
      //       ),
      //       Visibility(
      //         visible: !isLast,
      //         child: Expanded(
      //           child: InkWell(
      //             onTap: () => setState(
      //               () {
      //                 currentStep++;
      //               },
      //             ),
      //             child: Text(
      //               'skip'.translate,
      //               style: TextStyle(
      //                 decoration: TextDecoration.underline,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      //   currentStep: currentStep,
      //   type: StepperType.horizontal,
      //   steps: steps,
      // ),
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
      const ShopInformationView(),
      StoreIdentityView(addressDataCubit: addressDataCubit, context: context),
      const StoreBranchView(),
      const ShipmentRecipetLocationView(),
      const ShipmentCompaniesView(),
      const OnlinePayment()
    ];
  }

  // Step myStep({
  //   required String title,
  //   required Widget content,
  //   required bool isActive,
  // }) {
  //   return Step(
  //     isActive: isActive,
  //     state: isActive ? StepState.editing : StepState.indexed,
  //     title: Text(
  //       title.translate.toTitleCase,
  //     ),
  //     content: content,
  //   );
  // }
}

class OnlinePayment extends StatelessWidget {
  const OnlinePayment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'online_payment'.translate.toTitleCase,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(16),
              ),
            ),
          ),
          RadioListTile(
            value: 0,
            groupValue: 1,
            onChanged: (v) {},
            title: const Text(
              'MyFatoorah',
            ),
          ),
          RadioListTile(
            value: 0,
            groupValue: 1,
            onChanged: (v) {},
            title: const Text(
              'Hyper Pay',
            ),
          ),
        ],
      ),
    );
  }
}

class ShipmentCompaniesView extends StatelessWidget {
  const ShipmentCompaniesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'shipment_companies'.translate.toTitleCase,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'shipment_companies_helper'.translate.toCapitalized(),
              style: TextStyle(
                fontSize: ScreenUtil().setSp(13),
              ),
            ),
          ),
          RadioListTile(
            value: 0,
            groupValue: 1,
            onChanged: (v) {},
            title: const Text(
              'Marine Logistic',
            ),
          ),
          RadioListTile(
            value: 0,
            groupValue: 1,
            onChanged: (v) {},
            title: const Text(
              'DHL',
            ),
          ),
          RadioListTile(
            value: 0,
            groupValue: 1,
            onChanged: (v) {},
            title: const Text(
              'MSC',
            ),
          ),
        ],
      ),
    );
  }
}

class ShipmentRecipetLocationView extends StatelessWidget {
  const ShipmentRecipetLocationView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'shipment_recipet_location'.translate.toTitleCase,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'shipment_recipet_location_helper'.translate.toCapitalized(),
              style: TextStyle(
                fontSize: ScreenUtil().setSp(13),
              ),
            ),
          ),
          MapDialog(
            onPickedLocation: (v, a) {},
            thinBorder: true,
            showOKButton: false,
          ),
        ],
      ),
    );
  }
}

class StoreBranchView extends StatelessWidget {
  const StoreBranchView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'store_branch'.translate.toTitleCase,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(16),
              ),
            ),
          ),
          const RegisterField(
            labelText: 'branch_name',
            thinBorder: true,
          ),
          const RegisterField(
            labelText: 'branch_address',
            thinBorder: true,
          ),
          const RegisterField(
            labelText: 'phone',
            keyboardType: TextInputType.phone,
            thinBorder: true,
          ),
        ],
      ),
    );
  }
}

class StoreIdentityView extends StatelessWidget {
  const StoreIdentityView({
    Key? key,
    required this.addressDataCubit,
    required this.context,
  }) : super(key: key);

  final AddressDataCubit addressDataCubit;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'store_identity'.translate.toTitleCase,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'describe_store_activity'.translate.toTitleCase,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'store_identity_helper'.translate.toCapitalized(),
              style: TextStyle(
                fontSize: ScreenUtil().setSp(13),
              ),
            ),
          ),
          const RegisterField(
            enabled: false,
            labelText: 'add_logo',
            thinBorder: true,
            suffixIcon: Icon(Icons.camera_alt),
          ),
          const RegisterField(
            enabled: false,
            suffixIcon: Icon(Icons.camera_alt),
            labelText: 'add_banner',
            thinBorder: true,
          ),
          const RegisterField(
            labelText: 'describe_your_activity',
            thinBorder: true,
            maxLines: null,
          ),
          const RegisterField(
            labelText: 'email',
            keyboardType: TextInputType.emailAddress,
            thinBorder: true,
          ),
          BlocBuilder<AddressDataCubit, AddressDataState>(
            builder: (context, state) {
              if (state is CountryLoading) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                );
              }

              return Column(
                children: [
                  SearchableDropDownWidget(
                    values: addressDataCubit.countries
                        .map((e) => e.name ?? '')
                        .toList(),
                    labelText: 'country',
                    // validator: registerCubit.countryValidator,
                    onChanged: (v) {
                      if (v == null) {
                        return;
                      }
                      var country = addressDataCubit.countries
                          .firstWhere((element) => element.name == v);
                      // registerCubit.countryId = country.id;
                      addressDataCubit.getCities(
                        context,
                        countryId: country.id,
                      );
                    },
                    thinBorder: true,
                  ),
                  Visibility(
                    visible: addressDataCubit.cities.isNotEmpty,
                    child: SearchableDropDownWidget(
                      thinBorder: true,
                      values: addressDataCubit.cities
                          .map((e) => e.name ?? '')
                          .toList(),
                      labelText: 'city',
                      // validator: registerCubit.cityValidator,
                      onChanged: (v) {
                        if (v == null) {
                          return;
                        }
                        var city = addressDataCubit.cities
                            .firstWhere((element) => element.name == v);
                        // registerCubit.cityId = city.id;

                        addressDataCubit.getArea(
                          context,
                          cityId: city.id,
                        );
                      },
                    ),
                  ),
                  Visibility(
                    visible: addressDataCubit.areas.isNotEmpty,
                    child: SearchableDropDownWidget(
                      thinBorder: true,

                      values: addressDataCubit.areas
                          .map((e) => e.name ?? '')
                          .toList(),
                      labelText: 'area',
                      // validator: registerCubit.areaValidator,
                      onChanged: (v) {
                        if (v == null) {
                          return;
                        }
                        var area = addressDataCubit.areas
                            .firstWhere((element) => element.name == v);
                        // registerCubit.areaId = area.id;
                      },
                    ),
                  ),
                ],
              );
            },
          ),
          RegisterField(
            thinBorder: true,
            hintText: 'address',
            maxLines: null,
            // controller: registerCubit.addressController,
            suffixIcon: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => Dialog(
                    child: MapDialog(
                      onPickedLocation: (latlng, address) {},
                      // onPickedLocation: registerCubit.pickLocation,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.add_location_alt_rounded,
              ),
            ),
          ),
          const RegisterField(
            thinBorder: true,
            labelText: 'bank_account',
            keyboardType: TextInputType.phone,
          ),
          const RegisterField(
            thinBorder: true,
            labelText: 'commercial_number',
            keyboardType: TextInputType.phone,
          ),
          const RegisterField(
            thinBorder: true,
            labelText: 'tax_number',
            keyboardType: TextInputType.phone,
          ),
          const RegisterField(
            thinBorder: true,
            enabled: false,
            suffixIcon: Icon(
              Icons.attachment,
            ),
            labelText: 'attachment',
            keyboardType: TextInputType.phone,
          ),
          const BoxHelper(
            height: 300,
          ),
        ],
      ),
    );
  }
}

class ShopInformationView extends StatelessWidget {
  const ShopInformationView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'store_information'.translate.toTitleCase,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(16),
              ),
            ),
          ),
          const RegisterField(
            labelText: 'store_name',
            thinBorder: true,
          ),
          const RegisterField(
            labelText: 'store_url',
            keyboardType: TextInputType.url,
            thinBorder: true,
          ),
          DropDownWidget(
            thinBorder: true,
            values: [
              'retail'.toCapitalized(),
              'wholesale'.toCapitalized(),
              'both'.toCapitalized(),
            ],
            labelText: 'store_type',
            onChanged: (v) {},
          ),
        ],
      ),
    );
  }
}
