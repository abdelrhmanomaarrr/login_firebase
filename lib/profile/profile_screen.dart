import 'package:flutter/material.dart';

import '../component/components.dart';

class ProfileScreen extends StatelessWidget {
  var formKey=GlobalKey<FormState>();
  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var phoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
            //LinearProgressIndicator(),
          SizedBox(height: 30,),
          Text('PROFILE',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),),
          SizedBox(height: 30,),
          defaultFormField(
            controller: nameController,
            validate: (String? value)
            {
              if(value!.isEmpty) {
                return'name must not be empty';
              }
              return null;
            } ,
            keyboardType: TextInputType.name,
            label:'Name' ,
            prefix: Icons.person,
          ),
          SizedBox(height: 30,),
          defaultFormField(
            controller: emailController,
            validate: (String? value)
            {
              if(value!.isEmpty) {
                return'email must not be empty';
              }
              return null;
            } ,
            keyboardType: TextInputType.emailAddress,
            label:'Email' ,
            prefix: Icons.email,
          ),
          SizedBox(height: 30,),
          defaultFormField(
            controller: phoneController,
            validate: (String? value)
            {
              if(value!.isEmpty) {
                return'phone must not be empty';
              }
              return null;
            } ,
            keyboardType: TextInputType.phone,
            label:'Phone Number' ,
            prefix: Icons.phone,
          ),
          SizedBox(height: 30,),
          defaultButton(
              text: 'UPDATE',
              function: (){
                if(formKey.currentState!.validate())
                {

                }
              }),
          SizedBox(height: 20,),
          defaultButton(
              text: 'LOGOUT',
              function: (){
                signOut;
              }),
        ],
      ),
    );
  }
}
