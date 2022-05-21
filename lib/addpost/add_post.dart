
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gam3a/cubit/cubit.dart';
import 'package:gam3a/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

class Add extends StatelessWidget {
  Database? database;
  var scafoldkey=GlobalKey<ScaffoldState>();
  var formkey=GlobalKey<FormState>();
  var tittleController =  TextEditingController();
  var timeController =  TextEditingController();
  var dateController =  TextEditingController();



  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<RealEstateCubit,RealEstateStates>
        (
        listener: ( context, state){},
        builder: ( context,  state)
      {
        RealEstateCubit cubit = RealEstateCubit.get(context);
        return Scaffold(
        body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        TextFormField(
        onChanged: (value){
          tittleController;

        },
        decoration:  InputDecoration(
        icon: Icon(Icons.title),
        labelText: 'Title',
        hintText: 'Property Title',
        errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 5)),
        ),
        ),
        const SizedBox(
        height: 10,
        ),
        TextFormField(
      onChanged: (value){
        timeController;
      },
      decoration: const InputDecoration(
      icon: Icon(Icons.assignment),
      labelText: 'Details',
      hintText: 'Property Details',
      errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 5)),
      ),
      ),
      const SizedBox(
      height: 10,
      ),
      TextFormField(
      onChanged: (value){
        dateController;
      },
      keyboardType:  TextInputType.numberWithOptions(),
      decoration:  InputDecoration(
      icon: Icon(Icons.bedroom_parent_outlined),
      labelText: 'Bedrooms ',
      errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 5)),
      ),
      ),
      const SizedBox(
      height: 10,
      ),
      TextFormField(
      onChanged: (value){

      },
      keyboardType: const TextInputType.numberWithOptions(),
      decoration: const InputDecoration(
      icon: Icon(Icons.bathroom_outlined),
      labelText: 'Bathrooms',
      errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 5)),
      ),
      ),
      const SizedBox(
      height: 10,
      ),
      TextFormField(
      onChanged: (value){

      },
      keyboardType: const TextInputType.numberWithOptions(),
      decoration: const InputDecoration(
      icon: Icon(Icons.crop_square_outlined),
      labelText: 'Area',
      hintText: 'Property Area',
      errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 5)),
      ),
      ),
      const SizedBox(
      height: 10,
      ),
      TextFormField(
      onChanged: (value){

      },
      decoration: const InputDecoration(
      icon: Icon(Icons.location_on),
      labelText: 'Location',
      hintText: 'Add Address',
      ),
      ),
      const SizedBox(
      height: 10,
      ),
      TextFormField(
      onChanged: (value){

      },
      keyboardType: const TextInputType.numberWithOptions(),
      decoration: const InputDecoration(
      icon: Icon(Icons.phone),
      labelText: 'Phone Number',
      hintText: '01115123763',
      errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 5)),
      ),
      ),
      const SizedBox(
      height: 10,
      ),
      TextFormField(
      onChanged: (value){

      },
      keyboardType: const TextInputType.numberWithOptions(),
      decoration: const InputDecoration(
      icon: Icon(Icons.attach_money_outlined),
      labelText: 'Price',
      hintText: 'property price',
      errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 5)),
      ),
      ),
      const SizedBox(
      height: 10,
      ),
      TextButton(
      style: ButtonStyle(
      foregroundColor:
      MaterialStateProperty.all<Color>(Colors.white),
      backgroundColor:
      MaterialStateProperty.all<Color>(Colors.blue),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30)))),
      onPressed: () async {
        cubit.insertTODatabase(title: tittleController.text, time: timeController.text, date: dateController.text);

      },
      child: Text('Add'),
      ),
      ],
      ),
      );
      }
      );
  }
}
