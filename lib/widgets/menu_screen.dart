import 'dart:io';

import 'package:flutter/material.dart';
import 'package:guess_card_smaller_or_greater/constants/assets.dart';
import 'package:guess_card_smaller_or_greater/widgets/game_with_button_menu.dart';
import 'package:guess_card_smaller_or_greater/widgets/game_with_countdown_menu.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double high = size.height;
    return Container(
      padding: const EdgeInsets.only(top: 30),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            // Colors.white,
            // Colors.pink,
            Color.fromARGB(255, 62, 59, 89),
            Color.fromARGB(255, 7, 1, 43),
          ],
        ),
      ),
      child: Center(
        child: Column(
          children: [
            const Text(
              'ဆော့ချင်သည့်ကဒ်ကိုရွေးပါ။',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 253, 197, 191),
              ),
            ),
            const SizedBox(height: 25),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TimerGame(),
                    ),
                  ),
                  child: Image.asset(
                    Assets.assetsJoker,
                    width: width * 0.4,
                    height: high * 0.25,
                  ),
                ),
                const Text(
                  'Timer နဲ့ဆော့မယ်',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ButtonGame(),
                    ),
                  ),
                  child: Image.asset(
                    Assets.assetsQueen,
                    width: width * 0.4,
                    height: high * 0.25,
                  ),
                ),
                const Text(
                  'Button နဲ့ဆော့မယ်',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(height: 50),
            TextButton(
              // style: TextButton.styleFrom(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
              //   backgroundColor: Colors.white,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(15),
              //   ),
              // ),
              onPressed: () {
                exit(0);
              },
              child: const Text(
                'ဂိမ်းမှထွက်မည်',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 241, 16, 0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
