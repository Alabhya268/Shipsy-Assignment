import 'package:flutter/material.dart';
import 'package:shipsy_assignment/screens/home_screen/tabs/my_tickets_tab.dart';
import 'package:shipsy_assignment/screens/home_screen/tabs/upcoming_movies_tab.dart';
import 'package:shipsy_assignment/utils/extensions/app_extensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  int selectedIndex = 0;
  final upComingMoviesTab = const UpComingMoviesTab();
  final myTicketTab = const MyTicketsTab();
  List<String> pageTitle = ["Upcoming Movies", "My Tickets"];
  List<Widget> get tabViews => [upComingMoviesTab, myTicketTab];

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
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'My Tickets',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: context.constantUi.primaryColor,
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
