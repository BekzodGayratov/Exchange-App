import 'package:bloc/bloc.dart';
import 'package:music/view/screens/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitalState());
}
