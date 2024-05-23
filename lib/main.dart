import 'package:flutter/material.dart';
import 'package:fintech_/views/intro.dart';
import 'package:provider/provider.dart';
import 'package:fintech_/state/orders_notifier.dart';
import 'package:fintech_/state/user_settings_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserSettingsProvider>(
          create: (_) => UserSettingsProvider()
        ),
        ChangeNotifierProvider<OrderProvider>(
          create: (_) => OrderProvider()
        )
      ],
      child: const MaterialApp(
        home: IntroPage()
      ),
    ); 
  }
}
