import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sakura_app/provider/myProvider.dart';
import 'package:sakura_app/widgets/dashboard.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AllBarang()),
      ChangeNotifierProvider(create: (_) => HistoryFilter()),
    ],
    child: const MyApp(),
  ));
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
      home: DashboardPage(),
    );
  }
}
