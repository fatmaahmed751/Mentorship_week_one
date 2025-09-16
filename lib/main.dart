import 'package:flutter/material.dart';
import 'package:mentorship_week_one/Modules/Ahwa_Module/Screens/Ahwa_screen.dart';

import 'Modules/Ahwa_Module/Repository/order_manager.dart';
import 'Modules/Ahwa_Module/Repository/order_repository_implementation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = OrderRepositoryImplementation();
    final manager = OrderManager(repository);
    return MaterialApp(
     home: AhwaDashboard(manager: manager),
    );
  }
}




