import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/themes/screen_utility.dart';
import 'package:trkar/order/view/widgets/order_history_card.dart';

import '../../core/extensions/string.dart';

class OrdersHistoryScreen extends StatefulWidget {
  const OrdersHistoryScreen({Key? key}) : super(key: key);

  @override
  State<OrdersHistoryScreen> createState() => _OrdersHistoryScreenState();
}

class _OrdersHistoryScreenState extends State<OrdersHistoryScreen>
    with TickerProviderStateMixin {
  late TabController controller;

  List<String> tabTitles = [
    'Car Parts',
    'Truck Parts',
    'Tyres',
    'Car Accessories',
    'Engine Oil',
    'Filters',
  ];
  bool showCancelled = false;
  @override
  void initState() {
    controller = TabController(
      length: 6,
      vsync: this,
    )..addListener(_onIndexChanged);
    super.initState();
  }

  _onIndexChanged() {
    if (controller.indexIsChanging) {
      Future.delayed(const Duration(milliseconds: 1), () {
        setState(() {
          showCancelled = false;
        });
      });
      Future.delayed(const Duration(milliseconds: 20), () {
        setState(() {
          showCancelled = false;
        });
        setState(() {});
      });
      setState(() {});
    }
  }

  @override
  void dispose() {
    controller
      ..removeListener(_onIndexChanged)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          iconSize: ScreenUtil().radius(15),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          color: Colors.black,
        ),
        title: Text(
          'orders_history'.translate,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(
            ScreenUtil().setHeight(100),
          ),
          child: Column(
            children: [
              TabBar(
                onTap: (i) {
                  setState(() {
                    showCancelled = false;
                  });
                },
                isScrollable: true,
                indicatorColor: Colors.transparent,
                controller: controller,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.black,
                labelColor: Colors.white,
                labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                indicator: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(14),
                ),
                tabs: List.generate(
                  tabTitles.length,
                  (index) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      border: controller.index == index ? null : Border.all(),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      tabTitles[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              // const BoxHelper(
              //   height: 15,
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'show_cancelled_orders'.translate,
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                            fontSize: ScreenUtil().setSp(13),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                        value: showCancelled,
                        onChanged: (v) {
                          setState(() {
                            showCancelled = v;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        key: ValueKey(controller.index),
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          tabTitles.length,
          (index) => showCancelled
              ? CancelledOrdersView(
                  isCancelled: showCancelled,
                  key: ValueKey('true$index'),
                )
              : OrdersView(
                  isCancelled: showCancelled,
                  key: ValueKey('false$index'),
                ),
        ),
      ),
    );
  }
}

class OrdersView extends StatelessWidget {
  const OrdersView({
    Key? key,
    required this.isCancelled,
  }) : super(key: key);
  final bool isCancelled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: List.generate(
              5,
              (index) => OrderHistoryCard(
                isCancelled: isCancelled,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CancelledOrdersView extends StatelessWidget {
  const CancelledOrdersView({
    Key? key,
    required this.isCancelled,
  }) : super(key: key);
  final bool isCancelled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          OrderHistoryCard(
            isCancelled: isCancelled,
          ),
        ],
      ),
    );
  }
}
