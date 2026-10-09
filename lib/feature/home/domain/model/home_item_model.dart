// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/navigation/app_routes.dart';

class HomeItemModel {
  final IconData icon;
  final String title;
  final String distnation;

  HomeItemModel({
    required this.icon,
    required this.title,
    required this.distnation
  });
  
}

List<HomeItemModel> homeItems =List.from([
    HomeItemModel(icon: Icons.calculate,title: "Counter",distnation: AppRoutes.COUNTER),
    HomeItemModel(icon: Icons.calendar_today,title: "Todo",distnation:AppRoutes.TODO),
    ]);
