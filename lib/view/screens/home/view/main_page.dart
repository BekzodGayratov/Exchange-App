import 'package:flutter/material.dart';
import 'package:music/core/config/theme.dart';
import 'package:music/data/service/global/get_service.dart';
import 'package:music/view/screens/home/view/home_page.dart';
import 'package:music/view/widgets/headline_one_text_widget.dart';
import 'package:music/view/widgets/standart_padding_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _HomePageState();
}

class _HomePageState extends State<MainPage> {
  int _currentIndex = 0;
  List<Widget> _screens = [HomePage(), Scaffold()];
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: ThemeConfig.cartColor,
              title: Text("John Doe"),
            ),
            body: StandartPadding(child: _screens[_currentIndex]),
            bottomNavigationBar: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                backgroundColor: ThemeConfig.cartColor,
                selectedItemColor: Colors.white,
                unselectedItemColor: ThemeConfig.light.scaffoldBackgroundColor,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Asosiy"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.currency_exchange_outlined),
                      label: "Ayirboshlash"),
                ],
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
