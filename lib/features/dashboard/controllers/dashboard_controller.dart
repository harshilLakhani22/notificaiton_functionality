

import 'package:get/get.dart';
import 'package:notification_functionality/features/home/screens/home_screen.dart';

class DashboardController extends GetxController{
  RxInt currIndex = 0.obs;

  void changeTabIndex(int index){
    currIndex.value = index;
  }

  final screens = [
    HomeScreen(),
  ];
}