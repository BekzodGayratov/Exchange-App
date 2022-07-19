import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:music/core/config/size_config.dart';
import 'package:music/core/config/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: ListView.builder(itemBuilder: (context, index) {
          return Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
            height: MediaQuery.of(context).size.height * 0.15,
            width: double.infinity,
            decoration: BoxDecoration(
                color: ThemeConfig.cartColor,
                borderRadius: BorderRadius.circular(10.0)),
          );
        }))
      ],
    );
  }
}
