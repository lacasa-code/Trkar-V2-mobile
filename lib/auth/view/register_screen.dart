import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trkar/addressesData/viewModel/countries/countries_cubit.dart';
import 'package:trkar/auth/view/widgets/auth_footer_widget.dart';
import 'package:trkar/auth/viewModel/register/register_cubit.dart';
import 'package:trkar/core/components/circle_widget.dart';
import 'package:trkar/core/components/or_widget.dart';
import 'package:trkar/core/components/profile_picture_widget.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/register_field.dart';
import 'package:trkar/core/components/searchable_dropdown_widget.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/extensions/string.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/core/router/router.gr.dart';

class RegisterScreen extends StatefulWidget implements AutoRouteWrapper {
  const RegisterScreen({
    Key? key,
    this.userType,
  }) : super(key: key);
  final int? userType;
  static const routeName = '/register-screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => RegisterCubit(userType: userType),
        ),
        BlocProvider(
          create: (_) => AddressDataCubit(),
        ),
      ],
      child: this,
    );
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  late RegisterCubit registerCubit;
  late AddressDataCubit addressDataCubit;
  bool securePassword = true;
  bool securePasswordConfirmation = true;

  @override
  void initState() {
    registerCubit = context.read<RegisterCubit>();
    addressDataCubit = context.read<AddressDataCubit>()..getCountries(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Form(
                key: registerCubit.formKey,
                child: Column(
                  children: [
                    const BoxHelper(
                      height: 80,
                    ),
                    SvgPicture.asset(
                      'assets/icons/svg/login-logo.svg',
                      // alignment: Al,
                    ),
                    const BoxHelper(
                      height: 30,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${'create_new_acc'.translate.toTitleCase} ',
                            style:
                                Theme.of(context).textTheme.headline5?.copyWith(
                                      fontSize: ScreenUtil().setSp(18),
                                    ),
                          ),
                          TextSpan(
                            text: registerCubit.userType == 0
                                ? 'as_customer'.translate.toTitleCase
                                : 'as_vendor'.translate.toTitleCase,
                            style:
                                Theme.of(context).textTheme.headline4?.copyWith(
                                      fontSize: ScreenUtil().setSp(18),
                                    ),
                          )
                        ],
                      ),
                    ),
                    const BoxHelper(
                      height: 30,
                    ),
                    // ProfilePictureWidget(
                    //   onPicked: (f) {
                    //     if (f == null) {
                    //       return;
                    //     }
                    //     registerCubit.pickedImage = f;
                    //   },
                    // ),
                    RegisterField(
                      thinBorder: true,
                      prefixWithDivider: true,
                      prefixIcon: const Icon(Icons.person_outline),
                      hintText: 'username',
                      controller: registerCubit.usernameController,
                      validator: registerCubit.userNameValidator,
                    ),
                    RegisterField(
                      thinBorder: true,
                      prefixWithDivider: true,
                      prefixIcon: const Icon(Icons.email_outlined),
                      hintText: 'email',
                      controller: registerCubit.emailController,
                      validator: registerCubit.emailValidator,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Visibility(
                      visible: registerCubit.userType == 1,
                      child: RegisterField(
                        thinBorder: true,
                        prefixWithDivider: true,
                        prefixIcon: const Icon(Icons.phone_outlined),
                        hintText: 'phone',
                        controller: registerCubit.phoneController,
                        validator: registerCubit.phoneValidator,
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    // RegisterField(
                    //   hintText: 'phone',
                    //   controller: registerCubit.phoneController,
                    //   maxLength: 10,
                    //   formatters: [
                    //     FilteringTextInputFormatter.digitsOnly,
                    //   ],
                    //   validator: registerCubit.phoneValidator,
                    //   keyboardType: TextInputType.phone,
                    // ),
                    // BlocBuilder<AddressDataCubit, AddressDataState>(
                    //   builder: (context, state) {
                    //     if (state is CountryLoading) {
                    //       return Center(
                    //         child: Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: CircularProgressIndicator(
                    //             color: Theme.of(context).primaryColor,
                    //           ),
                    //         ),
                    //       );
                    //     }

                    //     return Column(
                    //       children: [
                    //         SearchableDropDownWidget(
                    //           values: addressDataCubit.countries
                    //               .map((e) => e.name ?? '')
                    //               .toList(),
                    //           labelText: 'country',
                    //           validator: registerCubit.countryValidator,
                    //           onChanged: (v) {
                    //             if (v == null) {
                    //               return;
                    //             }
                    //             var country = addressDataCubit.countries
                    //                 .firstWhere((element) => element.name == v);
                    //             registerCubit.countryId = country.id;
                    //             addressDataCubit.getCities(
                    //               context,
                    //               countryId: country.id,
                    //             );
                    //           },
                    //         ),
                    //         Visibility(
                    //           visible: addressDataCubit.cities.isNotEmpty,
                    //           child: SearchableDropDownWidget(
                    //             values: addressDataCubit.cities
                    //                 .map((e) => e.name ?? '')
                    //                 .toList(),
                    //             labelText: 'city',
                    //             validator: registerCubit.cityValidator,
                    //             onChanged: (v) {
                    //               if (v == null) {
                    //                 return;
                    //               }
                    //               var city = addressDataCubit.cities
                    //                   .firstWhere((element) => element.name == v);
                    //               registerCubit.cityId = city.id;

                    //               addressDataCubit.getArea(
                    //                 context,
                    //                 cityId: city.id,
                    //               );
                    //             },
                    //           ),
                    //         ),
                    //         Visibility(
                    //           visible: addressDataCubit.areas.isNotEmpty,
                    //           child: SearchableDropDownWidget(
                    //             values: addressDataCubit.areas
                    //                 .map((e) => e.name ?? '')
                    //                 .toList(),
                    //             labelText: 'area',
                    //             validator: registerCubit.areaValidator,
                    //             onChanged: (v) {
                    //               if (v == null) {
                    //                 return;
                    //               }
                    //               var area = addressDataCubit.areas
                    //                   .firstWhere((element) => element.name == v);
                    //               registerCubit.areaId = area.id;
                    //             },
                    //           ),
                    //         ),
                    //       ],
                    //     );
                    //   },
                    // ),
                    // RegisterField(
                    //   hintText: 'address',
                    //   maxLines: null,
                    //   controller: registerCubit.addressController,
                    //   suffixIcon: IconButton(
                    //     onPressed: () {
                    //       showDialog(
                    //         context: context,
                    //         builder: (_) => BlocProvider<RegisterCubit>.value(
                    //           value: context.read<RegisterCubit>(),
                    //           child: BlocBuilder<RegisterCubit, RegisterState>(
                    //             builder: (context, state) {
                    //               return Dialog(
                    //                 child: MapDialog(
                    //                   onPickedLocation: registerCubit.pickLocation,
                    //                 ),
                    //               );
                    //             },
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //     icon: const Icon(
                    //       Icons.add_location_alt_rounded,
                    //     ),
                    //   ),
                    // ),
                    RegisterField(
                      thinBorder: true,
                      prefixWithDivider: true,
                      prefixIcon: const Icon(Icons.lock_outline),
                      hintText: 'password',
                      controller: registerCubit.passwordController,
                      validator: registerCubit.passwordValidator,
                      obsecureText: securePassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          securePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            securePassword = !securePassword;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: RegisterField(
                        thinBorder: true,
                        prefixWithDivider: true,
                        prefixIcon: const Icon(Icons.lock_outline),
                        hintText: 'password_confirmation',
                        controller:
                            registerCubit.passwordConfirmationController,
                        validator: registerCubit.passwordConfirmationValidator,
                        obsecureText: securePasswordConfirmation,
                        suffixIcon: IconButton(
                          icon: Icon(
                            securePasswordConfirmation
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              securePasswordConfirmation =
                                  !securePasswordConfirmation;
                            });
                          },
                        ),
                      ),
                    ),
                    BlocBuilder<RegisterCubit, RegisterState>(
                      builder: (context, state) {
                        if (state is RegisterLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.orangeAccent,
                            ),
                          );
                        }
                        return RegisterButton(
                          title: 'create_new_acc',
                          onPressed: () => registerCubit.register(context),
                          color: Colors.orangeAccent,
                          radius: 10,
                        );
                      },
                    ),
                    const AuthFooterText(
                      isLogin: false,
                    ),

                    const BoxHelper(
                      height: 180,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: ScreenUtil().setHeight(335),
            right: -ScreenUtil().setWidth(440),
            bottom: ScreenUtil().setHeight(235),
            left: 0,
            child: const CircleWidget(),
          ),
          Positioned(
            top: ScreenUtil().setHeight(490),
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
