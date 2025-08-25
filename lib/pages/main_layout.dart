import 'package:flutter/material.dart';
import 'package:ui_assgn01/pages/combs.dart';
import 'package:ui_assgn01/pages/home.dart';
import 'package:ui_assgn01/pages/payment.dart';
import 'package:ui_assgn01/pages/profile.dart';

class MainLayout extends StatefulWidget {
  // The initial tab index to display when the layout loads
  final int initialIndex;
  const MainLayout({super.key, this.initialIndex = 0});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late int _currentIndex;

  // Titles displayed in the AppBar for each page
  final List<String> _titles = const [
    'Home Page',
    'Payment Page',
    'Combs Page',
    'Profile Page',
  ];

  // Widgets to display in the body for each tab
  final List<Widget> _pages = const [
    HomeBody(),
    PaymentBody(),
    CombsBody(),
    ProfileBody(),
  ];

  @override
  void initState() {
    super.initState();
    // Initialize the current tab index from widget.initialIndex
    _currentIndex = widget.initialIndex;
  }

  // Show a SnackBar with a short message
  void _showSnack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), duration: const Duration(seconds: 1)),
    );
  }

  // Handle bottom navigation or drawer item taps
  void _onNavTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with dynamic title
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        centerTitle: true,
        backgroundColor: Colors.black45,
        actions: [
          IconButton(
            onPressed: () => _showSnack(context, 'Searching...'),
            icon: const Icon(Icons.search),
          ),
        ],
      ),

      // Drawer navigation menu
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.black12),
              child: Text('Drawer Header!'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                _onNavTapped(0);         // Navigate to Home
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Payment'),
              onTap: () {
                Navigator.pop(context);
                _onNavTapped(1);         // Navigate to Payment
              },
            ),
            ListTile(
              leading: const Icon(Icons.food_bank),
              title: const Text('Combs'),
              onTap: () {
                Navigator.pop(context);
                _onNavTapped(2);         // Navigate to Combs
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                _onNavTapped(3);         // Navigate to Profile
              },
            ),
          ],
        ),
      ),

      // Body that switches content without losing state using IndexedStack
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),

      // Bottom navigation bar for quick tab switching
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // Use Colors.black45 for dark theme
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onNavTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Payment'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'Combs'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

