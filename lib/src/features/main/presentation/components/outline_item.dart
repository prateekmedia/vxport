import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class OutlineItem extends StatelessWidget {
  const OutlineItem({
    super.key,
    required this.child,
    required this.canExpand,
    this.inner = 1,
  });

  final Widget child;
  final bool canExpand;
  final int inner;

  @override
  Widget build(BuildContext context) {
    bool isExpanded = 1 == 1;
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.08),
      ),
      padding: EdgeInsets.only(left: inner * 12),
      height: 32,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (canExpand)
            SizedBox(
              width: 28,
              child: Icon(
                isExpanded ? LucideIcons.chevronDown : LucideIcons.chevronRight,
                size: 20,
              ),
            ),
          const Icon(Icons.abc, size: 20),
          const SizedBox(width: 8),
          child,
        ],
      ),
    );
  }
}
