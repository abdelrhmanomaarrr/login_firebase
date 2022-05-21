
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../component/components.dart';
import '../homescreen.dart';
import '../network/cache-helper.dart';
import '../register/register-screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ARQALogin extends StatelessWidget {
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context)
  {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context)=> RealEstateLoginCubit(),
      child: BlocConsumer<RealEstateLoginCubit,RealEstateLoginStates>(
        listener: (context, state) {
          if(state is RealEstateLoginSuccessState)
          {
          CacheHelper.saveData(
          key: 'uId',
          value:state.uId,
          ).then((value)
          {
          navigateAndFinish(context, HomeScreen());
          });
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LOGIN',
                        style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        height: 15.0,),
                      Text(
                        'Login Now To Buy House',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(color:Colors.grey),
                      ),
                      SizedBox(
                        height: 15.0,),
                      defaultFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validate: (value)
                        {
                          if(value!.isEmpty)
                          {
                            return'Please Enter Your EmailAddress';
                          }
                        },
                        label: 'Email Address',
                        prefix: Icons.email_outlined,
                      ),
                      SizedBox(
                        height: 15.0,),
                      defaultFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        suffix: RealEstateLoginCubit.get(context).suffix,
                        isPassword: RealEstateLoginCubit.get(context).isPassWord,
                        suffixPressed: (){
                          RealEstateLoginCubit.get(context).changePassWordVisibility();
                        },
                        onSubmit: (value){
                          if(formKey.currentState!.validate()){
                            RealEstateLoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passwordController.text,);
                          };},
                        validate: ( value)
                        {
                          if(value!.isEmpty)
                          {
                            return'Password Too Short';
                          }
                        },
                        label: 'PassWord',
                        prefix: Icons.lock,
                      ),
                      SizedBox(height: 30.0,),
                      Center(
                        child: ConditionalBuilder(
                          condition: state is! RealEstateLoginLoadingState,
                          builder: (context)=> defaultButton(
                            text: 'LOGIN',
                            function: (){
                              if(formKey.currentState!.validate()){
                                RealEstateLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,);
                              };
                            },),
                          fallback:(context)=>Center(child: CircularProgressIndicator()) ,
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t Have An Account ?'),
                          defaultTextButton(function: (){
                            navigateTo(context, RealEstateRegisterScreen());
                          },
                            text: 'Register',),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        ),
      );
  }
}
