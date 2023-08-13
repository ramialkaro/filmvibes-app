import 'package:flutter/material.dart';

class CinemaSeat extends StatelessWidget {
  final bool isAvailable;
  final bool isSelected;
  final Function() onTap;

  const CinemaSeat({
    super.key,
    required this.isAvailable,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: isAvailable
              ? isSelected
                  ? const Color(0xFFFF79C6).withOpacity(0.6)
                  : Colors.green.withOpacity(0.6)
              : const Color(0xFF44475A),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
