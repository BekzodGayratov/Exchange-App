import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HideUnderlineDropDownWidget extends StatelessWidget {
  final DropdownButton child;
  const HideUnderlineDropDownWidget({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(child: child);
  }
}
