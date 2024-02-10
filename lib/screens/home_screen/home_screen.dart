import 'package:flutter/material.dart';
import 'package:shipsy_assignment/screens/home_screen/components/upcoming_movies_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  int selectedIndex = 0;
  final upComingMoviesTab = const UpComingMoviesTab();
  List<String> pageTitle = ["Upcoming Movies", "My Tickets"];
  List<Widget> get tabViews => [upComingMoviesTab, Container()];

  void onTabChange(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle[selectedIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'My Tickets',
            backgroundColor: Colors.green,
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: onTabChange,
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: tabViews,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
