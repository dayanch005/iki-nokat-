import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iki_nokat_yakyn/category_screen.dart';
import 'package:iki_nokat_yakyn/model/services_model.dart';
import 'package:iki_nokat_yakyn/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class RegionDetailsScreen extends StatelessWidget {
  final ServicesModel region;

  const RegionDetailsScreen({super.key, required this.region});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode
          ? const Color.fromARGB(229, 0, 0, 0)
          : const Color.fromARGB(255, 248, 248, 248),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(66, 212, 212, 212),
                blurRadius: 3,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: themeProvider.isDarkMode
                ? const Color.fromARGB(228, 30, 30, 30)
                : const Color.fromARGB(255, 255, 255, 255),
            elevation: 0,
            centerTitle: true,
            title: Text(
              region.name,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  region.assets,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Etrap we Şäherler:',
                style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color:
                        themeProvider.isDarkMode ? Colors.white : Colors.black),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: region.places.length,
                itemBuilder: (context, index) {
                  final place = region.places[index];
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: themeProvider.isDarkMode
                          ? const Color.fromARGB(228, 30, 30, 30)
                          : const Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: themeProvider.isDarkMode
                              ? const Color.fromARGB(228, 30, 30, 30)
                              : const Color.fromARGB(255, 238, 237, 237),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.location_on_outlined,
                          size: 22,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text(
                        place.name,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color:themeProvider.isDarkMode ? Colors.white :Colors.black

                        ),
                      ),
                      subtitle: Text(
                        place.category,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: themeProvider.isDarkMode ? Colors.white :Colors.black
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CategoryScreen(place: region.places[index]),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
