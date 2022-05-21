import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class AddProperty extends StatefulWidget {
  @override
  State<AddProperty> createState() => _AddPropertyState();
}
class _AddPropertyState extends State<AddProperty> {

  CollectionReference property = FirebaseFirestore.instance.collection('property');
  final databaseRef = FirebaseFirestore.instance;
  String? Title;
  String? Details;
  String? Location;
  String? Bedroom;
  String? Bathroom;
  String? Area;
  String? PhoneNumber;
  String? Price;

  @override
  void initState()   {
    // TODO: implement initState
    super.initState();
    CollectionReference reference = FirebaseFirestore.instance.collection("users");

  }


  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              onChanged: (value){
                Title = value;
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
                Details = value;
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
                Bedroom = value ;
              },
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: const InputDecoration(
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
                Bathroom = value ;
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
                Area = value ;
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
                Location = value;
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
                PhoneNumber = value ;
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
                Price = value ;
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
                await property.add({
                  'Title' : Title,
                  'Details' : Details,
                  'Location' : Location,
                  'Bedroom' : Bedroom,
                  'Bathroom' : Bathroom,
                  'Area' : Area,
                  'PhoneNumber' : PhoneNumber,
                  'Price' : Price,
                }).then((value) => print("Property Added")).catchError((error) => print("Faild : $error"));
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
