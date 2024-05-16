import 'package:flutter/material.dart';

import '../../const/colors.dart';

Widget bigbutton({required String name, required Function function}) =>
    Container(
      height: 48,
      child: TextButton(
        onPressed: () {
          function();
        },
        child: Text(
          "$name",
          style: TextStyle(color: Appcolor.primary2),
        ),
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Appcolor.buttoncolor)),
      ),
    );
