import 'package:flutter/material.dart';

class RemainEventText extends StatelessWidget {
  final int? count;
  final String? remainCountPattern;

  RemainEventText({
    this.count,
    this.remainCountPattern,
  });

  @override
  Widget build(BuildContext context) {
    if (count! > 0) {
      return Padding(
        padding: const EdgeInsets.only(left: 2, bottom: 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              remainCountPattern!.replaceFirst('%s', count.toString()),
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      );
    }

    return Container();
  }
}
