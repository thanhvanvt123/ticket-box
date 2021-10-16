import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ticket_box/src/models/account.dart';
import 'package:ticket_box/src/services/global_states/shared_states.dart';


class HomeController extends GetxController {
  SharedStates states = Get.find();
  final showSlider = true.obs;
  final buildingId = 0.obs;
  final buildingName = "".obs;
  final listAccount = [Account].obs;
  final buildings = [].obs;

  @override
  void onInit() {
    super.onInit();

  }



}

// final categories = [
//   ProductCategory(name: 'Cà phê', imageUrl: 'assets/images/icon_coffee.png'),
//   ProductCategory(name: 'Trà sữa', imageUrl: 'assets/images/icon_milktea.png'),
//   ProductCategory(name: 'Mua sắm', imageUrl: 'assets/images/icon_shopping.png'),
//   ProductCategory(
//       name: 'Nhà hàng', imageUrl: 'assets/images/icon_restaurant.png'),
//   ProductCategory(name: 'Xem phim', imageUrl: 'assets/images/icon_cinema.png'),
// ];
