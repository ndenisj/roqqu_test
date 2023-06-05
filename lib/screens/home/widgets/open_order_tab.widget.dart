import 'package:flutter/material.dart';

class OpenOrderTabWidget extends StatelessWidget {
  const OpenOrderTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No Open Orders',
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
          ),
          SizedBox(height: 10),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id pulvinar nullam sit imperdiet pulvinar.',
            style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
