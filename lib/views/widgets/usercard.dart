import 'package:flutter/material.dart';

import '../../const/colors.dart';

double iconsize = 20;
double fontsize = 16;
Widget usercard({
  required String name,
  required String lastname,
  required String age,
  required String gender,
  required String birthdate,
  required String imageurl,
  required bool imagestate,
}) =>
    Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Appcolor.alerts),
          boxShadow: [
            BoxShadow(
                color: const Color.fromARGB(255, 70, 226, 200),
                offset: Offset(1, 1))
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      color: Appcolor.buttoncolor,
                    ),
                    height: 30,
                    alignment: Alignment.center,
                    child: Text(
                      '$name',
                      style: TextStyle(
                          color: Appcolor.primary2,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          " Last name :",
                          style: TextStyle(
                              fontSize: fontsize, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "$lastname",
                          style: TextStyle(fontSize: fontsize),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Icon(
                          Icons.calendar_month_sharp,
                          size: iconsize,
                        ),
                        Text(
                          "$age",
                          style: TextStyle(
                              fontSize: fontsize, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          gender == 'male'
                              ? Icons.male_sharp
                              : Icons.female_sharp,
                          size: fontsize,
                        ),
                        Text(
                          "$gender",
                          style: TextStyle(
                              fontSize: fontsize, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Icon(
                          Icons.event,
                          size: 24,
                        ),
                        Text(
                          "$birthdate",
                          style: TextStyle(
                              fontSize: fontsize, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    imagestate
                        ? Image.network(
                            imageurl,
                            width: 100,
                            height: 100,
                          )
                        : Container(
                            height: 100,
                            width: 100,
                            child: Icon(
                              Icons.person,
                              size: 75,
                            ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
