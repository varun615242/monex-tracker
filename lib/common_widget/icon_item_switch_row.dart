import 'package:flutter/material.dart';
import '../common/color_extension.dart';

class IconItemSwitchRow extends StatelessWidget {
  final String title;
  final String icon;
  final bool value;
  final Function(bool) didChange;

  const IconItemSwitchRow({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    required this.didChange,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => didChange(!value),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Row(
          children: [
            Image.asset(icon, width: 22, height: 22, color: TColor.gray30),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: TColor.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Switch(
              activeColor: TColor.primary,
              value: value,
              onChanged: didChange,
            ),
          ],
        ),
      ),
    );
  }
}