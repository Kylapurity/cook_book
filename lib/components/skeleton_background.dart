import 'package:cookbook/helpers/colorpallete.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({
    Key? key,
    required this.height,
    required this.width,
    required this.radius,
  }) : super(key: key);

  final double? height, width;
  final double radius;

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.radius),
      child: Shimmer.fromColors(
        period: const Duration(milliseconds: 800),
        baseColor: ColorPallete.darkGrey,
        highlightColor: ColorPallete.defaultGrey,
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            color: ColorPallete.defaultGrey.withOpacity(0.25),
          ),
        ),
      ),
    );
  }
}
