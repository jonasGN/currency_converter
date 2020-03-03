import 'package:flutter/material.dart';

class ConverterSection extends StatelessWidget {
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
              color: Color(0xffE1E5F0), // [secondary]
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.arrow_downward,
              color: Color(0xff757F8C), // [black]
              size: 20,
            ),
          ),
          Expanded(
            child: Text(
              'Converter para',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff757F8C) // [black]
                  ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: Color(0xff54D3AD), // [green]
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              Icons.swap_vert,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}