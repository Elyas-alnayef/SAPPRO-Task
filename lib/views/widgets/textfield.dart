import 'package:flutter/material.dart';

import '../../const/colors.dart';

Widget mytextfield({
  required String hint,
  required TextEditingController controller,
}) =>
    TextFormField(
      controller: controller,
      decoration: InputDecoration(
          //to make the lable in the app off the textfield always
          // floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,
          hintStyle: TextStyle(color: Appcolor.subtitl, fontSize: 14),
          contentPadding: const EdgeInsets.symmetric(horizontal: 25),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
