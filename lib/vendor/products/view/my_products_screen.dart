import 'package:flutter/material.dart';
import 'package:trkar/core/components/vendor_app_bar.dart';
import 'package:trkar/vendor/products/view/widgets/my_product_widget.dart';

class MyProductScreen extends StatefulWidget {
  const MyProductScreen({Key? key}) : super(key: key);

  @override
  State<MyProductScreen> createState() => _MyProductScreenState();
}

class _MyProductScreenState extends State<MyProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VendorAppBar(
        context: context,
        title: 'my_products',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            5,
            (index) => const MyProductWidget(),
          ),
        ),
      ),
    );
  }
}
