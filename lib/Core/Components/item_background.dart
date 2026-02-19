import 'package:flutter/material.dart';

class ItemBackground extends StatelessWidget {
  const ItemBackground({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
  });

  final Widget child;
  final void Function()? onTap;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.53,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).brightness.index == 1
              ? Colors.grey.shade200
              : Colors.grey.shade800,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Card(
        margin: EdgeInsets.zero,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
//  Material(
//       borderRadius: BorderRadius.circular(15),
//       elevation: 12,
//       child: Container(
//         width: MediaQuery.sizeOf(context).width * 0.55,
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           border: Border.all(color: Colors.white24),
//         ),
//         child: child,
//       ),
//     );
