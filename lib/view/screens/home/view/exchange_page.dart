import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/core/config/theme.dart';
import 'package:music/data/service/local/local_db_service.dart';
import 'package:music/view/screens/home/cubit/exchange_cubit.dart';
import 'package:music/view/screens/home/cubit/exchange_state.dart';
import 'package:music/view/widgets/hide_underline_drop_down_widget.dart';

class ExchangeApp extends StatelessWidget {
  const ExchangeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExchangeCubit, ExchangeState>(
        builder: (context, state) => _exchangeView(context));
  }

  Column _exchangeView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          flex: 1,
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              "Ayirboshlash",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ),
        Expanded(
            flex: 9,
            child: Container(
              decoration: BoxDecoration(
                  color: ThemeConfig.cartColor,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HideUnderlineDropDownWidget(
                          child: DropdownButton(
                              dropdownColor: ThemeConfig.cartColor,
                              style: const TextStyle(color: Colors.white),
                              value: "USD",
                              items: List.generate(
                                  LocalDBServce.currencyBox.length, (index) {
                                return DropdownMenuItem(
                                    value: LocalDBServce.currencyBox
                                        .getAt(index)!
                                        .code,
                                    child: Text(LocalDBServce.currencyBox
                                        .getAt(index)!
                                        .code
                                        .toString()));
                              }),
                              onChanged: (v) {})),
                      HideUnderlineDropDownWidget(
                          child: DropdownButton(
                              dropdownColor: ThemeConfig.cartColor,
                              style: const TextStyle(color: Colors.white),
                              value: "AED",
                              items: List.generate(
                                  LocalDBServce.currencyBox.length, (index) {
                                return DropdownMenuItem(
                                    value: LocalDBServce.currencyBox
                                        .getAt(index)!
                                        .code,
                                    child: Text(LocalDBServce.currencyBox
                                        .getAt(index)!
                                        .code
                                        .toString()));
                              }),
                              onChanged: (v) {}))
                    ],
                  ),
                ],
              ),
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
      ],
    );
  }
}
