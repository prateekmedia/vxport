import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vxport/src/common_widgets/dividers.dart';
import 'package:vxport/src/features/main/application/navigation_item_state.dart';
import 'package:vxport/src/features/main/presentation/components/code_component.dart';
import 'package:vxport/src/features/main/presentation/components/header_component.dart';
import 'package:vxport/src/features/main/presentation/components/sidebar_component.dart';
import 'package:vxport/src/features/main/presentation/components/footer_component.dart';
import 'package:vxport/src/features/main/presentation/components/navigation_component.dart';
import 'package:resizable_widget/resizable_widget.dart';
import 'package:vxport/src/utils/constants.dart';

class MainWindowArea extends ConsumerWidget {
  const MainWindowArea({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    var index = ref.watch(navigationItemStateProvider);
    final isSmall = MediaQuery.sizeOf(context).width <= MagicNumber.breakpoint;
    index = isSmall && index == null ? -1 : index ?? 0;

    return Column(
      children: [
        Container(
          height: 44,
          color: Colors.black.withOpacity(0.4),
          child: const HeaderComponent(),
        ),
        const DividerX(),
        Expanded(
          child: Row(
            children: [
              Container(
                width: 70,
                color: Colors.black.withOpacity(0.4),
                child: const Row(
                  children: [
                    Expanded(
                      child: NavigationComponent(),
                    ),
                  ],
                ),
              ),
              const DividerY(),
              Expanded(
                child: LayoutBuilder(
                  builder: (_, constraints) {
                    if (constraints.maxWidth > MagicNumber.breakpoint &&
                        index != -1) {
                      return Row(
                        children: [
                          Expanded(
                            child: ResizableWidget(
                                percentages: const [0.21, 0.79],
                                separatorColor: Colors.black.withOpacity(0.6),
                                children: [
                                  Container(
                                    color: Colors.black.withOpacity(0.3),
                                    child: const Row(
                                      children: [
                                        Expanded(
                                          child: SidebarComponent(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.grey[900]!.withOpacity(0.4),
                                    child: const Row(
                                      children: [
                                        Expanded(
                                          child: CodeComponent(),
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                          )
                        ],
                      );
                    }

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      child: Container(
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.sizeOf(context).width,
                        ),
                        child: Row(
                          children: [
                            if (index! >= 0)
                              Container(
                                width: min(350,
                                    MediaQuery.of(context).size.width - 72),
                                color: Colors.black.withOpacity(0.3),
                                child: const SidebarComponent(),
                              ),
                            Container(
                              width: MediaQuery.of(context).size.width - 72,
                              // constraints: BoxConstraints(
                              //   minWidth: MediaQuery.sizeOf(context).width,
                              // ),
                              color: Colors.grey[900]!.withOpacity(0.4),
                              child: const CodeComponent(),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const DividerX(),
        Container(
          height: 30,
          width: MediaQuery.sizeOf(context).width,
          color: Colors.blue.withOpacity(0.4),
          child: const FooterComponent(),
        )
      ],
    );
  }
}
