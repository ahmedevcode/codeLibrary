import 'package:codelibrary/core/shimmer/shimmer_container_effect.dart';
import 'package:flutter/material.dart';

class ShimmerNewsetListView extends StatelessWidget {
  const ShimmerNewsetListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) => const SizedBox(
        height: 120,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ShimmerContainerEffect(
                height: double.infinity,
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerContainerEffect(
                      width: double.infinity,
                      height: 15,
                    ),
                    ShimmerContainerEffect(
                      width: 200,
                      height: 15,
                    ),
                    ShimmerContainerEffect(
                      width: 150,
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ShimmerContainerEffect(
                          width: 80,
                          height: 15,
                        ),
                        ShimmerContainerEffect(
                          width: 60,
                          height: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 15.0),
    );
  }
}
