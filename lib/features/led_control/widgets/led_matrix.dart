// lib/features/led_control/widgets/led_matrix.dart
import 'package:flutter/material.dart';
import 'led_button.dart';

class LEDMatrix extends StatelessWidget {
  final int rows;
  final int columns;
  final List<bool> ledStates;
  final List<Color> ledColors;
  final Function(int) onLEDTap;

  const LEDMatrix({
    super.key,
    this.rows = 10,
    this.columns = 10,
    required this.ledStates,
    required this.ledColors,
    required this.onLEDTap,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: columns / rows,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemCount: rows * columns,
        itemBuilder: (context, index) {
          return LEDButton(
            index: index,
            row: index ~/ columns,
            column: index % columns,
            color: ledColors[index],
            isOn: ledStates[index],
            onTap: onLEDTap,
          );
        },
      ),
    );
  }
}
