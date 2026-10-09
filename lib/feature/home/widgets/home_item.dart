import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/common/CElevatedButton.dart';
import 'package:flutter_application_1/feature/home/domain/model/home_item_model.dart';
import 'package:flutter_application_1/utils/ext/responsive_extension.dart';
import 'package:get/get.dart';

class HomeItem extends StatelessWidget{
  final void Function() onPressed;
  final HomeItemModel item;
  const HomeItem({super.key,required this.item,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed:onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(context.wp(28), context.wp(25)),
          backgroundColor: context.theme.colorScheme.onPrimary,
            shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Or BorderRadius.zero
          ),    
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(item.icon,size: context.iconMedium ),
            Text(item.title)
          ],
        ),
      ),
    );
  }

}