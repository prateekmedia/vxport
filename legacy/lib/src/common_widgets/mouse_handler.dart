import 'package:flutter/material.dart';

class MouseHandler extends StatefulWidget {
  const MouseHandler({super.key, required this.child, this.onTap});

  final Widget Function(bool) child;
  final VoidCallback? onTap;

  @override
  State<MouseHandler> createState() => _MouseHandlerState();
}

class _MouseHandlerState extends State<MouseHandler> {
  bool _isHovered = false;

  void _onHoverChanged(bool enabled) {
    setState(() {
      _isHovered = enabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _onHoverChanged(true),
      onExit: (_) => _onHoverChanged(false),
      child: widget.onTap != null
          ? GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: widget.onTap,
              child: widget.child(_isHovered),
            )
          : widget.child(_isHovered),
    );
  }
}
