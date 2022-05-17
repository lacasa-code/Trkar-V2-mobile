import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/categories/view/widgets/manufacturers_details_item.dart';
import 'package:trkar/core/helper/navigator.dart';
import '../../../core/extensions/string.dart';
import '../../../core/extensions/media_query.dart';
import 'package:trkar/filterCars/viewModel/carMades/filter_cars_cubit.dart';

class AllManufacturersScreen extends StatefulWidget {
  const AllManufacturersScreen({Key? key}) : super(key: key);
  static const routeName = '/all-manufactureres-screen';

  @override
  State<AllManufacturersScreen> createState() => _AllManufacturersScreenState();
}

class _AllManufacturersScreenState extends State<AllManufacturersScreen> {
  late FilterCarsCubit filterCarsCubit;

  @override
  void initState() {
    filterCarsCubit = context.read<FilterCarsCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            NavigationService.goBack();
          },
          color: Colors.black,
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          'all_manufacturers'.translate,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
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
                  filterCarsCubit.categoriesManufacturers.length,
                  (index) {
                    var manufacurer =
                        filterCarsCubit.categoriesManufacturers[index];
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Visibility(
                          visible: manufacurer.image != null,
                          child: Image.network(
                            manufacurer.image ?? '',
                            height: ScreenUtil().setHeight(40),
                            width: ScreenUtil().setHeight(40),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              manufacurer.name ?? '',
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(18),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Visibility(
                              visible: manufacurer.address != null,
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => Dialog(
                                      child: SizedBox(
                                        // margin: EdgeInsets.symmetric(
                                        //   horizontal: 15,
                                        // ),
                                        width: context.width,
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  ManufacturerDetailsItem(
                                                    title: 'Company Name :',
                                                    details: manufacurer
                                                        .categoryName,
                                                  ),
                                                  ManufacturerDetailsItem(
                                                    title: 'Address :',
                                                    details:
                                                        manufacurer.address,
                                                  ),
                                                  ManufacturerDetailsItem(
                                                    title: 'website :',
                                                    details:
                                                        manufacurer.website,
                                                    isLink: true,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              top: -ScreenUtil().setHeight(40),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      NavigationService
                                                          .goBack();
                                                    },
                                                    icon: const Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'show_address'.translate,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: ScreenUtil().setSp(13),
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Transform.scale(
                                      scale: 0.5,
                                      child: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
