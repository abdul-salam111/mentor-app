import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class ShimmerList extends StatelessWidget {
 ShimmerList(this.count, {super.key});
 int? count=10;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: count,
        itemBuilder: (context, index) {
          return const ShimmerListItem();
        },
      ),
    );
  }
}

class ShimmerListItem extends StatelessWidget {
  const ShimmerListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        period: const Duration(milliseconds: 1000),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[100],
            radius: 30,
          ),
          title: Container(
            width: double.infinity,
            height: 16.0,
            color: Colors.white,
          ),
          subtitle: Container(
            width: double.infinity,
            height: 12.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class AnotherShimmerList extends StatelessWidget {
   AnotherShimmerList(this.count, {super.key});
 int? count=10;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: count,
      itemBuilder: (context, index) {
        return const ShimmerListItem();
      },
    );
  }
}

class HomeScreenShimmer extends StatelessWidget {
  const HomeScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      period: const Duration(milliseconds: 1000),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: crosstart, children: [
          Row(
            mainAxisAlignment: mainbetween,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[100],
                radius: 30,
              ),
              CircleAvatar(
                backgroundColor: Colors.grey[100],
                radius: 10,
              )
            ],
          ),
          10.heightBox,
          Container(
            height: 20.h,
            width: 100.w,
            color: whitecolor,
          ),
          5.heightBox,
          Row(
            children: [
              Container(
                height: 20.h,
                width: 70.w,
                color: whitecolor,
              ),
              Row(
                children: [
                  Container(
                    height: 20.h,
                    width: 30.w,
                    color: whitecolor,
                  ),
                  5.widthBox,
                  Container(
                    height: 20.h,
                    width: 20.w,
                    color: whitecolor,
                  ),
                ],
              ),
            ],
          )
        ]),
      ),
    ));
  }
}

class HomeScreenShimmerList extends StatelessWidget {
  const HomeScreenShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: 15,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return const HomeScreenShimmer()
                .box
                .height(110.h)
                .outerShadow
                .roundedSM
                .make();
          }),
    );
  }
}
