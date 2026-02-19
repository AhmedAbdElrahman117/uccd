import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/option_tile.dart';
import 'package:uccd/generated/l10n.dart';

class DisabilityOptions extends StatefulWidget {
  const DisabilityOptions({super.key, required this.disabilityController});

  final TextEditingController disabilityController;

  @override
  State<DisabilityOptions> createState() => _DisabilityOptionsState();
}

class _DisabilityOptionsState extends State<DisabilityOptions> {
  String current = 'no';

  @override
  void initState() {
    widget.disabilityController.text = current;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late Map<String, String> response = {
      S.of(context).yes: 'yes',
      S.of(context).No: 'no',
    };
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
                    setState(
                      () {
                        current = value!;
                        widget.disabilityController.text = current;
                      },
                    );
                  },
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
