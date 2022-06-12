import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/home_product_item.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/components/vendor_drawer.dart';
import '../../../core/extensions/string.dart';
import 'package:auto_route/auto_route.dart';

class VendorHomeScreen extends StatefulWidget {
  const VendorHomeScreen({Key? key}) : super(key: key);

  @override
  State<VendorHomeScreen> createState() => _VendorHomeScreenState();
}

class _VendorHomeScreenState extends State<VendorHomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      drawer: VendorDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          color: Colors.white,
          icon: const Icon(
            Icons.menu,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            VendorHomeHeaderItem(),
            LatestAddedProductView(),
            TopSellersProducts(),
            MostViewedProducts(),
          ],
        ),
      ),
    );
  }
}

class VendorHomeHeaderItem extends StatelessWidget {
  const VendorHomeHeaderItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(35)),
      margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(60)),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: ScreenUtil().setHeight(120),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 2,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/profile_cover.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: -ScreenUtil().setHeight(70),
            child: Column(
              children: [
                Container(
                  height: ScreenUtil().setHeight(80),
                  width: ScreenUtil().setWidth(80),
                  decoration: BoxDecoration(
                    // TODO :remove comment
                    // border: Border.all(width: 2,color: Theme.of(context).primaryColor),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: const AssetImage('assets/images/profile2.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Vendor Name',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            // child: CircleAvatar(
            //    backgroundImage: AssetImage(
            //     'assets/icons/woman3.png',
            //   ),
            // ),
          )
        ],
      ),
    );
  }
}

class LatestAddedProductView extends StatelessWidget {
  const LatestAddedProductView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            'recently_added'.translate.toTitleCase,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const BoxHelper(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              2,
              (index) => const ProductItem(
                canAddToCart: false,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TopSellersProducts extends StatelessWidget {
  const TopSellersProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            'top_sellers'.translate.toTitleCase,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const BoxHelper(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              3,
              (index) => const ProductItem(
                canAddToCart: false,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MostViewedProducts extends StatelessWidget {
  const MostViewedProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            'most_viewed'.translate.toTitleCase,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const BoxHelper(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              1,
              (index) => const ProductItem(
                canAddToCart: false,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
