import 'package:chicken_recipe_bangla/screens/home_screen.dart';
import 'package:chicken_recipe_bangla/screens/favourite_screnn.dart';
import 'package:chicken_recipe_bangla/screens/setting_screen.dart';
import 'package:chicken_recipe_bangla/screens/tips_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ProvidedStylesExample extends StatefulWidget {
  const ProvidedStylesExample({super.key});

  @override
  State<ProvidedStylesExample> createState() => _ProvidedStylesExampleState();
}

class _ProvidedStylesExampleState extends State<ProvidedStylesExample> {
  late PersistentTabController _controller;
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() => [
        const HomeScreen(),
        const TipsScreen(),
        const FavouriteScreen(),
        const SettingsScreen(),
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.home),
            title: "Home",
            activeColorPrimary: Colors.black,
            inactiveColorPrimary: Colors.grey,),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.tips_and_updates),
          title: "Tips",
          activeColorPrimary: Colors.black,
          inactiveColorPrimary: Colors.grey,
          /*routeAndNavigatorSettings: RouteAndNavigatorSettings(
        initialRoute: "/",
        routes: {
          "/first": (final context) => const MainScreen2(),
          "/second": (final context) => const MainScreen3(),
        },
      ),*/
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.favorite),
          title: "Favourite",
          activeColorPrimary: Colors.black,
          inactiveColorPrimary: Colors.grey,
          /*routeAndNavigatorSettings: RouteAndNavigatorSettings(
        initialRoute: "/",
        routes: {
          "/first": (final context) => const MainScreen2(),
          "/second": (final context) => const MainScreen3(),
        },
      ),*/
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.settings),
          title: "Settings",
          activeColorPrimary: Colors.black,
          inactiveColorPrimary: Colors.grey,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            /*routes: {
          "/first": (final context) => const MainScreen2(),
          "/second": (final context) => const MainScreen3(),
        },*/
          ),
        ),
      ];

  @override
  Widget build(final BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.black,
          elevation: 4, // Set the elevation to a suitable value for the shadow
          centerTitle: true,
          title: const Text(
            "চিকেন রেসিপি",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
    body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          resizeToAvoidBottomInset: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          bottomScreenMargin: 0,
          /*onWillPop: (final context) async {
        await showDialog(
          context: context,
          useSafeArea: true,
          builder: (final context) => Container(
            height: 50,
            width: 50,
            color: Colors.white,
            child: ElevatedButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        );
        return false;
      },*/
          backgroundColor: Colors.white,
          hideNavigationBar: _hideNavBar,
          decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),
          navBarStyle:
              NavBarStyle.style9, // Choose the nav bar style with this property
        ),
      );
}
