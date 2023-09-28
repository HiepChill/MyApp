import 'package:flutter/material.dart';
import 'package:food_app/components/button.dart';
import 'package:food_app/themes/const.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro_Page extends StatelessWidget {
  const Intro_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor_introPage,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'BaMi Superstar',
                  style: GoogleFonts.dmSerifDisplay(
                      fontSize: 28, color: Colors.white),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Image.asset(
                'assets/images/banh-mi.png',
                height: 300,
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Center(
              child: Text(
                'THE ORIGINAL TASTE COMBINE WITH CREATIVITY RECIPE',
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 26, color: Colors.white),
                maxLines: 2,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Feel the taste of one of the most popular signature food in Hanoi, bet you will love it  <3',
              style:
                  TextStyle(color: Colors.grey[300], height: 2, fontSize: 15),
            ),
            const SizedBox(
              height: 70,
            ),
            MyButton(
              text: "Let's Go !!!",
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
