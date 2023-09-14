import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const lotteryApp());
}

class lotteryApp extends StatefulWidget {
  const lotteryApp({super.key});

  @override
  State<lotteryApp> createState() => _lotteryAppState();
}

class _lotteryAppState extends State<lotteryApp> {
  Random random = Random();
  int x = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("LotteryApp"),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Lottery winning number is 4",
                  style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 250,
                width: 300,
                decoration: BoxDecoration(
                  color: x == 4
                      ? Colors.teal.withOpacity(0.3)
                      : Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: x == 4
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.done_all,
                              color: Colors.green,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                                "Congratulation you have won the lottery \nyour number is $x",
                                textAlign: TextAlign.center),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                                "Better luck next time your number is $x\ntry again",
                                textAlign: TextAlign.center),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            x = random.nextInt(10);
            print(x);
            setState(() {});
          },
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}
