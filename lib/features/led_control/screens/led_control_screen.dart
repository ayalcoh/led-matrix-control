// lib/features/led_control/screens/led_control_screen.dart
import 'package:flutter/material.dart';
import '../widgets/led_matrix.dart';
import '../widgets/color_control_panel.dart';

class LEDControlScreen extends StatefulWidget {
  const LEDControlScreen({super.key});

  @override
  State<LEDControlScreen> createState() => _LEDControlScreenState();
}

class _LEDControlScreenState extends State<LEDControlScreen> {
  Color _selectedColor = Colors.blue;
  List<bool> _ledStates = List.filled(100, false); // For 10x10 matrix
  List<Color> _ledColors = List.filled(100, Colors.blue);

  void _handleLEDTap(int index) {
    setState(() {
      _ledStates[index] = !_ledStates[index];
      if (_ledStates[index]) {
        _ledColors[index] = _selectedColor;
      }
    });
  }

  void _handleColorChange(Color color) {
    setState(() {
      _selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'LED Matrix Control',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          // Control buttons
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _ledStates = List.filled(100, true);
                    _ledColors = List.filled(100, _selectedColor);
                  });
                },
                icon: const Icon(Icons.lightbulb),
                label: const Text('All On'),
              ),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _ledStates = List.filled(100, false);
                  });
                },
                icon: const Icon(Icons.lightbulb_outline),
                label: const Text('All Off'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Color control panel
          ColorControlPanel(
            currentColor: _selectedColor,
            onColorChanged: _handleColorChange,
          ),
          const SizedBox(height: 16),
          // LED Matrix
          Expanded(
            child: LEDMatrix(
              ledStates: _ledStates,
              ledColors: _ledColors,
              onLEDTap: _handleLEDTap,
            ),
          ),
        ],
      ),
    );
  }
}
