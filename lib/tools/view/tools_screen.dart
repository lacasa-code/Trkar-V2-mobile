import 'package:flutter/material.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/components/sub_cat_card.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/home/view/widgets/home_product_item.dart';
import 'package:trkar/home/view/widgets/my_drawer.dart';
import '.././../core/extensions/string.dart';

class ToolsScreen extends StatefulWidget {
  const ToolsScreen({Key? key}) : super(key: key);
  static const routeName = '/tools-screen';

  @override
  State<ToolsScreen> createState() => _ToolsScreenState();
}

class _ToolsScreenState extends State<ToolsScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: SearchAppBar(scaffoldKey: scaffoldKey),
      drawer: const MyDrawer(),

      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.arrow_back,
      //     ),
      //     color: Colors.black,
      //     onPressed: () {
      //       NavigationService.goBack();
      //     },
      //   ),
      //   title: Text(
      //     'tools'.translate,
      //     style: const TextStyle(
      //       color: Colors.black,
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ToolsOnlineStoresView(),
            const PopularToolsView(),
            const BestPriceView(),
            const ToolsTopBrandsView(),
          ],
        ),
      ),
    );
  }
}

class ToolsOnlineStoresView extends StatelessWidget {
  const ToolsOnlineStoresView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'online_tools_store'.translate,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const BoxHelper(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'online_tools_store_desc'.translate,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          children: List.generate(
            9,
            (index) => const SubCategoryItem(),
          ),
        ),
      ],
    );
  }
}

class PopularToolsView extends StatelessWidget {
  const PopularToolsView({
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
              'popular_tools'.translate,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                8,
                (index) => const HomeProductItem(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BestPriceView extends StatelessWidget {
  const BestPriceView({
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
              'tools_best_price'.translate,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'tools_best_price_desc'.translate,
            ),
          ),
          const BoxHelper(
            height: 10,
          ),
          Align(
            alignment: Alignment.center,
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: List.generate(
                8,
                (index) => const HomeProductItem(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ToolsTopBrandsView extends StatelessWidget {
  const ToolsTopBrandsView({
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
              'tools_top_brands'.translate,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const BoxHelper(
            height: 10,
          ),
          Align(
            alignment: Alignment.center,
            child: Wrap(
              children: List.generate(
                4,
                (index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Image.asset(
                    'assets/images/toolsBrand${index + 1}.png',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
