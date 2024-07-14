import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardData extends StatelessWidget {
  final String title;
  final double? value;
  final String unit;
  final int fractionDigits;
  final IconData? icon;
  final Color color;
  final double? value2;
  final String? unit2;
  final String? stringValue;
  final int index;

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
    this.stringValue,
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
    final List<LinearGradient> gradients = [
      const LinearGradient(
        colors: [Color.fromARGB(255, 27, 58, 138), Color(0xFF6080D3)],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ),
      const LinearGradient(
        colors: [Color(0xFF8C1C44), Color(0xFFCF5C86)],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ),
      const LinearGradient(
        colors: [Color(0xFF288B55), Color(0xFFB5E27C)],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ),
      const LinearGradient(
        colors: [Color(0xFF822D12), Color(0xFFE1896E)],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ),
      const LinearGradient(
        colors: [Color(0xFF6E48AA), Color(0xFF9D50BB)],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ),
      const LinearGradient(
        colors: [Color(0xFF3f4c6b), Color(0xFF606c88)],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      )
    ];
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: gradients[index],
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        padding: const EdgeInsets.fromLTRB(12, 8.0, 16, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 24),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    color: Colors.white,
                                  ),
                              getValue(),
                            ),
                            Text(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                  ),
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
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                                value2!.toStringAsFixed(fractionDigits),
                              ),
                              Text(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
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
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  String getValue() {
    if (stringValue != null) {
      return stringValue!;
    }
    return value != null ? (value!.toStringAsFixed(fractionDigits)) : "N/A";
  }
}
