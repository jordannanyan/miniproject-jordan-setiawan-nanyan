import 'package:flutter/material.dart';
import 'package:restoran_serba_ada/theme/theme_color.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      iconSize: 30,
      onTap: (int value) {
        switch (value) {
          case 0:
            Navigator.of(context).pushNamed('/home');
            break;
          case 1:
            Navigator.of(context).pushNamed('/search');
            break;
          case 2:
            Navigator.of(context).pushNamed('/wishlist');
            break;
          case 3:
            Navigator.of(context).pushNamed('/history');
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: ThemeColor().lightRed,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search_rounded,
            color: ThemeColor().lightRed,
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart,
            color: ThemeColor().lightRed,
          ),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.checklist_outlined,
            color: ThemeColor().lightRed,
          ),
          label: 'History',
        ),
      ],
    );
  }
}
