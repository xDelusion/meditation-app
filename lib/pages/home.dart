import 'package:flutter/material.dart';
import 'package:meditation_app/providers/theme_provider.dart';
import 'package:meditation_app/widgets/card.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool toggleValue = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeProvider.getTheme(),
        home: Scaffold(
          // appBar: AppBar(
          //   title: Text('Meditation Home'),
          // ),
          body: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Wrap(
              children: [
                MyCard(
                  color: Colors.red.shade300,
                  cardName: "Tips",
                  pathName: '/tips',
                  image: "",
                ),
                MyCard(
                  color: Colors.blue.shade300,
                  cardName: "Meditation",
                  pathName: '/meditation',
                  image: "",
                ),
                MyCard(
                  color: Colors.amber.shade300,
                  cardName: "Music",
                  pathName: '/music',
                  image: "",
                ),
                MyCard(
                  color: Colors.green.shade300,
                  cardName: "Yoga Videos",
                  pathName: '/yoga_vids',
                  image: "",
                ),
                SizedBox(height: 200),
                Center(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                      color:
                          toggleValue ? Colors.blueGrey : Colors.grey.shade100,
                    ),
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                          top: 6,
                          left: toggleValue ? 60 : 0,
                          right: toggleValue ? 0 : 60,
                          child: InkWell(
                            onTap: toggleButton,
                            child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 500),
                              transitionBuilder: (child, animation) {
                                return ScaleTransition(
                                  child: RotationTransition(
                                    child: child,
                                    turns: animation,
                                  ),
                                  scale: animation,
                                );
                              },
                              child: toggleValue
                                  ? Icon(
                                      Icons.nightlight_round,
                                      color: Colors.grey,
                                      size: 25,
                                    )
                                  : Icon(
                                      Icons.wb_sunny,
                                      color: Colors.grey,
                                      size: 25,
                                    ),
                              key: UniqueKey(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  toggleButton() {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    setState(() {
      toggleValue = !toggleValue;
      themeProvider
          .toggleTheme(); // Toggle the theme when the button is pressed
    });
  }
}
