import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/home/view/widgets/home_product_item.dart';
import 'package:trkar/home/view/widgets/sub_cat_card.dart';
import '../../core/extensions/string.dart';

class CarAccessoriesScreen extends StatefulWidget {
  const CarAccessoriesScreen({Key? key}) : super(key: key);
  static const routeName = '/car-accessories';

  @override
  State<CarAccessoriesScreen> createState() => _CarAccessoriesScreenState();
}

class _CarAccessoriesScreenState extends State<CarAccessoriesScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  List<String> tabTitle = [
    'top_rated'.translate,
    'useful_car_accessories'.translate,
    'car_electronics'.translate,
  ];
  late SubCategoriesCubit subCategoriesCubit;
  @override
  void initState() {
    subCategoriesCubit = context.read<SubCategoriesCubit>()
      ..getSubCategories(context);
    controller = TabController(
      length: tabTitle.length,
      vsync: this,
    );
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
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'car_accessories'.translate,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CarAccessoriesHeaderView(),
            CarAccessoriesStoreView(controller: controller, tabTitle: tabTitle),
            const CarAccessoriesSubCategoriesView(),
            const TopAccessoriesView(),
            const AccessoriesBrandView(),
          ],
        ),
      ),
    );
  }
}

class TopAccessoriesView extends StatelessWidget {
  const TopAccessoriesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BoxHelper(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'top_accessories'.translate,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                6,
                (index) => const HomeProductItem(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AccessoriesBrandView extends StatelessWidget {
  const AccessoriesBrandView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BoxHelper(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'popular_accessories_brand'.translate,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                6,
                (index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Image.asset(
                      'assets/images/accessories-brand${index + 1}.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CarAccessoriesSubCategoriesView extends StatelessWidget {
  const CarAccessoriesSubCategoriesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'car_accessories_categories'.translate,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Wrap(
          children: List.generate(
            10,
            (index) => const SubCatCard(),
          ),
        ),
      ],
    );
  }
}


class CarAccessoriesStoreView extends StatelessWidget {
  const CarAccessoriesStoreView({
    Key? key,
    required this.controller,
    required this.tabTitle,
  }) : super(key: key);

  final TabController controller;
  final List<String> tabTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey.shade300,
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          height: ScreenUtil().setHeight(50),
          width: ScreenUtil().setWidth(400),
          child: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).primaryColor,
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            // unlabelStyle: TextStyle(color: Colors.white,),
            controller: controller,
            tabs: tabTitle
                .map(
                  (e) => Text(
                    e,
                    textAlign: TextAlign.center,
                  ),
                )
                .toList(),
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(270),
          width: double.infinity,
          child: TabBarView(
            children: List.generate(
              tabTitle.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(
                    4,
                    (index) => StoreCard(),
                  ),
                ),
              ),
            ),
            controller: controller,
          ),
        ),
      ],
    );
  }
}

class StoreCard extends StatelessWidget {
  const StoreCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(120),
      width: ScreenUtil().setWidth(120),
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Text(
              'store name',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image.asset(
            'assets/images/oil1.jpg',
            height: ScreenUtil().setHeight(85),
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

class CarAccessoriesHeaderView extends StatelessWidget {
  const CarAccessoriesHeaderView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Text(
            'car_accessories_header'.translate,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(15),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Text(
            'car_accessories_body'.translate,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(15),
            ),
          ),
        ),
      ],
    );
  }
}
