import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/categories/viewModel/subCategories/sub_categories_cubit.dart';
import 'package:trkar/core/components/search_app_bar.dart';
import 'package:trkar/home/view/widgets/my_drawer.dart';
import 'package:trkar/tools/view/widgets/best_price_view.dart';
import 'package:trkar/tools/view/widgets/popular_tools_view.dart';
import 'package:trkar/tools/view/widgets/tools_online_stores_view.dart';
import 'package:trkar/tools/view/widgets/tools_top_brands_view.dart';

class ToolsScreen extends StatefulWidget implements AutoRouteWrapper {
  const ToolsScreen({
    Key? key,
    this.categoryId,
  }) : super(key: key);
  final String? categoryId;
  static const routeName = '/tools-screen';

  @override
  State<ToolsScreen> createState() => _ToolsScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    // TODO: implement wrappedRoute
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SubCategoriesCubit(
            parentId: categoryId,
          ),
        ),
      ],
      child: this,
    );
  }
}

class _ToolsScreenState extends State<ToolsScreen> {
  @override
  void initState() {
    context.read<SubCategoriesCubit>().getSubCategories(context);
    super.initState();
  }

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
