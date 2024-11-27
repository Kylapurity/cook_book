import 'package:flutter/material.dart';
import 'package:cookbook/components/home/home_card_skeleton.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => const HomeLoadingCardSkeleton(),
        separatorBuilder: (context, index) => const SizedBox(height: 30),
        itemCount: 2,
      ),
    );
  }
}
