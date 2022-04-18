import '../helper/app_localization.dart';

extension StringExtension on String {
  String get translate => localization.text(this);
}
