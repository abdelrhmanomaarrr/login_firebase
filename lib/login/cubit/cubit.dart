import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gam3a/login/cubit/states.dart';


class RealEstateLoginCubit extends Cubit<RealEstateLoginStates>
{
  RealEstateLoginCubit() : super(RealEstateLoginInitialState());

  static RealEstateLoginCubit get(context) => BlocProvider.of(context);


  void userLogin(
  {
  required String email,
  required String password,
})
  {
    emit(RealEstateLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value)
    {
      print(value.user?.email);
      print(value.user?.uid);
      emit(RealEstateLoginSuccessState(value.user!.uid));
    }).catchError((error){
      emit(RealEstateLoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassWord=true;
  void changePassWordVisibility()
  {
    isPassWord =! isPassWord;
    suffix = isPassWord ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RealEstateChangePassWordVisibilityState());
  }

}