import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music/core/config/theme.dart';
import 'package:music/data/service/local/local_db_service.dart';
import 'package:music/routes/router.dart';
import 'package:music/view/screens/home/cubit/home_cubit.dart';

void main() async {
  // External packages initializations
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  LocalDBServce.registerAdapters();
  await LocalDBServce.openBox();
  await GetStorage.init();
  await dotenv.load(fileName: '.env');
  runApp(
      // Initialize BLOC IN MAIN
      MultiBlocProvider(providers: [
    BlocProvider(create: (context) => HomeCubit()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeConfig.light,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.router.onGenerate,
    );
  }
}
