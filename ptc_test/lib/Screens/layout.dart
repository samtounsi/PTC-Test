import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ptc_test/Components/basics.dart';
import 'package:ptc_test/Screens/explore.dart';
import 'package:ptc_test/Screens/myCart.dart';
import 'package:ptc_test/Style/colors.dart';

class NavBar extends StatefulWidget {
  NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selected = 1;
  String barTitle = 'Find Products';
  PageController controller = PageController(initialPage: 1);
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/images/store.svg',
      ),
      activeIcon: SvgPicture.asset(
        'assets/images/store.svg',
        colorFilter: ColorFilter.mode(green, BlendMode.srcIn),
      ),
      label: 'Shop',
    ),
    BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/images/explore.svg',
          colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
        ),
        activeIcon: SvgPicture.asset(
          'assets/images/explore.svg',
          colorFilter: ColorFilter.mode(green, BlendMode.srcIn),
        ),
        label: 'Explore'),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/images/cart.svg'),
      activeIcon: SvgPicture.asset(
        'assets/images/cart.svg',
        colorFilter: ColorFilter.mode(green, BlendMode.srcIn),
      ),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
        icon: SvgPicture.asset('assets/images/favorite.svg'),
        activeIcon: SvgPicture.asset(
          'assets/images/favorite.svg',
          colorFilter: ColorFilter.mode(green, BlendMode.srcIn),
        ),
        label: 'Favourite'),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/images/person.svg'),
      activeIcon: SvgPicture.asset(
        'assets/images/store.svg',
        colorFilter: ColorFilter.mode(green, BlendMode.srcIn),
      ),
      label: 'Profile',
    ),
  ];
  List<Pair> pages = [
    Pair(
        'shop',
        Center(
          child: text('Shop with us'),
        )),
    Pair('Find Product', Explore()),
    Pair('My Cart', MyCart()),
    Pair(
        'Fav',
        Center(
          child: text('My Favorites'),
        )),
    Pair(
        'Profile',
        Center(
          child: text('View Profile'),
        )),
  ];

  void onTab(int i) {
    setState(() {
      selected = i;
      controller.animateToPage(
        i,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      barTitle = pages[i].title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text(barTitle),
        centerTitle: true,
      ),
      body: PageView(
        controller: controller,
        onPageChanged: (i) {
          setState(() {
            selected = i;
            barTitle = pages[i].title;
          });
        },
        children: pages.map((pair) => pair.widget).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        onTap: (i) {
          onTab(i);
        },
        currentIndex: selected,
        selectedItemColor: green,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(),
      ),
    );
  }
}

class Pair {
  Widget widget;
  String title;
  Pair(this.title, this.widget);
}
