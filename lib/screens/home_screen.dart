import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:test/screens/bots_screen.dart';
import 'package:test/screens/chat_page.dart';
import 'package:test/screens/courses_screen.dart';
import 'package:test/screens/posts_page.dart';
import 'package:test/screens/settings.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _page = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    PostPage(),
    const ChatPage(),
    BotsScreen(),
    const CoursesPage(),
    const SettingsPage(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _page = index;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _page = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        items: <Widget>[
          Image.asset('assets/home.png', width: 30, height: 30),
          Image.asset('assets/communication.png', width: 30, height: 30),
          Image.asset('assets/chatbot.png', width: 30, height: 30),
          Image.asset('assets/online-course.png', width: 30, height: 30),
          Image.asset('assets/setting.png', width: 30, height: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: const Color(0xffB9B4F6),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: _onItemTapped,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pages,
      ),
    );
  }
}
