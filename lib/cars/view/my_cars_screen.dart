import 'package:flutter/material.dart';
import 'package:trkar/cars/view/views/my_cars_view.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/searchable_dropdown_widget.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import 'package:trkar/filterCars/viewModel/carMades/filter_cars_cubit.dart';
import '../../core/extensions/string.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCarsScreen extends StatefulWidget {
  const MyCarsScreen({Key? key}) : super(key: key);
  static const routeName = '/cars-screen';

  @override
  _MyCarsScreenState createState() => _MyCarsScreenState();
}

class _MyCarsScreenState extends State<MyCarsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  List<Widget> tabs = [
    Text(
      'my_cars'.translate,
    ),
    Text(
      'select_new_car'.translate,
    ),
  ];
  late FilterCarsCubit filterCarsCubit;
  @override
  void initState() {
    filterCarsCubit = context.read<FilterCarsCubit>()..getCarModels(context);
    _controller = TabController(
      length: tabs.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            NavigationService.goBack();
          },
          color: Colors.black,
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        elevation: 0,
        title: Text(
          'select_car'.translate,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        bottom: TabBar(
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.white,
          indicator: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          unselectedLabelColor: Colors.black54,
          controller: _controller,
          tabs: tabs,
        ),
      ),
      body: TabBarView(
        children: [
          MyCarsView(),
          SingleChildScrollView(
            child: Column(
              children: [
                SearchableDropDownWidget(
                  thinBorder: true,
                  values: List.generate(5, (index) => 'brand ${index + 1}'),
                  labelText: 'brand',
                  onChanged: (v) {},
                ),
                SearchableDropDownWidget(
                  thinBorder: true,
                  values: List.generate(5, (index) => 'model ${index + 1}'),
                  labelText: 'model',
                  onChanged: (v) {},
                ),
                SearchableDropDownWidget(
                  thinBorder: true,
                  values: List.generate(10, (index) => '200$index'),
                  labelText: 'manufacturing_year',
                  onChanged: (v) {},
                ),
                SearchableDropDownWidget(
                  thinBorder: true,
                  values: List.generate(10, (index) => '200$index'),
                  labelText: 'manufacturing_year',
                  onChanged: (v) {},
                ),
                SearchableDropDownWidget(
                  thinBorder: true,
                  values: const [
                    'manual',
                    'automatic',
                  ],
                  labelText: 'transmission',
                  onChanged: (v) {},
                ),
                const BoxHelper(
                  height: 20,
                ),
                RegisterButton(
                  title: 'save',
                  radius: 13,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
        controller: _controller,
      ),
    );
  }
}
