import 'package:flutter/material.dart';
import 'package:iki_nokat_yakyn/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
     final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ana Sahypa"),
        backgroundColor:themeProvider.isDarkMode ? const Color.fromARGB(229, 0, 0, 0) : const Color.fromARGB(255, 248, 248, 248),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
      body: const Center(
        child: Text(
          "Programma Başlady!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
