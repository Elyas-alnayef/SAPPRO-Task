import 'package:flutter/material.dart';
import 'package:task/views/widgets/button.dart';

import '../../const/colors.dart';
import '../../cubit/search_cubit_cubit.dart';

Widget showresultDialog(
    {required SearchCubitState state, required BuildContext context}) {
  if (state is SearchCubitExistState) {
    return AlertDialog(
      titlePadding: EdgeInsets.all(0),
      contentPadding: EdgeInsets.all(8),
      title: Container(
        decoration: BoxDecoration(
            color: Appcolor.buttoncolor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          "Search result",
          style: TextStyle(color: Colors.white),
        ),
      ),
      content: Container(
        alignment: Alignment.centerLeft,
        height: 200, // Adjusted height for better visibility
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: ListView.separated(
          itemCount: state.hiveusers.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                Expanded(
                  child: Text(
                    state.hiveusers[index].name,
                    style: TextStyle(color: Colors.black38, fontSize: 16),
                  ),
                ),
                Expanded(
                  child: Text(
                    state.hiveusers[index].lastName,
                    style: TextStyle(color: Colors.black38, fontSize: 16),
                  ),
                ),
                Expanded(
                  child: Text(
                    state.hiveusers[index].age.toString(),
                    style: TextStyle(color: Colors.black38, fontSize: 16),
                  ),
                ),
                Icon(Icons.person),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 16);
          },
        ),
      ),
      actions: [
        Container(
          padding: EdgeInsets.only(top: 16),
          width: double.infinity,
          child: bigbutton(
              name: 'close',
              function: () {
                Navigator.of(context).pop();
              }),
        )
      ],
    );
  } else {
    return AlertDialog(
      titlePadding: EdgeInsets.all(0),
      contentPadding: EdgeInsets.all(8),
      title: Container(
        decoration: BoxDecoration(
            color: Appcolor.buttoncolor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          "Search result",
          style: TextStyle(color: Colors.white),
        ),
      ),
      content: Container(
          alignment: Alignment.centerLeft,
          height: 200, // Adjusted height for better visibility
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Center(
            child: Column(
              children: [
                Icon(
                  Icons.warning,
                  color: Colors.red,
                  size: 40,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "User not found",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )),
      actions: [
        Container(
          padding: EdgeInsets.only(top: 16),
          width: double.infinity,
          child: bigbutton(
              name: 'close',
              function: () {
                Navigator.of(context).pop();
              }),
        )
      ],
    );
  }
}
