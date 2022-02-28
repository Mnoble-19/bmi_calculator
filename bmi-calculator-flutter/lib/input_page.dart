import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'calculator_brain.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xff111328);

enum Gender1 { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender1 selectedGender;
  int height = 180;
  int weight = 69;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender1.FEMALE;
                    });
                  },
                  color: selectedGender == Gender1.MALE
                      ? activeCardColor
                      : inactiveCardColor,
                  cardChild: IconContent(
                    icon: Icon(FontAwesomeIcons.mars, size: 75),
                    label: 'MALE',
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender1.FEMALE;
                    });
                  },
                  color: selectedGender == Gender1.FEMALE
                      ? activeCardColor
                      : inactiveCardColor,
                  cardChild: IconContent(
                      label: 'FEMALE',
                      icon: Icon(
                        FontAwesomeIcons.venus,
                        size: 75.0,
                      )),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(
            color: inactiveCardColor,
            cardChild: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0)),
                  child: Slider(
                      thumbColor: Color(0xFFEB1555),
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey,
                      value: height.toDouble(),
                      min: 120.0,
                      max: 250.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  color: inactiveCardColor,
                  cardChild: Column(
                    children: [
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              RoundButtonStuff(
                                icon1: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundButtonStuff(
                                icon1: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: inactiveCardColor,
                  cardChild: Column(
                    children: [
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              RoundButtonStuff(
                                icon1: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundButtonStuff(
                                icon1: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            CalculatorBrain calc =
                CalculatorBrain(height: height, weight: weight);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    resultInterpretation: calc.getInterpretation()),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Center(
              child: Text(
                'CALCULATE',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            color: Color(0xFFEB1555),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 80.0,
          ),
        )
      ]),
    );
  }
}

class RoundButtonStuff extends StatelessWidget {
  final IconData icon1;
  final Function onPressed;

  const RoundButtonStuff({Key key, this.icon1, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon1),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
    );
  }
}
