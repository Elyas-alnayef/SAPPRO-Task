import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/const/colors.dart';
import 'package:task/cubit/network_cubit.dart';
import 'package:task/cubit/user_cubit.dart';
import 'package:task/views/widgets/dropdownb.dart';
import 'package:task/views/widgets/usercard.dart';
import '../cubit/search_cubit_cubit.dart';
import 'widgets/button.dart';
import 'widgets/searchresultdialog.dart';
import 'widgets/textfield.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Users",
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Appcolor.primary2),
        ),
        actions: [
          BlocBuilder<NetworkCubit, NetworkState>(
            builder: (context, state) {
              if (state is Connected) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.wifi,
                    color: Appcolor.primary2,
                    size: 20,
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.wifi_off_outlined,
                    color: Appcolor.primary2,
                    size: 20,
                  ),
                );
              }
            },
          )
        ],
        centerTitle: true,
        backgroundColor: Appcolor.buttoncolor,
        toolbarHeight: 40,
      ),
      floatingActionButton: IconButton(
          padding: EdgeInsets.all(16),
          tooltip: "search",
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  titlePadding: EdgeInsets.all(0),
                  insetPadding: EdgeInsets.all(0),
                  contentPadding: EdgeInsets.all(0),
                  title: Container(
                    decoration: BoxDecoration(
                        color: Appcolor.buttoncolor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      "Search",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Find the user using his first name or \nlats name",
                            textAlign: TextAlign.center,
                          ),
                          mytextfield(
                              hint: "Enter first name or last name",
                              controller: controller),
                          SizedBox(
                            height: 16,
                          ),
                          dropdown(
                              hint: "Filters",
                              items: [
                                DropdownMenuItem(
                                  child: Text("Age"),
                                  value: "1",
                                ),
                                DropdownMenuItem(
                                  child: Text("Gender"),
                                  value: "2",
                                ),
                                DropdownMenuItem(
                                  child: Text("Birth Date"),
                                  value: "3",
                                ),
                              ].toList(),
                              function: (value) {
                                print(value.toString());
                                return value;
                              }),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: bigbutton(
                                      name: "Get",
                                      function: () {
                                        context
                                            .read<SearchCubitCubit>()
                                            .searchwithoutfilters(
                                                controller.text.trim());

                                        showDialog(
                                          context: context,
                                          builder: (context) => BlocBuilder<
                                              SearchCubitCubit,
                                              SearchCubitState>(
                                            builder: (context, state) {
                                              return showresultDialog(
                                                  context: context,
                                                  state: state);
                                            },
                                          ),
                                        );
                                      })),
                              SizedBox(
                                width: 24,
                              ),
                              Expanded(
                                  child: bigbutton(
                                      name: "Cancle",
                                      function: () {
                                        Navigator.of(context).pop();
                                      })),
                            ],
                          ),
                        ]),
                  ),
                );
              },
            );
          },
          icon: Icon(Icons.search),
          color: Appcolor.primary2,
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Appcolor.buttoncolor))),
      body: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
          child: BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              if (state is Successgetstate) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return usercard(
                        name: state.hiveusers[index].name,
                        lastname: state.hiveusers[index].lastName,
                        age: state.hiveusers[index].age.toString(),
                        gender: state.hiveusers[index].gender,
                        birthdate: state.hiveusers[index].birthDate,
                        imageurl: state.hiveusers[index].image,
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: state.hiveusers.length);
              } else if (state is Errorstate) {
                return Center(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Appcolor.alerts),
                        boxShadow: [
                          BoxShadow(
                              color: const Color.fromARGB(255, 70, 226, 200),
                              offset: Offset(1, 1))
                        ]),
                    height: 180,
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
                          "there is no data to load \n close the app turn on your \nwifi  then try agin",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                );
              }
              return Container();
            },
          )),
    );
  }
}
