import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gam3a/model/details_page.dart';
import '../component/components.dart';
import '../home/home.dart';
import '../homescreen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class RealEstateRegisterScreen extends StatelessWidget {
  var formKey=GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>RealEstateRegisterCubit(),
      child: BlocConsumer<RealEstateRegisterCubit,RealEstateRegisterStates>(
        listener: (context, state) {
          if (state is RealEstateCreateUserSuccessState)
          {
            navigateAndFinish(context, HomeScreen());
          }
        },
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.black),
                        ),
                        SizedBox(
                          height: 15.0,),
                        Text(
                          'REGISTER Now To Browse Our Hot Offers',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(color:Colors.grey),
                        ),
                        SizedBox(
                          height: 15.0,),
                        defaultFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          validate: ( value)
                          {
                            if(value!.isEmpty)
                            {
                              return'Please Enter Your NAME';
                            }
                          },
                          label: 'USER NAME',
                          prefix: Icons.person,
                        ),
                        SizedBox(
                          height: 15.0,),
                        defaultFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validate: ( value)
                          {
                            if(value!.isEmpty)
                            {
                              return'Please Enter Your EMAIL';
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email,
                        ),
                        SizedBox(
                          height: 15.0,),
                        defaultFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          suffix: RealEstateRegisterCubit.get(context).suffix,
                          isPassword: RealEstateRegisterCubit.get(context).isPassWord,
                          suffixPressed: (){
                            RealEstateRegisterCubit.get(context).changePassWordVisibility();
                          },
                          onSubmit: (value)
                          {

                          },
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
                        SizedBox(
                          height: 15.0,),
                        defaultFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validate: ( String ?value)
                          {
                            if(value!.isEmpty)
                            {
                              return'Please Enter Your PHONE';
                            }
                          },
                          label: 'Phone Number',
                          prefix: Icons.phone,
                        ),

                        SizedBox(height: 30.0,),
                        Center(
                          child: ConditionalBuilder(
                            condition: state is! RealEstateRegisterLoadingState,
                            builder: (context)=> defaultButton(
                              text: 'REGISTER',
                              function: (){
                                if(formKey.currentState!.validate()){
                                  RealEstateRegisterCubit.get(context).userRegister(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  phone:phoneController.text ,);
                                };
                              },),
                            fallback:(context)=>Center(child: CircularProgressIndicator()) ,
                          ),
                        ),
                      ],
                    ),
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
