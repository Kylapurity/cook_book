import 'package:cookbook/components/skeleton_background.dart';
import 'package:flutter/material.dart';

class HomeLoadingCardSkeleton extends StatelessWidget {
  const HomeLoadingCardSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 440,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Skeleton(
              height: 345,
              width: 345,
              radius: 30,
            ),
            const SizedBox(
              height: 28,
            ),
            const Skeleton(
              height: 20,
              width: 190,
              radius: 30,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Skeleton(
                  height: 20,
                  width: 110,
                  radius: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Skeleton(
                  height: 20,
                  width: 60,
                  radius: 30,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
