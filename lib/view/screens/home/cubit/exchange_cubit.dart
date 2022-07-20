import 'package:bloc/bloc.dart';
import 'package:music/view/screens/home/cubit/exchange_state.dart';

class ExchangeCubit extends Cubit<ExchangeState> {
  ExchangeCubit() : super(ExchangeInitialState());
}
