import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/navigation/app_routes.dart';
import 'package:flutter_application_1/core/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/screens/counter/bloc/counter_bloc.dart';
import 'package:flutter_application_1/screens/counter/counter_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class AppMaterial extends StatelessWidget {
  const AppMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "first App",
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.HOME,
      getPages: AppRoutes.routes,
      theme: AppTheme.lightTheme,      // 👈 2. Use your custom theme here
      darkTheme: AppTheme.lightTheme,     );
  }
}
