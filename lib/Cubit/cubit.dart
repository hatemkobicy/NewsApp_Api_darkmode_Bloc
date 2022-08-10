// ignore_for_file: prefer_const_constructors, duplicate_ignore, avoid_print, unnecessary_import, unnecessary_string_interpolations, unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modules/business/business_screen.dart';
import '../modules/entertainment/entertainment_screen.dart';
import '../modules/science/science_screen.dart';
import '../modules/sports/sports_screen.dart';
import '../modules/technology/technology_screen.dart';
import '../network/Remote/dio_helper.dart';
import 'states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialstate());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentindex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business_rounded),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_soccer_rounded),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science_rounded),
      label: 'Scinces',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.movie_filter_rounded),
      label: 'Entertainment',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings_outlined),
      label: 'Technology',
    )
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    EntertainmentScreen(),
    TechnologyScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentindex = index;
    emit(NewsBottmnavbarstates());
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessloadingtates());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'dccd2597ca844bab933cd2afaca5ef8d',
      },
    ).then((value) {
      //print(value?.data.toString());
      business = value?.data['articles'];
      print(business[0]['title']);

      emit(NewsGetBusinessSuccessstates());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinesserrortates(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSport() {
    emit(NewsGetSportloadingtates());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': 'dccd2597ca844bab933cd2afaca5ef8d',
      },
    ).then((value) {
      //print(value?.data.toString());
      sports = value?.data['articles'];
      print(business[0]['title']);

      emit(NewsGetSportSuccessstates());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSporterrortates(error.toString()));
    });
  }

  List<dynamic> science = [];
  void getscience() {
    emit(NewsGetscienceloadingtates());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': 'dccd2597ca844bab933cd2afaca5ef8d',
      },
    ).then((value) {
      //print(value?.data.toString());
      science = value?.data['articles'];
      print(business[0]['title']);

      emit(NewsGetscienceSuccessstates());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetscienceerrortates(error.toString()));
    });
  }

  List<dynamic> entertainment = [];
  void getentertainment() {
    emit(NewsGetentertainmentloadingtates());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'entertainment',
        'apiKey': 'dccd2597ca844bab933cd2afaca5ef8d',
      },
    ).then((value) {
      //print(value?.data.toString());
      entertainment = value?.data['articles'];
      print(business[0]['title']);

      emit(NewsGetentertainmentSuccessstates());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetentertainmenterrortates(error.toString()));
    });
  }

  List<dynamic> technology = [];
  void gettechnology() {
    emit(NewsGettechnologyloadingtates());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'technology',
        'apiKey': 'dccd2597ca844bab933cd2afaca5ef8d',
      },
    ).then((value) {
      //print(value?.data.toString());
      technology = value?.data['articles'];
      print(business[0]['title']);

      emit(NewsGettechnologySuccessstates());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGettechnologyerrortates(error.toString()));
    });
  }

  List<dynamic>? search = [];
  void getSearch(value) {
    emit(NewsGetsearchloadingtates());

    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': 'dccd2597ca844bab933cd2afaca5ef8d',
      },
    ).then((value) {
      //print(value?.data.toString());
      dynamic search = value?.data['articles'];

      emit(NewsGetsearchSuccessstates());
    }).catchError((error) {
      print(error?.toString());
      emit(NewsGetsearcherrortates(error.toString()));
    });
  }
}
