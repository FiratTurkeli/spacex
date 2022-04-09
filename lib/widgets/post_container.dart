import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constans/color.dart';
import '../constans/text_style.dart';

class PostContainer extends StatelessWidget {
  final String? name;
  final String? details;
  final String? patch;
  final String? flightNumber;
  final String? dateLocal;
  const PostContainer({Key? key, this.patch, this.details, this.name, this.flightNumber, this.dateLocal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: primary , width: 5) ,
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(name! , style: headerStyle,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Flight number: ${flightNumber!}', style: style1,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(details! , style: style1),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(patch!),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Local date: ${DateFormat("dd/MM/yyyy hh:mm").format(DateTime.parse(dateLocal!),)}', style: style1,),
            ),
          ],
        ),
      ),
    );
  }
}


