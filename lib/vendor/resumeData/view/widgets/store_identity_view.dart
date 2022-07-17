import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../addressesData/viewModel/countries/countries_cubit.dart';
import '../../../../core/components/loader_widget.dart';
import '../../../../core/components/map_dialog.dart';
import '../../../../core/components/register_field.dart';
import '../../../../core/components/searchable_dropdown_widget.dart';
import '../../../../core/components/sized_box_helper.dart';
import '../../../../core/extensions/string.dart';

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
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: LoaderWidget(),
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
