import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iki_nokat_yakyn/bookmark_screen.dart';
import 'package:iki_nokat_yakyn/home_page.dart';
import 'package:iki_nokat_yakyn/model/services_model.dart';
import 'package:iki_nokat_yakyn/provider/bookmark_provider.dart';
import 'package:iki_nokat_yakyn/region_details_screen.dart';
import 'package:iki_nokat_yakyn/setting_screen.dart';
import 'package:provider/provider.dart';
import 'provider/theme_provider.dart';
import 'data/movies_data.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    BookmarkScreen(),
    SettingScreen(),
  ];

  @override
  void initState() {
    Provider.of<BookmarkProvider>(context, listen: false).getHive();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) _searchController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<ServicesModel> cities = DataService.getCities();
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode
          ? const Color.fromARGB(229, 0, 0, 0)
          : const Color.fromARGB(255, 248, 248, 248),
      appBar: _selectedIndex == 0
          ? PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(31, 150, 150, 150),
                        offset: Offset(
                          0.0,
                          0.5,
                        ),
                        blurRadius: 10.0),
                  ],
                ),
                child: AppBar(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  bottomOpacity: 0.2,
                  backgroundColor: themeProvider.isDarkMode
                      ? const Color.fromARGB(228, 30, 30, 30)
                      : const Color.fromARGB(255, 255, 255, 255),
                  centerTitle: true,
                  title: Row(
                    children: [
                      _isSearching
                          ? Expanded(
                              child: TextField(
                                controller: _searchController,
                                autofocus: true,
                                decoration: const InputDecoration(
                                  hintText: 'Gozleg...',
                                  hintStyle: TextStyle(
                                      color: Color.fromARGB(179, 0, 0, 0)),
                                  border: InputBorder.none,
                                ),
                                style: GoogleFonts.poppins(color: Colors.black),
                              ),
                            )
                          : Text(
                              'Hyzmatlar',
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: themeProvider.isDarkMode
                                      ? Colors.white
                                      : Colors.black),
                            ),
                      const SizedBox(
                        width: 158,
                      ),
                      Row(
                        children: [
                          if (!_isSearching)
                            IconButton(
                              icon: Icon(Icons.search,
                                  color: themeProvider.isDarkMode
                                      ? Colors.white
                                      : Colors.black),
                              onPressed: _toggleSearch,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
      body: _selectedIndex == 0
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: 340,
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                         colors: [
                            Color.fromARGB(255, 58, 167, 255),
                            Color.fromARGB(255, 187, 212, 255),
                          ],),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // children: [Image.asset('assets/hyzmat.jpg',),
                          children: [
                            Text(
                              "Hyzmatlar",
                              style: GoogleFonts.poppins(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                  color: themeProvider.isDarkMode
                                      ? Colors.white
                                      : Colors.black),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Hyzmatlarymyz hemise sizin hyzmatynyzda",
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: themeProvider.isDarkMode
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: themeProvider.isDarkMode
                              ? const Color.fromARGB(228, 30, 30, 30)
                              : const Color.fromARGB(255, 251, 251, 251)),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cities.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegionDetailsScreen(
                                    region: cities[index],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: themeProvider.isDarkMode
                                    ? const Color.fromARGB(228, 30, 30, 30)
                                    : const Color.fromARGB(255, 255, 255, 255),
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    shape: null,
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          8), // Yarıçapı resmin yarısı kadar
                                      child: Image.asset(
                                        cities[index].assets,
                                        width: 80,
                                        height: 75,
                                        fit: BoxFit.fill,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Icon(Icons.error),
                                      ),
                                    ),
                                    title: Text(
                                      cities[index].name,
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: themeProvider.isDarkMode
                                            ? const Color.fromARGB(
                                                255, 177, 175, 175)
                                            : const Color.fromARGB(
                                                255, 24, 24, 24),
                                      ), // Poppins font
                                    ),
                                    subtitle: Text(
                                      'Hyzmatlar',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: themeProvider.isDarkMode
                                            ? const Color.fromARGB(
                                                255, 177, 175, 175)
                                            : const Color.fromARGB(
                                                255, 24, 24, 24),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Divider(
                                      color: Colors.black.withOpacity(0.1),
                                      height: 1,
                                    ),
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
            )
          : _selectedIndex == 1
              ? BookmarkScreen()
              : _selectedIndex == 2
                  ? SettingScreen()
                  : BookmarkScreen(),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
        child: Container(
          height: 70,
          color: Colors.white,
          child: BottomNavigationBar(
            backgroundColor: themeProvider.isDarkMode
                ? const Color.fromARGB(228, 30, 30, 30)
                : const Color.fromARGB(255, 255, 255, 255),
            fixedColor: Colors.black,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                  color: _selectedIndex == 0 ? Colors.black : Colors.grey,
                ),
                label: '',
                activeIcon: Column(
                  children: [
                    const Icon(
                      Icons.home,
                      size: 25,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 3),
                    CircleAvatar(
                      radius: 3,
                      backgroundColor: _selectedIndex == 0
                          ? Colors.black
                          : Colors.transparent,
                    ),
                  ],
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmark,
                  size: 30,
                  color: _selectedIndex == 1 ? Colors.black : Colors.grey,
                ),
                label: '',
                activeIcon: Column(
                  children: [
                    const Icon(
                      Icons.bookmark,
                      size: 25,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 3),
                    CircleAvatar(
                      radius: 3,
                      backgroundColor: _selectedIndex == 1
                          ? Colors.black
                          : Colors.transparent,
                    ),
                  ],
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 25,
                  color: _selectedIndex == 2 ? Colors.black : Colors.grey,
                ),
                label: '',
                activeIcon: Column(
                  children: [
                    const Icon(
                      Icons.settings,
                      size: 25,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 3),
                    CircleAvatar(
                      radius: 3,
                      backgroundColor: _selectedIndex == 2
                          ? Colors.black
                          : Colors.transparent,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
