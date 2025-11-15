import 'package:flutter/material.dart';

class DividerY extends StatelessWidget {
  const DividerY({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      width: 2,
      color: Colors.black.withValues(alpha: 0.6),
    );
  }
}

class DividerXX extends StatelessWidget {
  const DividerXX({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 2,
      color: Colors.white.withValues(alpha: 0.2),
    );
  }
}

class DividerX extends StatelessWidget {
  const DividerX({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 2,
      color: Colors.black.withValues(alpha: 0.6),
    );
  }
}

class SeparateItems extends StatelessWidget {
  const SeparateItems({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 16);
  }
}
