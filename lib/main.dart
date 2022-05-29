import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trkar/app.dart';
import 'package:trkar/core/helper/app_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  await localization.init();
  runApp(Phoenix(
    child: const MyApp(),
  ));
}
