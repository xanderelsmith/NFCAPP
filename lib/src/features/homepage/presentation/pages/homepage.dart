import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          enableFeedback: true,
          items: BottomNavPages.values
              .map((e) => BottomNavigationBarItem(
                    icon: Icon(e.icon),
                    label: e.name,
                  ))
              .toList()),
      appBar: AppBar(
        title: const Text('Back'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [Text('ACCOUNT')],
        ),
      ),
    );
  }
}

enum BottomNavPages {
  home('Home', Icons.home),
  send('Send', Icons.send),
  account('Account', Icons.person);

  const BottomNavPages(this.name, this.icon);
  final String name;
  final IconData icon;
}
