import 'package:conversor_moedas/components/flags.dart';
import 'package:conversor_moedas/layout/colors.dart';
import 'package:flutter/material.dart';

const double borderRadius = 10.0;

class CurrencyButton extends StatelessWidget {
  final Function onPressed;

  CurrencyButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: MyColors.PRIMARY,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        children: <Widget>[
          Flags(flag: Flags.usa),
          Expanded(
            child: Text(
              'USD',
              style: TextStyle(
                color: MyColors.BLACK,
                fontSize: 17,
                fontWeight: FontWeight.w500, // [medium]
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.keyboard_arrow_down),
            padding: EdgeInsets.all(0),
            onPressed: onPressed,
            color: MyColors.BLACK,
            iconSize: 24,
          )
        ],
      ),
    );
  }
}
