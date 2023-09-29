import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/routes/pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Triwarna',
      theme: ThemeData(
        scaffoldBackgroundColor: baseBgScaffold,
        colorScheme: ColorScheme.fromSeed(
          seedColor: purpleColor,
          primary: purpleColor,
          secondary: yellowColor,
        ),
        useMaterial3: true,
        fontFamily: 'Maison Neue',
      ),
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.full,
      defaultTransition: Transition.cupertino,
      initialRoute: '/',
      getPages: AppPages.pages,
    );
  }
}
