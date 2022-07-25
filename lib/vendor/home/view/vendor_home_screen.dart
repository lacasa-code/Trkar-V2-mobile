import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trkar/categories/viewModel/categories/categories_cubit.dart';
import 'package:trkar/core/components/loader_widget.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/router/router.gr.dart';
import 'package:trkar/core/themes/screen_utility.dart';
import 'package:trkar/vendor/createProduct/viewModel/productsType/products_type_cubit.dart';
import 'package:trkar/vendor/home/viewModel/home/home_cubit.dart';
import '../../../core/extensions/string.dart';
import 'package:auto_route/auto_route.dart';

import '../../../filterCars/viewModel/carMades/filter_cars_cubit.dart';
import '../viewModel/myProducts/my_products_cubit.dart';
import 'widgets/add_product_fab.dart';
import 'widgets/empty_product_helper.dart';

class VendorHomeScreen extends StatefulWidget implements AutoRouteWrapper {
  const VendorHomeScreen({Key? key}) : super(key: key);

  @override
  State<VendorHomeScreen> createState() => _VendorHomeScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (_) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => MyProductsCubit(),
        ),
        BlocProvider(
          create: (context) => ProductsTypeCubit(),
        ),
      ],
      child: this,
    );
  }
}

class _VendorHomeScreenState extends State<VendorHomeScreen> {
  late HomeCubit homeCubit;
  late CategoriesCubit categoriesCubit;
  late MyProductsCubit myProductsCubit;

  @override
  void initState() {
    categoriesCubit = context.read<CategoriesCubit>()
      ..getCategories(
        context,
      );
    myProductsCubit = context.read<MyProductsCubit>()
      ..getMyProducts(
        context,
      );
    context.read<ProductsTypeCubit>().getProductTypes(context);
    context.read<FilterCarsCubit>()
      ..getCarYears(context)
      ..getOriginCountries(context);
    homeCubit = context.read<HomeCubit>();
    super.initState();
  }

  // var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // log('product length=> ${myProductsCubit.products.length} ${myProductsCubit.state}');
    return Scaffold(
      // key: scaffoldKey,
      // extendBodyBehindAppBar: true,
      // drawer: VendorDrawer(
      //   context: context,
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AddProductFAB(
        onTap: () => homeCubit.addNewProduct(),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          SvgPicture.asset(
            'assets/icons/svg/vendor/notification.svg',
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: MainStyle.lightGreyColor,
              ),
              shape: BoxShape.circle,
            ),
            child: const CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/profile2.png',
              ),
            ),
          ),
        ],
        leading: PopupMenuButton(
          itemBuilder: (_) => [
            PopupMenuItem(
              onTap: () async {
                await Helper.clearVendorData();
                context.router.pushAndPopUntil(
                  const TabRoute(),
                  predicate: (r) => false,
                );
              },
              child: Text(
                'logout'.translate,
              ),
            ),
          ],
          child: SvgPicture.asset(
            'assets/icons/svg/vendor/menu-icon.svg',
          ),
        ),
      ),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, categoryState) {
          if (categoryState is CategoriesLoading) {
            return const LoaderWidget();
          }
          return BlocBuilder<MyProductsCubit, MyProductsState>(
            builder: (context, productState) {
              log('product length=> ${myProductsCubit.products.length} ');
              return BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/svg/vendor/banner.svg',
                        ),

                        Column(
                          children: [
                            Column(
                              children: List.generate(
                                homeCubit.createProductView.length,
                                (index) {
                                  var createProductView =
                                      homeCubit.createProductView[index];
                                  return createProductView;
                                },
                              ),
                            ),
                            // if (myProductsCubit.products.isEmpty)
                            //   const BoxHelper(
                            //     height: 160,
                            //   ),
                          ],
                        ),
                        if (productState is MyProductsLoading) ...[
                          const LoaderWidget(),
                        ] else if (myProductsCubit.products.isEmpty) ...[
                          const EmptyProductHelper(),
                        ],
                        Column(
                          children: [
                            Column(
                              children: List.generate(
                                myProductsCubit.productsView.length,
                                (index) {
                                  var createProductView =
                                      myProductsCubit.productsView[index];
                                  return createProductView;
                                },
                              ),
                            ),
                            const BoxHelper(
                              height: 160,
                            ),
                          ],
                        ),

                        // VendorHomeHeaderItem(),
                        // CreateStoreButton(),
                        // LatestAddedProductView(),
                        // TopSellersProducts(),
                        // MostViewedProducts(),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class CreateStoreButton extends StatelessWidget {
  const CreateStoreButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: InkWell(
          onTap: () {
            context.router.push(
              const ResumeDataRouter(),
            );
          },
          child: const Text(
            'Create Store Data',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}

// class VendorHomeHeaderItem extends StatelessWidget {
//   const VendorHomeHeaderItem({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(35)),
//       margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(60)),
//       child: Stack(
//         alignment: Alignment.center,
//         clipBehavior: Clip.none,
//         children: [
//           Container(
//             height: ScreenUtil().setHeight(120),
//             decoration: BoxDecoration(
//               border: Border(
//                 bottom: BorderSide(
//                   width: 2,
//                   color: Theme.of(context).primaryColor,
//                 ),
//               ),
//               image: const DecorationImage(
//                 image: AssetImage(
//                   'assets/images/profile_cover.jpg',
//                 ),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: -ScreenUtil().setHeight(70),
//             child: Column(
//               children: [
//                 Container(
//                   height: ScreenUtil().setHeight(80),
//                   width: ScreenUtil().setWidth(80),
//                   decoration: BoxDecoration(
//                     // TODO :remove comment
//                     // border: Border.all(width: 2,color: Theme.of(context).primaryColor),
//                     shape: BoxShape.circle,
//                     image: DecorationImage(
//                       image: const AssetImage('assets/images/profile2.png'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 5),
//                   child: Text(
//                     Helper.currentVendor?.data?.username ?? '',
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             // child: CircleAvatar(
//             //    backgroundImage: AssetImage(
//             //     'assets/icons/woman3.png',
//             //   ),
//             // ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class LatestAddedProductView extends StatelessWidget {
//   const LatestAddedProductView({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//           child: Text(
//             'recently_added'.translate.toTitleCase,
//             textAlign: TextAlign.start,
//             style: const TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         const BoxHelper(
//           height: 10,
//         ),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: List.generate(
//               2,
//               (index) => const ProductItem(
//                 canAddToCart: false,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class TopSellersProducts extends StatelessWidget {
//   const TopSellersProducts({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//           child: Text(
//             'top_sellers'.translate.toTitleCase,
//             textAlign: TextAlign.start,
//             style: const TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         const BoxHelper(
//           height: 10,
//         ),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: List.generate(
//               3,
//               (index) => const ProductItem(
//                 canAddToCart: false,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class MostViewedProducts extends StatelessWidget {
//   const MostViewedProducts({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//           child: Text(
//             'most_viewed'.translate.toTitleCase,
//             textAlign: TextAlign.start,
//             style: const TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         const BoxHelper(
//           height: 10,
//         ),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: List.generate(
//               1,
//               (index) => const ProductItem(
//                 canAddToCart: false,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
