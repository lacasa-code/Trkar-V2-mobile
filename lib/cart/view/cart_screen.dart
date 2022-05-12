import 'package:flutter/material.dart';
import 'package:trkar/cart/view/cart_item.dart';
import '../../core/extensions/string.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trkar/tab/viewModel/cubit/tab_cubit.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = '/cart-screen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late TabCubit tabCubit;

  @override
  void initState() {
    tabCubit = context.read<TabCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => tabCubit.onBackButtonPressed(context),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            color: Colors.black,
            onPressed: () {
              tabCubit.onBackButtonPressed(context);
            },
          ),
          title: Text(
            'cart'.translate,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(
              1,
              (index) => CartItem(
                imagePath: 'assets/images/oil${index + 1}.jpg',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
