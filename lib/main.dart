import 'package:flutter/material.dart';
import 'package:flutter_chatgpt_chatapp/providers/my_theme_provider.dart';
import 'package:flutter_chatgpt_chatapp/theme/my_themes.dart';
import 'package:provider/provider.dart';
import 'main_screen/home_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => MyThemeProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getCurrentTheme();
    super.initState();
  }

  void getCurrentTheme() async {
    await Provider.of<MyThemeProvider>(context, listen: false).getThemeStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: MyTheme.themeData(
          isDarkTheme: value.themeType,
          context: context,
        ),
        home: const HomeScreen(),
      );
    });
  }
}
