import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:go_router/go_router.dart';
import '../router/app_routes.dart';


class CustomNavBar extends StatelessWidget {

  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  const CustomNavBar({super.key, required this.currentIndex, required this.onTabSelected});

  // helper — returns colored icon when selected, grey when not
  Widget _navIcon(IconData icon, int index) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTabSelected(index),
      behavior: HitTestBehavior.opaque, // makes the tap area larger
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          color: isSelected
              ? const Color.fromARGB(255, 21, 40, 255) // active color
              : Colors.grey,
          size: 26.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(20.0),
      child: Container(
        width: 360.0,
        height: 64.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon(Icons.home_filled, color: Colors.grey),
            _navIcon(Icons.home_filled, 0),
            // Icon(Icons.explore, color: Colors.grey),
            _navIcon(Icons.explore, 1),
            Container(
                width: 60.0,
                height: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // color: Color.fromARGB(255, 21, 40, 255),
                  gradient: LinearGradient(
                    begin: AlignmentGeometry.topLeft,
                    end: AlignmentGeometry.bottomRight,
                    colors: [
                      Color.fromARGB(255, 21, 40, 255),
                      Color.fromARGB(255, 80, 129, 255),
                    ],
                  ),
                ),
                child: Icon(Icons.add, size: 36.0, color: Colors.white,)
            ),
            _navIcon(Icons.wine_bar, 2),
            // Icon(Icons.wine_bar, color: Colors.grey),
            _navIcon(Icons.person, 3),
            // Icon(Icons.person, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class MainShell extends StatelessWidget {
  final Widget child;
  const MainShell({super.key, required this.child});

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith(AppRoutes.feed)) return 1;
    if (location.startsWith(AppRoutes.profile)) return 3;
    return 0;
  }

  void _onTabSelected(BuildContext context, int index) {
    switch (index) {
      case 0: context.go(AppRoutes.home);
      case 1: context.go(AppRoutes.feed);
      case 3: context.go(AppRoutes.profile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      extendBody: true,
      bottomNavigationBar: CustomNavBar(
        currentIndex: _currentIndex(context),
        onTabSelected: (index) => _onTabSelected(context, index),
      ),
    );
  }
}