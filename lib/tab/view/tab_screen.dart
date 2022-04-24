import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({
    Key? key,
  }) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Widget> pages = [];
  @override
  void initState() {
    pages = [
      Container(),
      Container(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[0],
      bottomNavigationBar: BottomNavigationBar(
        items: [],
      ),
    );
  }
}
