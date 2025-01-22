// lib/features/led_control/widgets/led_button.dart
import 'package:flutter/material.dart';

class LEDButton extends StatelessWidget {
  final int index;
  final int row;
  final int column;
  final Color color;
  final bool isOn;
  final Function(int index) onTap;

  const LEDButton({
    super.key,
    required this.index,
    required this.row,
    required this.column,
    required this.color,
    required this.isOn,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        decoration: BoxDecoration(
          color: isOn ? color : Colors.grey[800],
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Colors.grey[900]!,
            width: 1,
          ),
          boxShadow: isOn
              ? [
                  BoxShadow(
                    color: color.withAlpha(77),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ]
              : null,
        ),
      ),
    );
  }
}
