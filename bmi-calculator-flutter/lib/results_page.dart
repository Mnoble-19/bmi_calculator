import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String resultInterpretation;

  const ResultsPage(
      {Key key,
      @required this.bmiResult,
      @required this.resultText,
      @required this.resultInterpretation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Text(
              'Your Results!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
            ),
          ),
          Expanded(
            flex: 3,
            child: ReusableCard(
              color: Color(0xFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 30.0,
                    ),
                  ),
                  Text(
                    bmiResult,
                    style:
                        TextStyle(fontSize: 55.0, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    resultInterpretation,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 28.0),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => InputPage()));
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Center(
                child: Text(
                  'RE-ENTER VALUES',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
            ),
          )
        ],
      ),
    );
  }
}
