import 'package:flutter/material.dart';

class Flags extends StatelessWidget {
  final String flag;

  static const bra = 'lib/assets/flags/brazil.png';
  static const usa = 'lib/assets/flags/united_states.png';
  static const uer = 'lib/assets/flags/european_union.png';

  Flags({
    @required this.flag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 17,
      width: 32,
      margin: EdgeInsets.only(left: 5, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Image.asset(
        flag,
        fit: BoxFit.cover,
      ),
    );
  }
}
