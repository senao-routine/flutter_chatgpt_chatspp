import 'package:flutter/material.dart';
import 'package:flutter_chatgpt_chatapp/main_screen/ai_chat_screen.dart';
import 'package:flutter_chatgpt_chatapp/main_screen/posts_screen.dart';
import 'package:flutter_chatgpt_chatapp/main_screen/profile_screen.dart';
import 'package:flutter_chatgpt_chatapp/providers/my_theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> tabs = [
    const AIChatScreen(),
    const PostsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final themeStatus = Provider.of<MyThemeProvider>(context);
    Color color = themeStatus.themeType ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ChatGPT',
          style: TextStyle(
            color: color,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (themeStatus.themeType) {
                  themeStatus.setTheme = false;
                } else {
                  themeStatus.setTheme = true;
                }
              },
              icon: Icon(
                themeStatus.themeType
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
                color: color,
              ))
        ],
      ),
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: color,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'AI Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Posts'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          print('Index $index');
        },
      ),
    );
  }
}
