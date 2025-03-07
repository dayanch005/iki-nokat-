import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iki_nokat_yakyn/provider/bookmark_provider.dart';
import 'package:iki_nokat_yakyn/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Consumer<BookmarkProvider>(
        builder: (context, favouriteProvider, child) {
      return Scaffold(
        backgroundColor: themeProvider.isDarkMode
            ? const Color.fromARGB(229, 0, 0, 0)
            : const Color.fromARGB(255, 248, 248, 248),
        appBar: AppBar(
          title: Text(
            'Bellikler',
            style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: themeProvider.isDarkMode ? Colors.white : Colors.black),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          backgroundColor: themeProvider.isDarkMode
              ? const Color.fromARGB(228, 30, 30, 30)
              : const Color.fromARGB(255, 255, 255, 255),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Expanded(
                child: favouriteProvider.favouriteMovies.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.orange.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.bookmark_add_outlined,
                                color: Colors.orange,
                                size: 60,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Bellikler yok',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: favouriteProvider.favouriteMovies.length,
                        itemBuilder: (context, index) {
                          final movie =
                              favouriteProvider.favouriteMovies[index];
                          return Card(
                            color: themeProvider.isDarkMode
                                ? const Color.fromARGB(228, 30, 30, 30)
                                : const Color.fromARGB(255, 255, 255, 255),
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              leading:
                                  Icon(Icons.bookmark, color: Colors.orange),
                              title: Text(
                                movie.name,
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: themeProvider.isDarkMode
                                      ? const Color.fromARGB(255, 177, 175, 175)
                                      : const Color.fromARGB(255, 24, 24, 24),
                                ),
                              ),
                              subtitle: Text(
                                'bellikler ulanylyp dur...',
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: themeProvider.isDarkMode
                                      ? const Color.fromARGB(255, 177, 175, 175)
                                      : const Color.fromARGB(255, 24, 24, 24),
                                ),
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.remove_circle_outline,
                                  color: themeProvider.isDarkMode
                                      ? const Color.fromARGB(255, 177, 175, 175)
                                      : const Color.fromARGB(255, 24, 24, 24),
                                ),
                                onPressed: () {
                                  favouriteProvider.removeFromFavourites(movie);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('bellikde duran yerler')),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
