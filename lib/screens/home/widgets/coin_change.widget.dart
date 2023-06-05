import 'package:flutter/material.dart';
import 'package:roqqu_test/styles/roqqu.colors.dart';
import 'package:roqqu_test/styles/roqqu.theme.dart';

class CoinChangeWidget extends StatelessWidget {
  const CoinChangeWidget({
    super.key,
    required this.icon,
    required this.changeLabel,
    required this.changeValue,
    required this.isSuccess,
    this.isLast = false,
  });

  final IconData icon;
  final String changeLabel;
  final String changeValue;
  final bool isSuccess;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: isLast
            ? const Border(right: BorderSide.none)
            : Border(
                right: BorderSide(
                  width: 2,
                  color: RoqquTheme.of(context).lineColor!,
                ),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: RoqquTheme.of(context).secondaryText,
                size: 16,
              ),
              const SizedBox(width: 5),
              Text(
                changeLabel,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            changeValue,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: isSuccess
                    ? successColor
                    : RoqquTheme.of(context).primaryText),
          ),
        ],
      ),
    );
  }
}
