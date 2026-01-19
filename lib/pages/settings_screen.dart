import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Display settings")),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("System theme", style: TextStyle(fontSize: 30)),
                  SizedBox(width: 50),
                  Icon(Icons.radio_button_checked, size: 30),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("DarkMode", style: TextStyle(fontSize: 30)),
                  SizedBox(width: 50),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.toggle_off, size: 30),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
