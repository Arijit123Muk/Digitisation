import 'package:flutter/material.dart';

Widget ListRows(String images, String text, String routeName, context) {
  return InkWell(
    onTap: null,
    child: Row(
      children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Image.asset(
              'assets/images/$images',
              width: 20.0,
            )),
        SizedBox(
          width: 20.0,
        ),
        Text(
          '$text',
          style: TextStyle(
              fontFamily: 'NotoSans',
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
              color: Colors.black),
        ),
        Spacer(),
        Icon(
          Icons.keyboard_arrow_right_outlined,
          size: 35.0,
          color: Colors.black54,
        ),
      ],
    ),
  );
}
