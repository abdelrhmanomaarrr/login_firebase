import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gam3a/cubit/cubit.dart';
import 'package:gam3a/homescreen.dart';
import 'package:gam3a/network/cache-helper.dart';

import 'login/arqalogin.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await CacheHelper.init();

  Widget startScreen ;

  var uId =CacheHelper.getData(key:'uId');

  if(uId!=null){
    startScreen=HomeScreen();
  }else{
    startScreen=ARQALogin();

  }

  runApp(MyApp(startScreen));
}

class MyApp extends StatelessWidget {
  late final Widget startWidgetScreen ;
  MyApp(this.startWidgetScreen);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context)=>RealEstateCubit()..createDatabase())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: startWidgetScreen,
      ),
    );
  }
}

