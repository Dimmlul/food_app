import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/common/app_style.dart';
import 'package:food_app/common/back_ground_container.dart';
import 'package:food_app/common/reusable_text.dart';
import 'package:food_app/constants/constants.dart';
import 'package:food_app/constants/uidata.dart';
import 'package:food_app/views/home/widgets/restuarant_tile.dart';

class AllNearbyRestaurants extends StatelessWidget {
  const AllNearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondary,
     appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        title: ReusableText(text: "Nearby Restaurants", 
        style: appStyle(13, kLightWhite, FontWeight.w600)),
      ),
      body: BackGroundContainer(
         color: Colors.white,
        child: Padding(
          padding:  EdgeInsets.all(12.h),
          child: ListView(
          children: List.generate(restaurants.length, (i) {
            var restaurant = restaurants[i];
            return RestaurantTile(restaurant: restaurant,);
          }),
              ),
        ),),
    );
  }
}