import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iki_nokat_yakyn/detail_screen.dart';
import 'package:iki_nokat_yakyn/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'model/services_model.dart';

class CategoryScreen extends StatefulWidget {
  final Place place;

  const CategoryScreen({super.key, required this.place});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode
          ? const Color.fromARGB(229, 0, 0, 0)
          : const Color.fromARGB(255, 248, 248, 248),
      appBar: _buildAppBar(themeProvider = Provider.of<ThemeProvider>(context)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hyzmatlar",
              style: GoogleFonts.poppins(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color:
                      themeProvider.isDarkMode ? Colors.white : Colors.black),
            ),
            const SizedBox(height: 20),
            Expanded(child: _buildGrid()),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(dynamic themeProvider) {
    return AppBar(
      backgroundColor: themeProvider.isDarkMode
          ? const Color.fromARGB(228, 30, 30, 30)
          : const Color.fromARGB(255, 255, 255, 255),
      shadowColor: Colors.grey.shade200,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      centerTitle: true,
      title: Text(
        widget.place.name,
        style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: themeProvider.isDarkMode ? Colors.white : Colors.black),
      ),
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.9,
      ),
      itemCount: widget.place.items.length,
      itemBuilder: (context, index) {
        final item = widget.place.items[index];
        return OpenContainer(
          closedColor: Colors.transparent,
          closedElevation: 0,
          transitionDuration: const Duration(milliseconds: 400),
          transitionType: ContainerTransitionType.fadeThrough,
          openBuilder: (context, _) => DetailScreen(
            item: item, 
            isBookmarked: false, 
            onBookmarkToggle: () {

            },
          ),
          closedBuilder: (context, openContainer) => GestureDetector(
            onTap: openContainer,
            child: _buildGridItem(item),
          ),
        );
      },
    );
  }

  // Method to build each grid item
  Widget _buildGridItem(PlaceItem item) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: themeProvider.isDarkMode
            ? const Color.fromARGB(228, 30, 30, 30)
            : const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon container with a background color
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.build, // Icon from the item map
              size: 50,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 12),
          // Name of the place
          Text(
            item.name,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: themeProvider.isDarkMode
                  ? const Color.fromARGB(255, 177, 175, 175)
                  : const Color.fromARGB(255, 24, 24, 24),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.category,
            style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color:  themeProvider.isDarkMode
                  ? const Color.fromARGB(255, 177, 175, 175)
                  : const Color.fromARGB(255, 24, 24, 24),),
          ),
        ],
      ),
    );
  }
}
