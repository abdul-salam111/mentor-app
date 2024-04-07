import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ShimmerListItem();
        },
      ),
    );
  }
}

class ShimmerListItem extends StatelessWidget {
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


class AnotherShimmerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return ShimmerListItem();
      },
    );
  }
}

