import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:u008_bmicalculator/results_page.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      cardColor: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(FontAwesomeIcons.mars, 'MALE'),
                      onTapGesture: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      }),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(FontAwesomeIcons.venus, 'FEMALE'),
                    onTapGesture: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            cardColor: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Height', style: kLabelTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    const Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      max: kSliderMaxHeight,
                      min: kSliderMinHeight,
                      //activeColor: Colors.white,
                    )),
              ],
            ),
            onTapGesture: () {},
          )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  onTapGesture: () {},
                  cardColor: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Weight',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            icon: const Icon(FontAwesomeIcons.minus),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            icon: const Icon(FontAwesomeIcons.plus),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    onTapGesture: () {},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: const Icon(FontAwesomeIcons.minus),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: const Icon(FontAwesomeIcons.plus),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith((states) => kBottomContainerColor),
              ),
              onPressed: (){
            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
            Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => ResultsPage(bmiResults: calc.calculateBMI(), resultsText: calc.getResult(), interpretation: calc.getInterpretation()),
              ),
            );
          }, child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              child: Text('CALCULATE', style: kLargeButtonTextStyle,))),
         /*( ClipRect(
              child: BottomButton(
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                    ResultsPage res = ResultsPage(bmiResults: calc.calculateBMI(), resultsText: calc.getResult(), interpretation: calc.getInterpretation());
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => res),
                    );
                //Navigator.push(context, ResultsPage(bmiResults: calc.calculateBMI(), resultsText: calc.getResult(), interpretation: calc.getInterpretation()) as Route<Object?>);
              },
              buttonTitle: 'CALCULATE')),)*/

          /*      GestureDetector(
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResults: calc.calculateBMI(),
                      resultsText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
              child: Container(
                child: Text(
                  'CALCULATE',
                  style: kLabelTextStyle,
                ),
                color: kBottomContainerColor,
                margin: const EdgeInsets.only(top: 10.0),
                width: double.maxFinite,
                height: kBottomContainerHeight,
              )),
 */
        ],
      ),
    );
  }
}
