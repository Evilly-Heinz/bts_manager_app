import 'package:flutter/material.dart';

class CardData extends StatelessWidget {
  final String title;
  final double? value;
  final String unit;
  final int fractionDigits;
  final IconData? icon;
  final Color color;
  final double? value2;
  final String? unit2;

  const CardData({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    this.fractionDigits = 1,
    required this.icon,
    required this.color,
    this.value2,
    this.unit2,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 8.0, 16, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              style: Theme.of(context).textTheme.headlineMedium,
                              value != null
                                  ? (value!.toStringAsFixed(fractionDigits))
                                  : "N/A",
                            ),
                            Text(
                              style: Theme.of(context).textTheme.bodyLarge,
                              value != null ? (" $unit") : "",
                            ),
                          ],
                        ),
                      ),
                      if (value2 != null)
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                                value2!.toStringAsFixed(fractionDigits),
                              ),
                              Text(
                                style: Theme.of(context).textTheme.bodyLarge,
                                value2 != null ? (" $unit2") : "",
                              )
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                Icon(icon, size: 32, color: color)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
