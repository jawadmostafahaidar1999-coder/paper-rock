import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MainAp());
}

class MainAp extends StatelessWidget {
  const MainAp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> choices = ['✊', '🖐️', '✌️'];
  List<Image> images = [
    Image.asset('assets/images/rock.jpg', width: 100, height: 100),
    Image.asset('assets/images/paper.jpg', width: 100, height: 100),
    Image.asset('assets/images/scissor.jpg', width: 100, height: 100),
  ];
  int userScore = 0;
  int computerScore = 0;
  int draw = 0;
  String userchoice = '?';
  String computerchoice = '?';
  String result = '';

  void playGame(int userIndex) {
    setState(() {
      userchoice = choices[userIndex];
      int computerIndex = Random().nextInt(3);
      computerchoice = choices[computerIndex];
      if (userIndex == computerIndex) {
        result = "It's a tie 😑";
        draw++;
      } else if ((userIndex == 1 && computerIndex == 0) ||
          (userIndex == 0 && computerIndex == 2) ||
          (userIndex == 2 && computerIndex == 1)) {
        result = 'You win 🥳';
        userScore++;
      } else {
        computerScore++;
        result = 'You lose 😢';
      }
    });
  }

  void resetGame() {
    setState(() {
      userScore = 0;
      computerScore = 0;
      draw = 0;
      userchoice = '?';
      computerchoice = '?';
      result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              const Color.fromARGB(204, 104, 58, 183),
              Colors.blue,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Let's play rock paper scissors",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You: ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(userchoice, style: TextStyle(fontSize: 35,color: Colors.red, fontWeight: FontWeight.bold)),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Computer:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(computerchoice, style: TextStyle(fontSize: 35, color: Colors.red, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //here I used List.generate to create a list of 3 icons
                children: List.generate(3, (index) {
                  return GestureDetector(
                    onTap: () {
                      playGame(index);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 40),
                     width: 100,
                    height: 100,
                    clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                       
                    ),
                      child: images[index],
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),
              Text(
                result,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Your score: $userScore   Computer score: $computerScore    draw: $draw',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              IconButton(
                icon: Icon(
                  Icons.refresh,
                  size: 40,
                  color: Colors.red,
                  weight: 20,
                ),
                onPressed: () {
                  resetGame();
                },
              ),
              Text(
                'Click To Reset The Game',
                style: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
