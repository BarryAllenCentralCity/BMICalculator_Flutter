import 'package:flutter/material.dart';
//import 'package:u008_bmicalculator/bottom_button.dart';
import 'package:u008_bmicalculator/reusable_card.dart';
import 'package:u008_bmicalculator/constants.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({required this.bmiResults, required this.resultsText, required this.interpretation});

  final String bmiResults;
  final String resultsText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              onTapGesture: (){},
              cardColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultsText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResults ,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          },
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith((states) => kBottomContainerColor),
              ),
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            child: Text('RE-CALCULATE', style: kLargeButtonTextStyle,),
          ))
          /*BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),*/
        ],
      ),
    );
  }
}
