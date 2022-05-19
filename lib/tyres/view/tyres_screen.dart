import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/dropdown_widget.dart';
import 'package:trkar/core/components/multiselect_dropdown_widget.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/navigator.dart';
import '../../core/extensions/string.dart';

class TyresScreen extends StatefulWidget {
  const TyresScreen({Key? key}) : super(key: key);
  static const routeName = '/tyres-screen';

  @override
  State<TyresScreen> createState() => _TyresScreenState();
}

class _TyresScreenState extends State<TyresScreen>
    with SingleTickerProviderStateMixin {
  List<dynamic> tabs = [
    {
      'title': 'car_passengers'.translate,
      'icon': 'assets/icons/passenger.png',
    },
    {
      'title': 'suv'.translate,
      'icon': 'assets/icons/SUV.png',
    },
    {
      'title': 'light_truck'.translate,
      'icon': 'assets/icons/light-truck.png',
    },
    {
      'title': 'truck'.translate,
      'icon': 'assets/icons/truck.png',
    },
  ];
  late TabController tabController;
  int tabSelected = 0;
  var controller = ScrollController();
  bool isWinter = false;
  bool isMaxScroll = false;

  @override
  void initState() {
    controller.addListener(_onScroll);
    tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  void _onScroll() {
    log('hasClient ${controller.hasClients}');
    if (!controller.hasClients) {
      return;
    }
    if (controller.position.maxScrollExtent == controller.offset) {
      log('message bottom');
      setState(() {
        setState(() {
          isMaxScroll = true;
        });
      });
    } else if (controller.position.minScrollExtent == controller.offset) {
      log('message top');

      setState(() {
        isMaxScroll = false;
      });
    }
  }

  @override
  void dispose() {
    controller.removeListener(_onScroll);
    tabController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              NavigationService.goBack();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        title: Text(
          'tyres'.translate,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SingleChildScrollView(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      tabs.length,
                      (index) => TyresTabItem(
                        title: tabs[index]['title'],
                        imagePath: tabs[index]['icon'],
                        onTap: () {
                          setState(() {
                            tabSelected = index;
                          });
                        },
                        isSelected: tabSelected == index,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: ScreenUtil().setWidth(3),
                  right: ScreenUtil().setWidth(3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: isMaxScroll,
                        child: IconButton(
                          onPressed: () {
                            controller.animateTo(
                              controller.position.minScrollExtent,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeIn,
                            );
                          },
                          icon: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: !isMaxScroll,
                        child: IconButton(
                          onPressed: () {
                            controller.animateTo(
                              controller.position.maxScrollExtent,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeIn,
                            );
                          },
                          icon: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Visibility(
              visible: tabSelected < 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: TyresDropDownView(
                  title: 'season',
                  values: const [
                    'summer tyres',
                    'winter tyres',
                  ],
                  selectedValue: 0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                textDirection: TextDirection.ltr,
                children: [
                  Expanded(
                    child: TyresDropDownView(
                      title: 'width',
                      values: const [
                        '31',
                        '34',
                        '12',
                      ],
                    ),
                  ),
                  const BoxHelper(
                    width: 5,
                  ),
                  Expanded(
                    child: TyresDropDownView(
                      title: 'height',
                      values: const [
                        '31',
                        '34',
                        '12',
                      ],
                    ),
                  ),
                  const BoxHelper(
                    width: 5,
                  ),
                  Expanded(
                    child: TyresDropDownView(
                      title: 'diameter',
                      values: const [
                        '31',
                        '34',
                        '12',
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Image.asset(
                'assets/icons/select_tire.png',
                width: double.infinity,
              ),
            ),
            Visibility(
              visible: tabSelected == 3,
              child: CheckboxListTile(
                value: isWinter,
                onChanged: (v) {
                  setState(() {
                    isWinter = v!;
                  });
                },
                title: Text('winter_tyres'.translate),
              ),
            ),
            const BoxHelper(
              height: 20,
            ),
            Visibility(
              visible: tabSelected <= 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: Column(
                  children: [
                    TyresMultiselectDropDownView(
                      title: 'manufacturer',
                      values: const [
                        'test1',
                        'test2',
                        'test3',
                      ],
                    ),
                    const BoxHelper(
                      height: 5,
                    ),
                    Visibility(
                      visible: tabSelected <= 1,
                      child: TyresMultiselectDropDownView(
                        title: 'speed_rating',
                        values: const [
                          '31',
                          '34',
                          '12',
                        ],
                      ),
                    ),
                    Visibility(
                      visible: tabSelected == 2,
                      child: TyresMultiselectDropDownView(
                        title: 'load_index',
                        values: const [
                          '31',
                          '34',
                          '12',
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: tabSelected == 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    TyresMultiselectDropDownView(
                      title: 'speed_rating',
                      values: const [
                        '31',
                        '34',
                        '12',
                      ],
                    ),
                    const BoxHelper(
                      height: 5,
                    ),
                    TyresMultiselectDropDownView(
                      title: 'axle',
                      values: const [
                        '31',
                        '34',
                        '12',
                      ],
                    ),
                    const BoxHelper(
                      height: 5,
                    ),
                    TyresMultiselectDropDownView(
                      title: 'manufacturer',
                      values: const [
                        'test1',
                        'test2',
                        'test3',
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const BoxHelper(
              height: 15,
            ),
            RegisterButton(
              radius: 10,
              title: 'search',
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ),
            ),
            const BoxHelper(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'tyres_brands'.translate,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(15),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      direction: Axis.horizontal,
                      runSpacing: ScreenUtil().setHeight(20),
                      spacing: ScreenUtil().setWidth(15),
                      children: List.generate(
                        4,
                        (index) {
                          return Image.asset(
                            'assets/images/brand${index + 1}.png',
                            fit: BoxFit.cover,
                            height: ScreenUtil().setHeight(60),
                            width: ScreenUtil().setHeight(60),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TyresDropDownView extends StatelessWidget {
  const TyresDropDownView({
    Key? key,
    required this.title,
    required this.values,
    this.selectedValue,
  }) : super(key: key);
  final String title;
  final List<String> values;
  final int? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            title.translate,
            style: TextStyle(
              color: Colors.black,
              // fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(14),
            ),
          ),
        ),
        DropDownWidget(
          removePadding: true,
          selectedValueIndex: selectedValue,
          thinBorder: true,
          values: values,
          labelText: title,
          onChanged: (v) {},
        ),
      ],
    );
  }
}

class TyresMultiselectDropDownView extends StatelessWidget {
  const TyresMultiselectDropDownView({
    Key? key,
    required this.title,
    required this.values,
    this.selectedValue,
  }) : super(key: key);
  final String title;
  final List<String> values;
  final int? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            title.translate,
            style: TextStyle(
              color: Colors.black,
              // fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(14),
            ),
          ),
        ),
        MultiselectDropdownWidget(
          removePadding: true,
          selectedValueIndex: selectedValue,
          thinBorder: true,
          values: values,
          labelText: title.translate,
          onChanged: (v) {},
        ),
      ],
    );
  }
}

class TyresTabItem extends StatelessWidget {
  const TyresTabItem({
    Key? key,
    required this.title,
    required this.imagePath,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);
  final String title;
  final String imagePath;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        decoration: BoxDecoration(
          color: !isSelected
              ? null
              : Theme.of(context).primaryColor.withOpacity(0.2),
          border: Border.all(
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              height: ScreenUtil().setHeight(60),
              width: ScreenUtil().setHeight(60),
            ),
            const BoxHelper(
              width: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
