import 'package:first_project/constants.dart';
import 'package:flutter/material.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({super.key});

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  int height = 150;
  int weight = 50;

  String gender = '';

  late double bmi = calculateBMI(height: height, weight: weight);

  double maleOpacity = 1.0;
  double femaleOpacity = 1.0;

  Color bmiValueColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.amberAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: SafeArea(
          child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.amberAccent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const VerticalDivider(
                        width: 1.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              gender = 'M';
                              maleOpacity = 1.0;
                              femaleOpacity = 0.6;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: AnimatedOpacity(
                              opacity: maleOpacity,
                              duration: const Duration(milliseconds: 500),
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    color: gender == 'M'
                                        ? Colors.amber
                                        : Colors.white.withAlpha(80),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.male,
                                      size: 100,
                                    ),
                                    Text("Male"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              gender = 'F';
                              femaleOpacity = 1.0;
                              maleOpacity = 0.6;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: AnimatedOpacity(
                              opacity: femaleOpacity,
                              duration: const Duration(milliseconds: 500),
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    color: gender == 'F'
                                        ? Colors.amber
                                        : Colors.white.withAlpha(80),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.female,
                                      size: 100,
                                    ),
                                    Text("Female"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Column(
                    children: [
                      const Text(
                        "Your BMI",
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(12),
                      ),
                      Text(
                        bmi.toStringAsFixed(2),
                        style: kInputLabelColor,
                      ),
                      const Padding(padding: EdgeInsets.all(16)),
                      Text(
                        getResult(bmi),
                        style: TextStyle(
                            color: bmiValueColor,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text("Height (cm)",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 20,
                            ),
                            Text("$height", style: kInputValuesColor),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                FloatingActionButton(
                                  backgroundColor: Colors.redAccent,
                                  onPressed: () {
                                    setState(() {
                                      if (height > 10) {
                                        height--;
                                        bmi = calculateBMI(
                                            height: height, weight: weight);

                                        if (getResult(bmi) == 'Overweight') {
                                          bmiValueColor = Colors.red;
                                        } else if (getResult(bmi) ==
                                            'Underweight') {
                                          bmiValueColor = Colors.blue;
                                        } else {
                                          bmiValueColor = Colors.green;
                                        }
                                      }
                                    });
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    size: 40,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      if (height < 251) {
                                        height++;
                                        bmi = calculateBMI(
                                            height: height, weight: weight);

                                        if (getResult(bmi) == 'Overweight') {
                                          bmiValueColor = Colors.red;
                                        } else if (getResult(bmi) ==
                                            'Underweight') {
                                          bmiValueColor = Colors.blue;
                                        } else {
                                          bmiValueColor = Colors.green;
                                        }
                                      }
                                    });
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    size: 40,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text(
                              "Weight (kg)",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text("$weight", style: kInputValuesColor),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                FloatingActionButton(
                                  backgroundColor: Colors.redAccent,
                                  onPressed: () {
                                    setState(() {
                                      if (weight > 0) {
                                        weight--;
                                        bmi = calculateBMI(
                                            height: height, weight: weight);

                                        if (getResult(bmi) == 'Overweight') {
                                          bmiValueColor = Colors.red;
                                        } else if (getResult(bmi) ==
                                            'Underweight') {
                                          bmiValueColor = Colors.blue;
                                        } else {
                                          bmiValueColor = Colors.green;
                                        }
                                      }
                                    });
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    size: 40,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      if (weight <= 300) {
                                        weight++;
                                        bmi = calculateBMI(
                                            height: height, weight: weight);

                                        if (getResult(bmi) == 'Overweight') {
                                          bmiValueColor = Colors.red;
                                        } else if (getResult(bmi) ==
                                            'Underweight') {
                                          bmiValueColor = Colors.blue;
                                        } else {
                                          bmiValueColor = Colors.green;
                                        }
                                      }
                                    });
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    size: 40,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }

  double calculateBMI({required int height, required int weight}) {
    return weight / ((height / 100) * (height / 100));
  }

  String getResult(bmiValue) {
    if (bmiValue >= 25) {
      return "Overweight";
    } else if (bmiValue > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }
}
