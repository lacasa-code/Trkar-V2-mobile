import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class ManufacturerDetailsItem extends StatelessWidget {
  const ManufacturerDetailsItem({
    Key? key,
    required this.title,
    this.details,
    this.isLink = false,
  }) : super(key: key);
  final String title;
  final String? details;
  final bool isLink;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: details != null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: title,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: details ?? '',
                recognizer: isLink
                    ? (TapGestureRecognizer()
                      ..onTap = () {
                        launchUrl(Uri.parse(details ?? ''));
                      })
                    : null,
                style: TextStyle(
                  color: isLink ? Colors.blue : Colors.black,
                  decoration:
                      isLink ? TextDecoration.underline : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}