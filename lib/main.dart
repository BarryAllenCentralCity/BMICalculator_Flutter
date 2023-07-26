import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const InputPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          brightness: Brightness.dark,
          primaryColor: const Color(0xFF0A0E21),
          appBarTheme: const AppBarTheme(
            color:  Color(0xFF0A0E21),
            centerTitle: true,
          ),
          sliderTheme: SliderTheme.of(context).copyWith(
            thumbColor: const Color(0xFFEB1555),
            overlayColor: const Color(0x29EB1555),
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
            activeTrackColor: Colors.white,
          ),
          scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
    );
  }
}