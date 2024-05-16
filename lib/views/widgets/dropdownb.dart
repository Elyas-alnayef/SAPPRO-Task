import 'package:flutter/material.dart';

import '../../const/colors.dart';
Widget dropdown({
  required String hint,
  required List<DropdownMenuItem> items,
  required Function(String) function,
}) =>
    Container(
      padding: EdgeInsets.all(8),
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Appcolor.subtitl)),
      child: DropdownButton(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        isExpanded: true,
        hint: Text("$hint"),
        items: items,
        onChanged: (value) {
          function(value);
        },
        value: null,
      ),
    );
