import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iki_nokat_yakyn/model/services_model.dart';
import 'package:iki_nokat_yakyn/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'provider/bookmark_provider.dart';

class DetailScreen extends StatefulWidget {
  final PlaceItem item;
  final bool isBookmarked;
  final VoidCallback onBookmarkToggle;

  const DetailScreen({
    super.key,
    required this.item,
    required this.isBookmarked,
    required this.onBookmarkToggle,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  List<bool> isBookmarkedList = List.generate(5, (index) => false);
  late AnimationController _bookmarkController;

  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Telefon nomerini çagyrmak mümkin bolmady: $phoneNumber';
    }
  }

  @override
  void initState() {
    super.initState();
    _bookmarkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0.7,
      upperBound: 1.2,
    );
  }

  @override
  void dispose() {
    _bookmarkController.dispose();
    super.dispose();
  }

  void _toggleBookmark() {
    widget.onBookmarkToggle();
    _bookmarkController.forward(from: 0.7);
  }

  void toggleBookmark(int index) {
    setState(() {
      isBookmarkedList[index] = !isBookmarkedList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Consumer<BookmarkProvider>(
        builder: (context, favouriteProvider, child) {
      return Scaffold(
        backgroundColor: themeProvider.isDarkMode
            ? const Color.fromARGB(255, 0, 0, 0)
            : const Color.fromARGB(255, 248, 248, 248),
        appBar: AppBar(
          backgroundColor: themeProvider.isDarkMode
              ? const Color.fromARGB(228, 30, 30, 30)
              : const Color.fromARGB(255, 255, 255, 255),
          shadowColor: Colors.grey.shade300,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          centerTitle: true,
          title: Text(
            widget.item.name,
            style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: themeProvider.isDarkMode ? Colors.white : Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                     colors: [
                            Color.fromARGB(255, 58, 167, 255),
                            Color.fromARGB(255, 187, 212, 255),
                          ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    widget.item.name,
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.item.items
                      .length, // Use the length of the list of places
                  itemBuilder: (context, index) {
                    final item = widget.item.items[index];

                    return Card(
                      color: themeProvider.isDarkMode
                          ? const Color.fromARGB(228, 30, 30, 30)
                          : const Color.fromARGB(255, 255, 255, 255),
                      shadowColor: Colors.grey.shade300,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: const Icon(Icons.location_on,
                            color: Colors.blue, size: 22),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name, // Name of the place
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: themeProvider.isDarkMode
                                    ? const Color.fromARGB(255, 177, 175, 175)
                                    : const Color.fromARGB(255, 24, 24, 24),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              item.phone, // Phone number of the place
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                color: themeProvider.isDarkMode
                                    ? const Color.fromARGB(255, 177, 175, 175)
                                    : const Color.fromARGB(255, 24, 24, 24),
                              ),
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Phone button to make call
                            IconButton(
                              icon: const Icon(Icons.phone,
                                  color: Colors.green, size: 20),
                              onPressed: () {
                                _makePhoneCall(item.phone);
                              },
                            ),
                            // Bookmark button for toggling
                            IconButton(
                              icon: Icon(
                                favouriteProvider.isFavourite(item)
                                    ? Icons.bookmark
                                    : Icons.bookmark_border,
                                color: Colors.orange,
                                size: 28,
                              ),
                              onPressed: () {
                                // toggleBookmark(index);
                                if (favouriteProvider.isFavourite(item)) {
                                  favouriteProvider.removeFromFavourites(item);
                                  return;
                                }
                                favouriteProvider.addToFavourites(item);
                              },
                            ),
                          ],
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
