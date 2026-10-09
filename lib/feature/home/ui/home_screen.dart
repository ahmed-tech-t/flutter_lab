import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/home/domain/model/home_item_model.dart';
import 'package:flutter_application_1/feature/home/ui/widgets/home_item.dart';
import 'package:flutter_application_1/screens/navigation/app_routes.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';


class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: GridView.builder(itemCount: homeItems.length,
     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,       // 2 items per row
            crossAxisSpacing: 16,    // Horizontal space between items
            mainAxisSpacing: 16,     // Vertical space between items
            childAspectRatio: 1.0,   // Aspect ratio (1.0 = square)
          ),
    
    itemBuilder: (context, index) {
       final item = homeItems[index];
            return HomeItem(
              item: item,
              onPressed: () {
               Get.toNamed(item.distnation);
              });
    
    }
    )
  );
  }

}