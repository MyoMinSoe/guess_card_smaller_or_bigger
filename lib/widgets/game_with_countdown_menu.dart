import 'package:flutter/material.dart';
import 'package:guess_card_smaller_or_greater/widgets/game_with_countdown.dart';
import 'package:lottie/lottie.dart';

class TimerGame extends StatelessWidget {
  const TimerGame({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GameWithCountdownMenu(),
    );
  }
}

class GameWithCountdownMenu extends StatefulWidget {
  const GameWithCountdownMenu({super.key});

  @override
  State<GameWithCountdownMenu> createState() => _GameWithCountdownMenuState();
}

class _GameWithCountdownMenuState extends State<GameWithCountdownMenu> {
  final textEditingController = TextEditingController();

  final GlobalKey<FormState> formController = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            // Colors.pink,
            // Colors.white,
            // Color.fromARGB(255, 20, 1, 105),
            Color.fromARGB(255, 62, 59, 89),
            Color.fromARGB(255, 7, 1, 43),
          ],
        ),
      ),
      child: Center(
        child: Form(
          key: formController,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Lottie.asset(
                  'images/cat_playing.json',
                  width: 300,
                  height: 200,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  'Enter Your Win Point!',
                  style: TextStyle(
                    color: Color.fromARGB(255, 194, 181, 253),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    autofocus: true,
                    style: const TextStyle(fontSize: 15),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter Number',
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withValues(alpha: 0.5),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 253, 140, 235),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    textAlign: TextAlign.center,
                    controller: textEditingController,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          int.parse(value) < 1) {
                        return 'Point must be at least 1';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(height: 30),
                TextButton(
                  // style: ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.white,
                  //     padding: const EdgeInsets.symmetric(
                  //         vertical: 20, horizontal: 40),
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(25))),
                  onPressed: () {
                    if (formController.currentState!.validate()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const GameWithCountdown(),
                          settings: RouteSettings(
                            arguments: textEditingController.text,
                          ),
                        ),
                      );
                    }
                    setState(() {});
                  },
                  child: const Text(
                    'START',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  // style: ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.white,
                  //     padding: const EdgeInsets.symmetric(
                  //         vertical: 20, horizontal: 40),
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(25))),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'BACK TO MENU',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
