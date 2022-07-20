import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/core/config/theme.dart';
import 'package:music/data/service/local/local_db_service.dart';
import 'package:music/view/screens/home/cubit/home_cubit.dart';
import 'package:music/view/widgets/headline_one_text_widget.dart';
import 'package:music/view/widgets/headline_two_text_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<HomeCubit>().getCurrency(),
        builder: (context, AsyncSnapshot snapshot) {
          if (LocalDBServce.currencyBox.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data == "internet") {
            return const Center(
              child: Text("Please connect to internet"),
            );
          } else if (snapshot.data == "timeout") {
            return const Center(
              child: Text("Time out error"),
            );
          } else {
            var data = LocalDBServce.currencyBox;
            return RefreshIndicator(
              onRefresh: context.read<HomeCubit>().getCurrency,
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.03),
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: ThemeConfig.cartColor,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.015),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    HeadlineOneTextWidget(
                                        child: data.getAt(index)!.title ??
                                            "Noma'lum"),
                                    HeadlineOneTextWidget(
                                        child: data.getAt(index)!.cbPrice ==
                                                null
                                            ? "Noma'lum"
                                            : "${data.getAt(index)!.cbPrice!} sum"),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const HeadlineTwoTextWidget(child: "Kod: "),
                                    HeadlineTwoTextWidget(
                                        child: data.getAt(index)!.code ??
                                            "Noma'lum"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const HeadlineTwoTextWidget(
                                        child: "Sotib olish narxi: "),
                                    HeadlineTwoTextWidget(
                                        child:
                                            "${data.getAt(index)!.nbuBuyPrice ?? "Noma'lum"} sum"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const HeadlineTwoTextWidget(
                                        child: "Sotish narxi: "),
                                    HeadlineTwoTextWidget(
                                        child: data
                                                    .getAt(index)!
                                                    .nbuCellPrice ==
                                                null
                                            ? "Noma'lum"
                                            : "${data.getAt(index)!.nbuCellPrice} sum"),
                                  ],
                                ),
                              ],
                            ),
                          ));
                    },
                    itemCount: LocalDBServce.currencyBox.length,
                  ))
                ],
              ),
            );
          }
        });
  }
}
