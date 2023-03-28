
import 'package:flutter/material.dart';

import '../utils/appText.dart';


// All Application Change Text Style
// Single line code change
class CustomText extends StatelessWidget {
  String text;
  FontWeight? fontWeight;
  double? fontSize;
  Color?  color;
   CustomText({Key? key,required this.text,this.color,this.fontSize,this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontWeight: fontWeight,color:color,fontSize: fontSize ),);
  }
}
