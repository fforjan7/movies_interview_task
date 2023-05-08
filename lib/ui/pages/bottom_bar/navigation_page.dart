import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_interview_task/common/resources/icons.dart';
import 'package:movies_interview_task/ui/widgets/reusable_app_bar.dart';

import 'favorites_page.dart';
import 'movies_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const MoviesPage(),
    const FavoritesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppIcons.moviesSelected),
            icon: SvgPicture.asset(AppIcons.moviesNonselected),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppIcons.favoritesSelected),
            icon: SvgPicture.asset(AppIcons.favoritesNonSelected),
            label: 'Favorites',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
