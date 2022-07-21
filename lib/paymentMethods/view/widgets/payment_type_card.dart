import 'package:flutter/material.dart';

class PaymentTypeCard extends StatelessWidget {
  const PaymentTypeCard({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final String imagePath;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        elevation: 5,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            leading: Transform.scale(
              scale: 0.7,
              child: Image.asset(
                imagePath,
              ),
            ),
            title: Text(
              title,
            ),
          ),
        ),
      ),
    );
  }
}
