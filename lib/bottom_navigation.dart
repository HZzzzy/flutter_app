
import 'package:flutter/material.dart';

enum TabItem { red, green, blue }

class TabHelper {
  static TabItem item({int index}) {
    switch (index) {
      case 0:
        return TabItem.red;
      case 1:
        return TabItem.green;
      case 2:
        return TabItem.blue;
    }
    return TabItem.red;
  }

  static String description(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.red:
        return 'home';
      case TabItem.green:
        return 'search';
      case TabItem.blue:
        return 'history';
    }
    return '';
  }
  static IconData icon(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.red:
        return Icons.home;
      case TabItem.green:
        return Icons.search;
      case TabItem.blue:
        return Icons.history;
    }
    return Icons.home;
  }

  static MaterialColor color(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.red:
        return Colors.red;
      case TabItem.green:
        return Colors.green;
      case TabItem.blue:
        return Colors.blue;
    }
    return Colors.grey;
  }
}

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(tabItem: TabItem.red),
        _buildItem(tabItem: TabItem.green),
        _buildItem(tabItem: TabItem.blue),
      ],
      onTap: (index) => onSelectTab(
        TabHelper.item(index: index),
      ),
    );
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) {

    String text = TabHelper.description(tabItem);
    IconData icon = TabHelper.icon(tabItem);
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(item: tabItem),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTabMatching(item: tabItem),
        ),
      ),
    );
  }

  Color _colorTabMatching({TabItem item}) {
    return currentTab == item ? Colors.blue : Colors.grey;
  }
}