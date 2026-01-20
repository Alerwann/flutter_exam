import 'package:dailyfamilymessage/pages/daily_message.dart';
import 'package:dailyfamilymessage/pages/setting_menu.dart';
import 'package:dailyfamilymessage/pages/topic_list_screen.dart';
import 'package:dailyfamilymessage/provider/profil_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _pseudo;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfilProvider>(
      builder: (context, profil, child) {
        _pseudo = profil.pseudo;
        print("le pseudo doit etre : $_pseudo");
        return Scaffold(
          appBar: AppBar(
            leading: Image.asset('assets/aap_icon.png', height: 50),
            title: Text('Hi $_pseudo!', style: TextStyle(fontSize: 40)),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingMenu()),
                  );
                },
                icon: Icon(Icons.settings),
              ),
            ],
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 300,
                          child: Text(
                            "Your group have a message for you !",
                            style: TextStyle(fontSize: 30),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        // Detail Information
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Group Information"),
                                  content: const Text(
                                    "The group you belong to can be changed in the settings.",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text("OK"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.info),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    height: 200,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DailyMessage(),
                          ),
                        );
                      },
                      child: Text("Message"),
                    ),
                  ),

                  SizedBox(
                    height: 200,
                    width: 300,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.secondary,
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TopicListScreen(),
                          ),
                        );
                      },
                      child: Text("Shopping List"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
