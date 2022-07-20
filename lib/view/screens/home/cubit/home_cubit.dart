import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:music/data/model/currency_model.dart';
import 'package:music/data/service/global/get_service.dart';
import 'package:music/data/service/local/local_db_service.dart';
import 'package:music/view/screens/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitalState());

  Future getCurrency() async {
    dynamic response;

    // API BASE URLS IMPORTED FROM .ENV VARIABLES
    await GetService.getData(dotenv.env['CURRENCY_API']!).then((value) async {
      if (value.runtimeType == Response) {
        // CONVERT RESPONSE OF DATA TO MODEL TYPE
        var resData = ((value as Response).data as List)
            .map((e) => CurrencyModel.fromJson(e))
            .toList();
        await LocalDBServce.putCurrencyToBox(data: resData);
        response = true;
        return response;
      } else {
        response = value;
        return response;
      }
    });
    return response;
  }
}
