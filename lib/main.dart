import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:iki_nokat_yakyn/app_setting.dart';
import 'package:iki_nokat_yakyn/hive_helper/register_adapters.dart';
import 'package:iki_nokat_yakyn/menu.dart';
import 'package:iki_nokat_yakyn/provider/bookmark_provider.dart';
import 'package:iki_nokat_yakyn/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';


Future<void> main() async {
  await Hive.initFlutter();
  registerAdapters();
  await Hive.openBox('moviesBox');
  await Hive.openBox('settings');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppSettings()),
        ChangeNotifierProvider(create: (context) => BookmarkProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Iki nokat yakyn.com',
      theme: ThemeData.light(),
      home: const Menu(),
    );
  }
}
