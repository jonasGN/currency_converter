import 'package:conversor_moedas/layout/colors.dart';
import 'package:flutter/material.dart';

// TODO: animate arrow on the left, rotating 180° and come back to original position
// TODO: animate switch arrows on the green button to when pressed, rotate as well

class ConverterSection extends StatelessWidget {
  final Function onPressedSwitch;

  ConverterSection({this.onPressedSwitch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(4),
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: MyColors.SECONDARY,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.arrow_downward,
              color: MyColors.BLACK,
              size: 20,
            ),
          ),
          Expanded(
            child: Text(
              'Converter para',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: MyColors.BLACK,
                  ),
            ),
          ),
          FlatButton(
            onPressed: onPressedSwitch,
            child: Container(
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: MyColors.GREEN,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                Icons.swap_vert,
                color: MyColors.WHITE,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
