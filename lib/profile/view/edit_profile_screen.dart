import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/addressesData/viewModel/countries/countries_cubit.dart';
import 'package:trkar/core/components/circle_widget.dart';
import 'package:trkar/core/components/loader_widget.dart';
import 'package:trkar/core/components/map_dialog.dart';
import 'package:trkar/core/components/profile_picture_widget.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/register_field.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';
import 'package:trkar/core/components/searchable_dropdown_widget.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/home/view/widgets/my_drawer.dart';
import 'package:trkar/profile/viewModel/updateUserProfile/update_user_profile_cubit.dart';
import 'package:trkar/profile/viewModel/userProfile/user_profile_cubit.dart';
import '../../core/extensions/string.dart';

class EditProfileScreen extends StatefulWidget implements AutoRouteWrapper {
  const EditProfileScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = '/profile-screen';

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    // TODO: implement wrappedRoute
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UpdateUserProfileCubit(),
        ),
        BlocProvider(
          create: (_) => AddressDataCubit(),
        ),
      ],
      child: this,
    );
  }
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late UserProfileCubit profileCubit;
  late UpdateUserProfileCubit updateUserProfileCubit;
  late AddressDataCubit addressDataCubit;
  var securePassword = true;
  var securePasswordConfirmation = true;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    addressDataCubit = context.read<AddressDataCubit>();
    updateUserProfileCubit = context.read<UpdateUserProfileCubit>();
    profileCubit = BlocProvider.of<UserProfileCubit>(context)
      ..getUserProfile(context).then((value) {
        updateUserProfileCubit.initialData(context);
      });
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
      //     'edit_profile'.translate,
      //     style: const TextStyle(color: Colors.black),
      //   ),
      // ),
      body: BlocBuilder<UserProfileCubit, UserProfileState>(
        builder: (context, userDataState) {
          if (userDataState is UserProfileLoading) {
            return const LoaderWidget();
          }

          return Stack(
            children: [
              Positioned(
                top: ScreenUtil().setHeight(270),
                right: -ScreenUtil().setWidth(445),
                bottom: ScreenUtil().setHeight(145),
                left: 0,
                child: const CircleWidget(),
              ),
              Positioned(
                top: ScreenUtil().setHeight(379),
                left: -ScreenUtil().setWidth(430),
                bottom: ScreenUtil().setHeight(50),
                right: 0,
                child: const CircleWidget(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Form(
                        key: updateUserProfileCubit.profileFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProfilePictureWidget(
                              onPicked: (f) {
                                if (f == null) {
                                  return;
                                }
                                updateUserProfileCubit.pickedImage = f;
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Text(
                                'personal_information'.translate,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: ScreenUtil().setSp(16),
                                ),
                              ),
                            ),
                            const FieldHeaderTitle(title: 'full_name'),
                            RegisterField(
                              thinBorder: true,
                              hintText: 'full_name',
                              controller: updateUserProfileCubit.nameController,
                              validator:
                                  updateUserProfileCubit.userNameValidator,
                            ),
                            const FieldHeaderTitle(title: 'email'),
                            RegisterField(
                              thinBorder: true,
                              hintText: 'email',
                              controller:
                                  updateUserProfileCubit.emailController,
                              validator: updateUserProfileCubit.emailValidator,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const FieldHeaderTitle(title: 'phone'),
                            RegisterField(
                              thinBorder: true,
                              hintText: 'phone',
                              controller:
                                  updateUserProfileCubit.phoneController,
                              maxLength: 10,
                              formatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              validator: updateUserProfileCubit.phoneValidator,
                              keyboardType: TextInputType.phone,
                            ),
                            BlocBuilder<AddressDataCubit, AddressDataState>(
                              builder: (context, state) {
                                // if (state is CountryLoading ||
                                //     state is CityLoading ||
                                //     state is AreaLoading) {
                                //   return Center(
                                //     child: Padding(
                                //       padding: const EdgeInsets.all(8.0),
                                //       child: CircularProgressIndicator(
                                //         color: Theme.of(context).primaryColor,
                                //       ),
                                //     ),
                                //   );
                                // }

                                return Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    state is CountryLoading
                                        ? const Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: LoaderWidget(),
                                            ),
                                          )
                                        : addressDataCubit.countries.isEmpty
                                            ? const SizedBox()
                                            : Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  const FieldHeaderTitle(
                                                      title: 'country'),
                                                  SearchableDropDownWidget(
                                                    thinBorder: true,
                                                    initialValue: updateUserProfileCubit
                                                                .countryId ==
                                                            null
                                                        ? null
                                                        : addressDataCubit
                                                            .getCountryById(int.parse(
                                                                updateUserProfileCubit
                                                                        .countryId ??
                                                                    '0'))
                                                            ?.name,
                                                    values: addressDataCubit
                                                        .countries
                                                        .map(
                                                            (e) => e.name ?? '')
                                                        .toList(),
                                                    labelText: 'country',
                                                    validator:
                                                        updateUserProfileCubit
                                                            .countryValidator,
                                                    onChanged: (v) {
                                                      if (v == null) {
                                                        return;
                                                      }
                                                      var country =
                                                          addressDataCubit
                                                              .countries
                                                              .firstWhere(
                                                                  (element) =>
                                                                      element
                                                                          .name ==
                                                                      v);
                                                      updateUserProfileCubit
                                                              .countryId =
                                                          country.id.toString();
                                                      addressDataCubit
                                                          .getCities(
                                                        context,
                                                        countryId: country.id,
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                    Visibility(
                                      visible:
                                          addressDataCubit.cities.isNotEmpty ||
                                              state is CityLoading,
                                      child: state is CityLoading
                                          ? const Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: LoaderWidget(),
                                              ),
                                            )
                                          : addressDataCubit.cities.isEmpty
                                              ? const SizedBox()
                                              : Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    const FieldHeaderTitle(
                                                        title: 'city'),
                                                    SearchableDropDownWidget(
                                                      thinBorder: true,
                                                      values: addressDataCubit
                                                          .cities
                                                          .map((e) =>
                                                              e.name ?? '')
                                                          .toList(),
                                                      labelText: 'city',
                                                      initialValue: updateUserProfileCubit
                                                                  .cityId ==
                                                              null
                                                          ? null
                                                          : addressDataCubit
                                                              .getCityById(int.parse(
                                                                  updateUserProfileCubit
                                                                          .cityId ??
                                                                      ''))
                                                              ?.name,
                                                      validator:
                                                          updateUserProfileCubit
                                                              .cityValidator,
                                                      onChanged: (v) {
                                                        if (v == null) {
                                                          return;
                                                        }
                                                        var city = addressDataCubit
                                                            .cities
                                                            .firstWhere(
                                                                (element) =>
                                                                    element
                                                                        .name ==
                                                                    v);
                                                        updateUserProfileCubit
                                                                .cityId =
                                                            city.id.toString();

                                                        addressDataCubit
                                                            .getArea(
                                                          context,
                                                          cityId: city.id,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                    ),
                                    Visibility(
                                      visible:
                                          addressDataCubit.areas.isNotEmpty ||
                                              state is AreaLoading,
                                      child: state is AreaLoading
                                          ? const Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: LoaderWidget(),
                                              ),
                                            )
                                          : addressDataCubit.areas.isEmpty
                                              ? const SizedBox()
                                              : Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    const FieldHeaderTitle(
                                                        title: 'area'),
                                                    SearchableDropDownWidget(
                                                      thinBorder: true,
                                                      values: addressDataCubit
                                                          .areas
                                                          .map((e) =>
                                                              e.name ?? '')
                                                          .toList(),
                                                      labelText: 'area',
                                                      initialValue: updateUserProfileCubit
                                                                  .areaId ==
                                                              null
                                                          ? null
                                                          : addressDataCubit
                                                              .getAreaById(int.parse(
                                                                  updateUserProfileCubit
                                                                          .areaId ??
                                                                      '0'))
                                                              ?.name,
                                                      validator:
                                                          updateUserProfileCubit
                                                              .areaValidator,
                                                      onChanged: (v) {
                                                        if (v == null) {
                                                          return;
                                                        }
                                                        var area = addressDataCubit
                                                            .areas
                                                            .firstWhere(
                                                                (element) =>
                                                                    element
                                                                        .name ==
                                                                    v);
                                                        updateUserProfileCubit
                                                                .areaId =
                                                            area.id.toString();
                                                      },
                                                    ),
                                                  ],
                                                ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            const FieldHeaderTitle(title: 'address'),
                            RegisterField(
                              thinBorder: true,
                              hintText: 'address',
                              maxLines: null,
                              controller:
                                  updateUserProfileCubit.addressController,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => BlocProvider<
                                        UpdateUserProfileCubit>.value(
                                      value: context
                                          .read<UpdateUserProfileCubit>(),
                                      child: BlocBuilder<UpdateUserProfileCubit,
                                          UpdateUserProfileState>(
                                        builder: (context, state) {
                                          return Dialog(
                                            child: MapDialog(
                                              onPickedLocation:
                                                  updateUserProfileCubit
                                                      .pickLocation,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.add_location_alt_rounded,
                                ),
                              ),
                            ),
                            BlocBuilder<UpdateUserProfileCubit,
                                UpdateUserProfileState>(
                              builder: (context, state) {
                                if (state is UpdateUserProfileLoading) {
                                  return const LoaderWidget();
                                }
                                return RegisterButton(
                                  radius: 10,
                                  title: 'update_data',
                                  onPressed: () => updateUserProfileCubit
                                      .updateUserProfile(context),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const BoxHelper(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Text(
                          'password'.translate,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(16),
                          ),
                        ),
                      ),
                      Form(
                        key: updateUserProfileCubit.passwordFormKey,
                        child: Column(
                          children: [
                            RegisterField(
                              thinBorder: true,
                              hintText: 'password',
                              controller:
                                  updateUserProfileCubit.passwordController,
                              validator:
                                  updateUserProfileCubit.passwordValidator,
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
                            RegisterField(
                              thinBorder: true,
                              hintText: 'password_confirmation',
                              controller: updateUserProfileCubit
                                  .passwordConfirmationController,
                              validator: updateUserProfileCubit
                                  .passwordConfirmationValidator,
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
                            const BoxHelper(
                              height: 20,
                            ),
                            BlocBuilder<UpdateUserProfileCubit,
                                UpdateUserProfileState>(
                              builder: (context, state) {
                                if (state is UpdateUserPasswordLoading) {
                                  return const LoaderWidget();
                                }
                                return RegisterButton(
                                  radius: 10,
                                  title: 'update_password',
                                  onPressed: () => updateUserProfileCubit
                                      .updateUserPassword(context),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const BoxHelper(
                        height: 160,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class FieldHeaderTitle extends StatelessWidget {
  const FieldHeaderTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        title.translate.toTitleCase,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: ScreenUtil().setSp(13),
        ),
      ),
    );
  }
}
