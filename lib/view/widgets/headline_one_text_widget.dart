import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class HeadlineOneTextWidget extends StatelessWidget {
  final String child;
  const HeadlineOneTextWidget({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(child,style: const TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600,color: Colors.white),);
  }
}
