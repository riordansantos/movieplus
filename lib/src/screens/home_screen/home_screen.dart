import 'package:flutter/material.dart';
import 'package:movieplus/src/screens/home_screen/tabs/favorite/favorite_tab_widget.dart';
import 'package:movieplus/src/screens/home_screen/tabs/last_orders/last_orders_tab_widget.dart';
import 'package:movieplus/src/screens/home_screen/tabs/home/home_tab_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFF333645),
        resizeToAvoidBottomInset: false,
        body: const TabBarView(
          children: [
            HomeTabWidget(),
            FavoriteTabWidget(),
            LastOrdersTabWidget(),
          ],
        ),
        bottomNavigationBar: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.width * 0.2,
          child: Theme(
            data: ThemeData(
              splashColor: const Color(0xFFEA334F),
              highlightColor: const Color(0xFFEA334F),
            ),
            child: const TabBar(
              indicator: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(51, 206, 62, 10),
                    blurRadius: 10.0,
                    spreadRadius: 0.1,
                  ),
                ],
              ),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  icon: Icon(Icons.home, size: 35),
                ),
                Tab(icon: Icon(Icons.favorite_border, size: 35)),
                Tab(icon: Icon(Icons.restore, size: 35)),
              ],
              labelColor: Color(0xFF333645),
              unselectedLabelColor: Color(0xFFf9f9f6),
            ),
          ),
        ),
      ),
    );
  }
}
