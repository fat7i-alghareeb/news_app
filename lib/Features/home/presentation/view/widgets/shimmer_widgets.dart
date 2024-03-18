import 'package:flutter/material.dart';

class MainScreenShimmer extends StatelessWidget {
  const MainScreenShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ShimmerWidget(
          paddingLTRB: [20, 20, 20, 20],
          borderRadius: 8,
          hight: 200,
          width: double.infinity,
        ),
        Expanded(
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const ShimmerWidget(
                      paddingLTRB: [10, 10, 14, 10],
                      hight: 100,
                      width: 100,
                      borderRadius: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerWidget(
                          paddingLTRB: const [0, 14, 0, 0],
                          hight: 15,
                          width: MediaQuery.of(context).size.width - 140,
                          borderRadius: 0,
                        ),
                        ShimmerWidget(
                          paddingLTRB: const [0, 10, 0, 0],
                          hight: 15,
                          width: MediaQuery.of(context).size.width - 140,
                          borderRadius: 0,
                        ),
                        ShimmerWidget(
                          paddingLTRB: const [0, 10, 0, 0],
                          hight: 15,
                          width: MediaQuery.of(context).size.width - 180,
                          borderRadius: 0,
                        ),
                        ShimmerWidget(
                          paddingLTRB: const [0, 10, 0, 0],
                          hight: 12,
                          width: MediaQuery.of(context).size.width - 300,
                          borderRadius: 0,
                        ),
                      ],
                    ),
                  ],
                );
              }),
        )
      ],
    );
  }
}

class ShimmerWidget extends StatelessWidget {
  final List<double> paddingLTRB;
  final double hight;
  final double width;
  final double borderRadius;
  const ShimmerWidget({
    super.key,
    required this.paddingLTRB,
    required this.hight,
    required this.width,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          paddingLTRB[0], paddingLTRB[1], paddingLTRB[2], paddingLTRB[3]),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Colors.grey[600]?.withOpacity(0.8),
        ),
        height: hight,
        width: width,
      ),
    );
  }
}
