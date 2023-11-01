import 'package:flutter/material.dart';

class RekomendasiWidget extends StatelessWidget {
  const RekomendasiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 12,
      ),
      itemCount: 4,
      itemBuilder: ((context, index) {
        return Container(
          height: 120,
          color: Colors.black,
        );
      }),
    );
  }
}
