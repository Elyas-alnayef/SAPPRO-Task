import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/cubit/user_cubit.dart';

class Resuser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter page "),
      ),
      body: Column(children: [
        Expanded(
          child: Container(
            child: BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                if (state is Successgetstate) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 150,
                          child: Row(
                            children: [
                              Text(state.hiveusers[1].name),
                              state.internetstate
                                  ? Image.network(
                                      state.hiveusers[1].image,
                                      width: 50,
                                      height: 50,
                                    )
                                  : Container(
                                      width: 50,
                                      height: 50,
                                      child:
                                          Text(state.internetstate.toString()),
                                    )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                      itemCount: 10);
                }
                return Container();
              },
            ),
          ),
        )
      ]),
    );
  }
}



    // const newImagePath =
    //     '/data/user/0/com.example.task/app_flutter/users_images/image.png';