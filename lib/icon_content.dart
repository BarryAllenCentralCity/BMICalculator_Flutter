import 'package:flutter/material.dart';
import 'constants.dart';


class IconContent extends StatelessWidget {
  IconContent(this.iconShow, this.genderName);

  final IconData iconShow;
  final String genderName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconShow,
          size: kIconSize,
        ),
        const SizedBox(
          height: kGapBoxHeight,
        ),
        Text(
          genderName,
          style: kIconTextStyle,
        )
      ],
    );
  }
}
