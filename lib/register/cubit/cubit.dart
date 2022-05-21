import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gam3a/model/user_model.dart';
import 'package:gam3a/register/cubit/states.dart';


class RealEstateRegisterCubit extends Cubit<RealEstateRegisterStates>
{
  RealEstateRegisterCubit() : super(RealEstateRegisterInitialState());

  static RealEstateRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister(
  {
  required String name,
  required String email,
  required String password,
  required String phone,
})
  {
    emit(RealEstateRegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value)
    {
      print(value.user?.email);
      print(value.user?.uid);
      userCreate(
          name: name,
          email: email,
          phone: phone,
          uId: value.user!.uid,
      );
    }).catchError((error)
    {
      emit(RealEstateRegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,
  })
  {
    UserModel model = UserModel(
        name: name,
        email: email,
        phone: phone,
        uId: uId);
    FirebaseFirestore.instance.collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
          emit(RealEstateCreateUserSuccessState());
    })
        .catchError((error){
      emit(RealEstateCreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassWord=true;
  void changePassWordVisibility()
  {
    isPassWord =! isPassWord;
    suffix = isPassWord ? Icons.visibility_outlined : Icons.visibility_off_outlined;
emit(RealEstateRegisterChangePassWordVisibilityState());
  }

}