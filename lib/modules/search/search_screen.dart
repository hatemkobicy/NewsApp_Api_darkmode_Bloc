// ignore_for_file: use_key_in_widget_constructors, unnecessary_question_mark, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Cubit/cubit.dart';
import '../../Cubit/states.dart';
import '../../models/Components/componont.dart';

class SearchScreen extends StatelessWidget {
  final searchControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        dynamic? listart = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: defualtformfaild(
                    conttroler: searchControler,
                    preicon: Icons.search_rounded,
                    title: 'Search',
                    onchanged: (dynamic? value) {
                      NewsCubit.get(context).getSearch(value!);
                    },
                    type: TextInputType.text,
                    valedit: (String? value) {
                      if (value!.isEmpty) {
                        return 'search must not be empty';
                      }
                      return null;
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}
