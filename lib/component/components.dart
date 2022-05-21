import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:gam3a/login/arqalogin.dart';

import '../cubit/cubit.dart';
import '../network/cache-helper.dart';

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
void navigateAndFinish(context,widget)=> Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) =>  widget,
    ),
        (route) => false
);

Widget defaultFormField({

  TextEditingController? controller,
  dynamic label,
  IconData ? prefix,
  String ? initialValue,
  TextInputType ?keyboardType,
  Function? onSubmit,
  onChange,
  onTap,
  required String? Function(String?) validate,
  bool isPassword = false,
  bool enabled = true,
  IconData ?suffix,
  suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      textAlign: TextAlign.start,
      onFieldSubmitted: (value) {
        onSubmit!(value);
      },
      enabled: enabled,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      textCapitalization: TextCapitalization.words,
      textAlignVertical: TextAlignVertical.center,
      initialValue:initialValue ,
      //textCapitalization: TextCapitalization.words,

      decoration: InputDecoration(
        hintText: label,
        border:UnderlineInputBorder(),
        prefixIcon: Icon(prefix,),
        suffixIcon: suffix != null ? IconButton(onPressed: suffixPressed, icon: Icon(suffix)) : null,

      ),
    );
Widget defaultTextButton({
  required Function function,
  required String text,
})=>TextButton(
  onPressed :()=> function(),
  child:Text(
      text.toUpperCase()),);

Widget defaultButton({

  double r = 30.0,
  required String text,
  bool isUpper = true,
  Color back = Colors.blue,
  required Function function,
}) =>
    Container(
      width: 200,
      decoration: BoxDecoration(
        color: back,
        borderRadius: BorderRadius.circular(
          r,
        ),
      ),
      child: FlatButton(
        onPressed: ()=> function(),
        child: Text(
          isUpper ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );





Widget myDivider()=> Padding(
  padding: const EdgeInsetsDirectional.only(start: 20),
  child: Container(
    width: double.infinity ,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

void printFullText( String text){
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match)=>print(match.group(0)));
}

void signOut(context){
  CacheHelper.removeData('uId').then((value)
  {
    if(value){
      navigateAndFinish(context, ARQALogin(),);
    }
  });
}
String? uId = ' ';

Widget tasksBuilder(
    {
      required List<Map> tasks,
    })=> ConditionalBuilder(
  condition: tasks.length>0,
  builder: (context)=>ListView.separated(
      itemBuilder: (context, index ) => buildTaskItem(tasks[index],context  ),
      separatorBuilder: (context,index)=> Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey[300],
        ),
      ),
      itemCount: tasks.length),
  fallback: (context)=>Center(
    child: Column
      (
      mainAxisAlignment: MainAxisAlignment.center,

      children:
      [
        Icon(
          Icons.menu,
          size: 100,
          color: Colors.grey,
        ),
        Text('No Tasks Yet , Please Add Some Tasks',
          style: TextStyle
            (
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),

      ],
    ),
  ),
);

Widget buildTaskItem(Map  model,context) => Dismissible(
  key: Key(model['id'].toString()),
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        CircleAvatar(

          radius: 40.0,

          child: Text('${model['time']}'),

        ),

        SizedBox(

          width: 20,

        ),

        Expanded(

          child: Column(

            mainAxisSize: MainAxisSize.min,

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text('${model['title']}',

                style: TextStyle(

                  fontSize: 16.0,

                  fontWeight: FontWeight.bold,

                ),),

              Text('${model['date']}',

                style: TextStyle(

                  color: Colors.grey,

                ),),

            ],

          ),

        ),

        SizedBox(

          width: 20,

        ),

      ],

    ),

  ),
);


Widget RecommendCard(Map  model,{required List<Map> tasks,}) => Builder(
    key: Key(model['id'].toString()),
    builder: (context) {
      return     Container(
        width: 200,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.15),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(
                height: 120,
                width: double.infinity,
                image: AssetImage('images/office.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF3072BA),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                "FOR SALE",
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              '${model['title']}',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "${model['Bedroom']} Bedroom - ${model['Area']} Meters ",
              style: Theme.of(context).textTheme.caption!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            // Text(
            //   '${like['Price']}',
            //   style: Theme.of(context).textTheme.subtitle1!.copyWith(
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
          ],
        ),
      );
    }
);
