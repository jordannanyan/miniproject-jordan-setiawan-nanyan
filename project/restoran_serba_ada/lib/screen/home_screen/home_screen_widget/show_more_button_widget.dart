import 'package:flutter/material.dart';

class ShowMoreButtonWidget extends StatelessWidget {
  final Function() onPress;
  final bool data;
  const ShowMoreButtonWidget({
    super.key,
    required this.onPress,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextButton(
          onPressed: onPress,
          child: (data)
              ? const Text(
                  'Show Less',
                )
              : const Text('Show More')),
    );
  }
}
