import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffF3F4F5),
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(5),
      child: Container(
        // height: 80,
        decoration: BoxDecoration(
          // border: Border.all(
          //   color: const Color(0xffF3F4F5),
          //   width: 2,
          // ),
          color: Color(0xffFBD494).withOpacity(0.7),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
