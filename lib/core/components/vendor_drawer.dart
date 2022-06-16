import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trkar/core/helper/helper.dart';
import 'package:trkar/core/router/router.gr.dart';
import './vendor_drawer_item.dart';

class VendorDrawer extends StatelessWidget {
  const VendorDrawer({
    Key? key,
    required this.context,
  }) : super(key: key);
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  height: ScreenUtil().setHeight(60),
                  width: ScreenUtil().setWidth(60),
                  decoration: BoxDecoration(
                    // TODO :remove comment
                    border: Border.all(
                        width: 2, color: Theme.of(context).primaryColor),
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/profile2.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Vendor Name',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ],
            ),
            VendorDrawerItem(
              title: 'edit_profile',
              onPressed: () {},
              icons: Icons.person_outline,
            ),
            VendorDrawerItem(
              title: 'my_products',
              onPressed: () {
                context.navigateTo(
                  const MyProductsRouter(),
                );
              },
              icons: Icons.inventory_2_outlined,
            ),
            VendorDrawerItem(
              title: 'add_new_product',
              onPressed: () {},
              icons: Icons.add,
            ),
            VendorDrawerItem(
              title: 'logout',
              onPressed: () async {
                context.router.pop();
                await Helper.clearVendorData();
                this.context.router.pushAndPopUntil(
                      const TabRoute(),
                      predicate: (r) => false,
                    );
              },
              icons: Icons.exit_to_app,
            ),
          ],
        ),
      ),
    );
  }
}
