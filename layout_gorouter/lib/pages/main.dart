import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:layout_gorouter/views/business.dart';
import 'package:layout_gorouter/views/home.dart';
import 'package:layout_gorouter/views/school.dart';

class MainPage extends ConsumerStatefulWidget {
  final String title;
  final String view;

  const MainPage(this.title, this.view, {Key? key}) : super(key: key);

  final Map<String, _MainPageView> _views = const {
    'home': _MainPageView(
      HomeView.id,
      HomeView.navItem,
      HomeView(),
    ),
    'business': _MainPageView(
      BusinessView.id,
      BusinessView.navItem,
      BusinessView(),
    ),
    'school': _MainPageView(
      SchoolView.id,
      SchoolView.navItem,
      SchoolView(),
    ),
  };

  static GoRoute route(String title) {
    return GoRoute(
      path: 'main',
      redirect: (_) => '/main/home',
      routes: [
        GoRoute(
          path: ':view(home|business|school)',
          builder: (context, state) {
            final String view = state.params['view']!;
            return MainPage(title, view, key: state.pageKey);
          },
        ),
      ],
    );
  }

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  void didUpdateWidget(MainPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _selectedIndex = widget._views.keys.toList().indexOf(widget.view);
    });
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: widget._views.values.elementAt(_selectedIndex).view,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(child: Text(widget.title)),
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () => GoRouter.of(context).push('/settings'),
            ),
            ListTile(
              title: const Text('About'),
              onTap: () => GoRouter.of(context).push('/about'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [for (final s in widget._views.values) s.navItem],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
          String destView = widget._views.values.elementAt(index).id;
          GoRouter.of(context).go("/main/$destView");
        },
      ),
    );
  }
}

class _MainPageView {
  final String id;
  final BottomNavigationBarItem navItem;
  final Widget view;

  const _MainPageView(this.id, this.navItem, this.view);
}
