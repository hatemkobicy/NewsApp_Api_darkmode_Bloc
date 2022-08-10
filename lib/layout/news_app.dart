// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/models/Components/componont.dart';
import '../Cubit/cubit.dart';
import '../Cubit/states.dart';
import '../modules/search/search_screen.dart';
import '../newcubit/ncubit.dart';

class Newshome extends StatelessWidget {
  const Newshome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, SearchScreen());
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    Nappcubit.get(context).changethememode();
                    print('object');
                  },
                  icon: Icon(Icons.brightness_4_outlined)),
            ],
          ),
          body: cubit.screens[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            items: cubit.bottomItems,
            currentIndex: cubit.currentindex,
          ),
        );
      },
    );
  }
}
