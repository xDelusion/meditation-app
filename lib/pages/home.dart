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
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyCard(
                    color: Color.fromARGB(255, 255, 255, 255),
                    cardName: "Tips",
                    pathName: '/tips',
                    image:
                        "https://t4.ftcdn.net/jpg/03/52/53/05/360_F_352530562_wNchqXG5SH1DDMbQdlYfX7Ga7EOf6prs.jpg",
                  ),
                  MyCard(
                    color: Color.fromARGB(255, 255, 255, 255),
                    cardName: "Meditation",
                    pathName: '/meditation',
                    image:
                        "https://img.freepik.com/vecteurs-premium/seule-ligne-dessinant-jeune-femme-affaires-faisant-meditation-employee-assise-dans-pose-yoga-relaxante-se-calmer-gerer-stress-ligne-continue-dessin-illustration-vectorielle-graphique_638785-51.jpg?w=2000",
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyCard(
                    color: Color.fromARGB(255, 255, 255, 255),
                    cardName: "Music",
                    pathName: '/music',
                    image:
                        "https://i.pinimg.com/originals/73/48/c8/7348c8764a4c92aec77874dd3b461830.jpg",
                  ),
                  MyCard(
                    color: Color.fromARGB(255, 255, 255, 255),
                    cardName: "Yoga Videos",
                    pathName: '/yoga_vids',
                    image:
                        "https://t4.ftcdn.net/jpg/01/78/16/97/360_F_178169773_Fkjq4g0oQQcMT9FG3Ayzd6VqNpRHpUbv.jpg",
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                    color: toggleValue ? Colors.blueGrey : Colors.grey.shade100,
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
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  'Quote of the day:\n"Your calm mind is the ultimate weapon against your challenges, So relax..."',
                  style: TextStyle(
                      fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  toggleButton() {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    setState(() {
      toggleValue = !toggleValue;
      themeProvider.toggleTheme();
    });
  }
}
