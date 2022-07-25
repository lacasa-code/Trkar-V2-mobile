import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AddProductFAB extends StatelessWidget {
  const AddProductFAB({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 6,
          shape: const CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              hoverColor: Colors.transparent,
              hoverElevation: 0,
              splashColor: Colors.transparent,
              elevation: 0,
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(
                Icons.add,
                size: ScreenUtil().radius(35),
                // color: Theme.of(context).primaryColor,
              ),
              onPressed: null,
            ),
          ),
        ),
      ),
    );
  }
}