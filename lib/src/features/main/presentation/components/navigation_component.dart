import 'package:flutter/material.dart';
import 'package:themed/themed.dart';
import 'package:vxport/src/common_widgets/mouse_handler.dart';
import 'package:vxport/src/features/main/application/navigation_item_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:vxport/src/utils/constants.dart';

class NavigationComponent extends StatefulWidget {
  const NavigationComponent({
    super.key,
  });

  @override
  State<NavigationComponent> createState() => _NavigationComponentState();
}

class _NavigationComponentState extends State<NavigationComponent> {
  @override
  Widget build(BuildContext context) {
    final items = {
      "Explorer": LucideIcons.files,
      "Projects": LucideIcons.gitFork,
      "Links": LucideIcons.link,
      "About Website": Padding(
        padding: const EdgeInsets.all(12.0),
        child: ChangeColors(
          saturation: -1,
          child: Image.asset("assets/vxport.png"),
        ),
      ),
    };

    return Column(
      children: [
        for (final item in items.entries.toList().asMap().entries)
          NavigationButton(
            tooltip: item.value.key,
            icon: item.value.value is IconData
                ? item.value.value as IconData
                : null,
            index: item.key,
            child:
                item.value.value is Widget ? item.value.value as Widget : null,
          ),
        const Spacer(),
        const NavigationButton(
          tooltip: "Settings",
          index: 4,
          icon: LucideIcons.settings,
        ),
      ],
    );
  }
}

class NavigationButton extends ConsumerWidget {
  const NavigationButton({
    super.key,
    required this.tooltip,
    required this.icon,
    this.child,
    required this.index,
  });

  final String tooltip;
  final IconData? icon;
  final Widget? child;
  final int index;

  @override
  Widget build(BuildContext context, ref) {
    var currentIndex = ref.watch(navigationItemStateProvider);
    final isSmall = MediaQuery.sizeOf(context).width <= MagicNumber.breakpoint;
    currentIndex = isSmall && currentIndex == null ? -1 : currentIndex ?? 0;

    return MouseHandler(
      onTap: () {
        if (currentIndex == index) {
          ref.read(navigationItemStateProvider.notifier).state = -1;
          return;
        }
        ref.read(navigationItemStateProvider.notifier).state = index;
      },
      child: (isHovered) => JustTheTooltip(
        tailBaseWidth: 8,
        tailLength: 8,
        preferredDirection: AxisDirection.right,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            tooltip,
          ),
        ),
        child: Opacity(
          opacity: currentIndex == index || isHovered ? 1 : .6,
          child: MouseHandler(
            child: (_) => Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: currentIndex == index
                        ? Colors.blue[400]!
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
              child: child ??
                  Icon(
                    icon!,
                    size: 38,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
