import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrimaryLayout extends ConsumerStatefulWidget {
  final String title;
  final List<PrimaryLayoutPage> pages;

  const PrimaryLayout(this.title, this.pages, {Key? key}) : super(key: key);

  @override
  ConsumerState<PrimaryLayout> createState() {
    return _PrimaryLayoutState();
  }
}

class _PrimaryLayoutState extends ConsumerState<PrimaryLayout> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: widget.pages.elementAt(_selectedIndex).page,
      bottomNavigationBar: BottomNavigationBar(
        items: [for (final p in widget.pages) p.navItem],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class PrimaryLayoutPage {
  final Widget page;
  final BottomNavigationBarItem navItem;

  const PrimaryLayoutPage(this.page, this.navItem);
}
