import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  final Icon icon;
  final String label;

  const IconContent({Key key, this.label, @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
