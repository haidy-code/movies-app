import 'package:flutter/material.dart';
import 'package:movies_app/browse/Browse.dart';
import 'package:movies_app/home/Home.dart';
import 'package:movies_app/search/Search.dart';
import 'package:movies_app/watchlist/WatchList.dart';

import 'MyThemeData.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = 'homepage';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemeData.primarycolor,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: MyThemeData.secondcolor),
        child: BottomNavigationBar(
          currentIndex: currentpage,
          onTap: (int index) {
            setState(() {
              currentpage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/Home icon.png',
                width: 36,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/search.png', width: 36),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/browse.png', width: 36),
                label: 'Browse'),
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/watch_list.png', width: 36),
                label: 'Watch List'),
          ],
        ),
      ),
      body: views[currentpage],
    );
  }

  List<Widget> views = [Home(), Search(), Browse(), WatchList()];
  Widget getcurrenepage() {
    if (currentpage == 0) {
      return Home();
    } else if (currentpage == 1) {
      return Search();
    } else if (currentpage == 2) {
      return Browse();
    } else {
      return WatchList();
    }
  }
}
