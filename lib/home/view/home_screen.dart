import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/Addresses/view/addresses_screen.dart';
import 'package:trkar/auth/viewModel/logout/logout_cubit.dart';
import 'package:trkar/categories/view/sub_categories_screen.dart';
import 'package:trkar/categories/viewModel/categories/categories_cubit.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/register_field.dart';
import 'package:trkar/core/components/search_icon.dart';
import 'package:trkar/core/components/search_modal_bottom_sheet.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/extensions/string.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/home/view/widgets/home_categories_item.dart';
import 'package:trkar/home/view/widgets/my_drawer.dart';
import 'package:trkar/home/view/widgets/recently_viewed_product_view.dart';
import 'package:trkar/home/view/widgets/select_car_card.dart';
import 'package:trkar/home/view/widgets/send_offers_email_view.dart';
import 'package:trkar/localization/view/change_language_screen.dart';
import '../../core/extensions/media_query.dart';
import 'package:trkar/profile/view/edit_profile_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late CategoriesCubit categoriesCubit;
  late SubCategoriesCubit subCategoriesCubit;
  late TabController _controller;
  var isInit = true;
  final key = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    subCategoriesCubit = context.read<SubCategoriesCubit>();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (isInit) {
      categoriesCubit = context.read<CategoriesCubit>()
        ..getAllCategories(context).then((value) {
          _controller = TabController(
              length: categoriesCubit.maincategory.length, vsync: this);
          setState(() {});
        });
      isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is AllCategoriesLoading) {
            return const LoaderWidget();
          }

          return Scaffold(
            key: key,
            drawer: const MyDrawer(),
            appBar: AppBar(
              /*
              bottom: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                labelPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                isScrollable: true,
                indicator: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15)),
                controller: _controller,
                tabs: categoriesCubit.maincategory
                    .map(
                      (e) => Row(
                        children: [
                          Text(
                            e.name ?? '',
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
              */
              // automaticallyImplyLeading: false,
              titleTextStyle: const TextStyle(color: Colors.black),
              title: Row(
                children: const [
                  SelectCarWidget(),
                  SearchIcon(),
                ],
              ),
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  log('message');
                  key.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu),
                color: Colors.black,
              ),
              backgroundColor: Colors.transparent,
              actions: [
                PopupMenuButton(
                  icon: Icon(
                    Icons.settings_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                  onSelected: (v) {
                    if (v == 'edit') {
                      NavigationService.push(
                        page: EditProfileScreen.routeName,
                      );
                    }
                    if (v == 'addresses') {
                      NavigationService.push(
                        page: AddressesScreen.routeName,
                      );
                    }
                    if (v == 'lang') {
                      NavigationService.push(
                        page: ChangeLanguageScreen.routeName,
                      );
                    }
                    if (v == 'logout') {
                      BlocProvider.of<LogoutCubit>(context).logOut(context);
                    }
                  },
                  itemBuilder: (_) => [
                    PopupMenuItem(
                      value: 'edit',
                      child: Text(
                        'edit_profile'.translate,
                      ),
                    ),
                    PopupMenuItem(
                      value: 'lang',
                      child: Text(
                        'lang'.translate,
                      ),
                    ),
                    PopupMenuItem(
                      value: 'addresses',
                      child: Text(
                        'addresses'.translate,
                      ),
                    ),
                    PopupMenuItem(
                      value: 'logout',
                      child: Text(
                        'logout'.translate,
                      ),
                    ),
                  ],
                ),
                // IconButton(
                //   onPressed: () {
                //     NavigationService.push(
                //       page: EditProfileScreen.routeName,
                //     );
                //   },
                //   color: Theme.of(context).primaryColor,
                //   icon: const Icon(
                //     Icons.settings_outlined,
                //   ),
                // ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const HomeCarouselCard(),
                  Column(
                    children: [
                      Align(
                        alignment: Helper.appAlignment,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Text(
                            'all_categories'.translate,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(15),
                            ),
                          ),
                        ),
                      ),
                      ...List.generate(categoriesCubit.allcategory.length,
                          (index) {
                        var cat = categoriesCubit.allcategory[index];

                        return HomeCategoryItem(
                          onTap: () {
                            // var hasSubCat = categoriesCubit.hasSubCategory(cat.id);
                            // if (hasSubCat) {
                            var subCat = context.read<SubCategoriesCubit>();
                            subCat.categoryName = cat.name;
                            subCat.parentId = cat.id;
                            NavigationService.push(
                              page: SubCategoriesScreen.routeName,
                              arguments: {
                                'category_name': cat.name,
                                'parent_id': cat.id,
                              },
                            );
                          },
                          title: cat.name,
                          imagePath: cat.image,
                        );
                      }),
                    ],
                  ),
                  const RecentlyViewedProductsView(),
                  const SendOffersEmailView(),
                  /*
                  Expanded(
                    child: TabBarView(
                      controller: _controller,
                      children: categoriesCubit.maincategory
                          .map(
                            (e) => Column(
                              children: [
                                SingleChildScrollView(
                                  child: Wrap(
                                    spacing: ScreenUtil().setWidth(10),
                                    children: List.generate(
                                      categoriesCubit
                                                  .subCategories(e.id ?? 0)
                                                  .length >
                                              6
                                          ? 6
                                          : categoriesCubit
                                              .subCategories(e.id ?? 0)
                                              .length,
                                      (index) {
                                        var subCat = categoriesCubit
                                            .subCategories(e.id ?? 0)[index];
                                        return HomeCategoryItem(
                                          title: subCat.name,
                                          imagePath: subCat.image,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const BoxHelper(height: 20),
                                TextButton(
                                    onPressed: () {
                                      var cat = categoriesCubit
                                          .maincategory[_controller.index];
                                      var hasSubCat =
                                          categoriesCubit.hasSubCategory(cat.id);
                                      // if (hasSubCat) {
                                      var subCat =
                                          context.read<SubCategoriesCubit>();
                                      subCat.categoryName = cat.name;
                                      subCat.parentId = cat.id;
                                      NavigationService.push(
                                        page: SubCategoriesScreen.routeName,
                                        arguments: {
                                          'category_name': cat.name,
                                          'parent_id': cat.id,
                                        },
                                      );
                                    },
                                    child: Text(
                                      'more'.translate,
                                      style: const TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  */
                  // const BoxHelper(
                  //   height: 80,
                  // ),
                  // Image.asset(
                  //   'assets/icons/trkarLogoWhite.png',
                  //   // alignment: Al,
                  // ),
                  // const BoxHelper(
                  //   height: 30,
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class HomeCarouselCard extends StatelessWidget {
  const HomeCarouselCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CarouselSlider(
        items: List.generate(
            3,
            (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Image.asset(
                    'assets/images/car-offers${index + 1}.jpg',
                    fit: BoxFit.cover,
                  ),
                )),
        options: CarouselOptions(
          height: ScreenUtil().setHeight(180),
          enableInfiniteScroll: false,
          initialPage: 1,
        ),
      ),
    );
  }
}
