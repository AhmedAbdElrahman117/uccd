import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/option_tile.dart';

class DisabilityOptions extends StatefulWidget {
  const DisabilityOptions({super.key, required this.disabilityController});

  final TextEditingController disabilityController;

  @override
  State<DisabilityOptions> createState() => _DisabilityOptionsState();
}

class _DisabilityOptionsState extends State<DisabilityOptions> {
  String current = '';

  Map<String, String> response = {
    'Yes': 'yes',
    'No': 'no',
  };

  @override
  void initState() {
    current = response['No']!;
    widget.disabilityController.text = current;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: response.entries
          .map(
            (e) => Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: OptionTile(
                  title: e.key,
                  value: e.value,
                  currentValue: current,
                  onChanged: (value) {
                    setState(() {
                      current = value!;
                      widget.disabilityController.text = current;
                    });
                  },
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
