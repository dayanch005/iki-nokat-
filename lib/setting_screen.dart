import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iki_nokat_yakyn/app_setting.dart';
import 'package:provider/provider.dart';
import 'provider/theme_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final appSettings = Provider.of<AppSettings>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode
          ? const Color.fromARGB(229, 0, 0, 0)
          : const Color.fromARGB(255, 248, 248, 248),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          child: AppBar(
            backgroundColor: themeProvider.isDarkMode
                ? const Color.fromARGB(228, 30, 30, 30)
                : const Color.fromARGB(255, 255, 255, 255),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            title: Text(
              'Sazlamalar',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color:
                      themeProvider.isDarkMode ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tema üýtgetmek
            ListTile(
              title: Text(
                'Tema çalysmak',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: themeProvider.isDarkMode
                      ? const Color.fromARGB(255, 177, 175, 175)
                      : const Color.fromARGB(255, 24, 24, 24),
                ),
              ),
              subtitle: Text(appSettings.isDarkMode
                  ? 'Gara reňk temasy'
                  : 'Açyk reňk temasy',style:GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: themeProvider.isDarkMode
                      ? const Color.fromARGB(255, 177, 175, 175)
                      : const Color.fromARGB(255, 24, 24, 24),),),
              trailing: Switch(
                value: themeProvider.isDarkMode,
                onChanged: (value) {
                  // appSettings.toggleTheme();
                  themeProvider.toggleTheme(value);
                },
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: Text(
                'Dil',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: themeProvider.isDarkMode
                      ? const Color.fromARGB(255, 177, 175, 175)
                      : const Color.fromARGB(255, 24, 24, 24),
                ),
              ),
              subtitle: Text(appSettings.locale.languageCode == 'tm'
                  ? 'Rus dili'
                  : 'Türkmen dili',style:GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: themeProvider.isDarkMode
                      ? const Color.fromARGB(255, 177, 175, 175)
                      : const Color.fromARGB(255, 24, 24, 24),),),
              trailing: Icon(
                Icons.language,
                color: themeProvider.isDarkMode
                    ? const Color.fromARGB(255, 177, 175, 175)
                    : const Color.fromARGB(255, 24, 24, 24),
              ),
              onTap: () {
                appSettings.changeLanguage(
                    appSettings.locale.languageCode == 'en'
                        ? Locale('tr')
                        : Locale('ru'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
