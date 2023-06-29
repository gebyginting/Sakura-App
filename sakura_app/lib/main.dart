import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:sakura_app/provider/myProvider.dart';
import 'package:sakura_app/routes/routes.dart';
import 'package:sakura_app/auth/login.dart';
import 'package:sakura_app/widgets/dashboard.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AllBarang()),
      ChangeNotifierProvider(create: (_) => HistoryFilter()),
    ],
    child: const MyApp(),
  ));
  GetMaterialApp(
    initialRoute: AppPage.getNavbar(),
    getPages: AppPage.routes,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}
