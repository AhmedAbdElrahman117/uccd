import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/option_tile.dart';

class GenderOptions extends StatefulWidget {
  const GenderOptions({super.key, required this.genderController});

  final TextEditingController genderController;

  @override
  State<GenderOptions> createState() => _GenderOptionsState();
}

class _GenderOptionsState extends State<GenderOptions> {
  String current = '';

  Map<String, String> genders = {
    'Male': 'male',
    'Female': 'female',
  };

  @override
  void initState() {
    current = genders['Male']!;
    widget.genderController.text = current;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: genders.entries
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
                      widget.genderController.text = current;
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
