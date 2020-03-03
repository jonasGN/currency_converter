import 'package:conversor_moedas/layout/colors.dart';
import 'package:flutter/material.dart';

const double borderRadius = 10.0;

class MainCard extends StatelessWidget {
  final TextEditingController controller;
  final Function onChanged;
  final String prefix;
  final bool isBackground;

  MainCard({
    this.controller,
    this.onChanged,
    this.prefix = 'U\$',
    this.isBackground = false,
  });

  Widget renderBackground() {
    if (isBackground) {
      return comparisonContainer();
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.GREEN,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: MyColors.WHITE,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //
                inputTitle('Selecione sua moeda'),
                //
                CurrencyOption(),
                //
                inputTitle('Informe um valor'),
                //
                Row(
                  children: <Widget>[
                    Text(
                      '$prefix - ',
                      style: TextStyle(
                        color: MyColors.BLACK_OPACITY,
                        fontSize: 30,
                        fontWeight: FontWeight.w500, // [medium]
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        controller: controller,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        onChanged: onChanged,
                        cursorColor: MyColors.GREEN,
                        style: TextStyle(
                          color: MyColors.BLACK,
                          fontSize: 30,
                          fontWeight: FontWeight.w500, // [medium]
                        ),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: MyColors.SECONDARY,
                            ),
                            borderRadius: BorderRadius.circular(borderRadius),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: MyColors.PRIMARY,
                            ),
                            borderRadius: BorderRadius.circular(borderRadius),
                          ),
                          filled: true,
                          fillColor: MyColors.PRIMARY,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(child: renderBackground()),
        ],
      ),
    );
  }
}

//
Widget inputTitle(String title) {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    child: Text(
      title,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: MyColors.BLACK,
        fontSize: 14,
        fontWeight: FontWeight.w400, // [regular]
      ),
    ),
  );
}

class CurrencyOption extends StatelessWidget {
  final Function onPressed;

  CurrencyOption({this.onPressed});

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
          Container(
            margin: EdgeInsets.only(left: 5, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.amber,
            ),
            child: SizedBox(
              height: 20,
              width: 32,
            ),
          ),
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

Widget comparisonContainer({Widget child}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
    decoration: BoxDecoration(
      color: MyColors.GREEN,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(15.0),
        bottomRight: Radius.circular(15.0),
      ),
    ),
    child: Row(
      children: <Widget>[
        comparisonText('1 USD'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            Icons.keyboard_backspace,
            color: MyColors.WHITE,
            size: 24,
          ),
        ),
        comparisonText('4 BRL'),
      ],
    ),
  );
}

Widget comparisonText(String title) {
  return Text(
    title,
    style: TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
  );
}
