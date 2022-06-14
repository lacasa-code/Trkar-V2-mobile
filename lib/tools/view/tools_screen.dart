import 'package:flutter/material.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/components/sub_cat_item.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/core/components/home_product_item.dart';
import 'package:trkar/home/view/widgets/my_drawer.dart';
import 'package:trkar/tools/view/widgets/best_price_view.dart';
import 'package:trkar/tools/view/widgets/popular_tools_view.dart';
import 'package:trkar/tools/view/widgets/tools_online_stores_view.dart';
import 'package:trkar/tools/view/widgets/tools_top_brands_view.dart';
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
          children: const [
            ToolsOnlineStoresView(),
            PopularToolsView(),
            BestPriceView(),
            ToolsTopBrandsView(),
          ],
        ),
      ),
    );
  }
}

