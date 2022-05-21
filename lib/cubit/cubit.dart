import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gam3a/addproperty/addproperty.dart';
import 'package:gam3a/cubit/states.dart';
import 'package:sqflite/sqflite.dart';
import '../addpost/add_post.dart';
import '../favourites/favourites_Screen.dart';
import '../home/home.dart';

import '../profile/profile_screen.dart';

class RealEstateCubit extends Cubit<RealEstateStates>
{
  RealEstateCubit() : super(RealEstateInitialState());


  static RealEstateCubit get(context) => BlocProvider.of(context);
  int currentIndex =0;
  List<Widget>bottomScreens=[
    Home(),
    FavouritesScreen(),
    AddProperty(),
    ProfileScreen(),
  ];
  void ChangeBottom(int index){
    currentIndex=index;
    emit(RealEstateChangeBottomNavState());
  }
  //================
  Database? database;
  List<Map>newtasks = [] ;
  List<Map>donetasks = [] ;
  List<Map>archivetasks = [] ;

  void createDatabase()
  {

    openDatabase(
        'todo.db',
        version: 1,
        onCreate:(database,version)
        {
          print('Create DataBase');
          database.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT ,date TEXT, time TEXT, status   )')
              .then((value)
          {
            print('Create Table');
          }).catchError((error)
          {
            print('Error when Creating Table${error.toString()}');
          });
        },
        onOpen: (database)
        {
          getDataFromDatabase(database)  ;
          print('DataBase Opened');
        }
    ).then((value)
    {
      database=value;
      emit(AppCreateDataBaseState());
    });
  }

  insertTODatabase
      ({
    required String title,
    required String time,
    required String date,
  })async
  {
    await  database!.transaction((txn)
    async{
      txn.rawInsert('INSERT INTO Tasks ( title, date, time, status) VALUES("$title ","$date","$time","new") '
      ).then((value) {
        print('$value inserted sucsefluy');
        emit(AppInsertDataBaseState());

        getDataFromDatabase(database);
      }).catchError((error){
        print('Error ${error.toString()}');
      });
    });

  }
  void getDataFromDatabase(database)
  {
    newtasks=[];
    donetasks=[];
    archivetasks=[];

    emit(AppGetDataBaseLoadingState());
    database.rawQuery('SELECT * FROM tasks').then((value) {

      value.forEach((element)
      {
        if(element['status']=='new')
          newtasks.add(element);
        else if(element['status']=='done')
          donetasks.add(element);
        else
          archivetasks.add(element);
      });
      emit(AppGetDataBaseState());
    });
  }
}