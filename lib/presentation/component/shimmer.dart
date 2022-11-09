import 'package:chairil/core/app/app.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {    // getting the size of the window
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Shimmer.fromColors(
      period: const Duration(milliseconds: Constant.durationShimmer),
      highlightColor: ColorPalette.white,
      baseColor: ColorPalette.grey200,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext builder, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: width * 0.3,
            width: width,
            color: ColorPalette.grey200,
          );
        }
      ),
    );
  }
}