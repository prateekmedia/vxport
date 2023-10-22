import 'package:flutter/material.dart';
import 'package:vxport/src/common_widgets/dividers.dart';
import 'package:vxport/src/features/main/presentation/components/code_component.dart';
import 'package:vxport/src/features/main/presentation/components/header_component.dart';
import 'package:vxport/src/features/main/presentation/components/sidebar_component.dart';
import 'package:vxport/src/features/main/presentation/components/footer_component.dart';
import 'package:vxport/src/features/main/presentation/components/navigation_component.dart';
import 'package:resizable_widget/resizable_widget.dart';

class MainWindowArea extends StatelessWidget {
  const MainWindowArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          ),
        ),
        const DividerX(),
        Container(
          height: 30,
          color: Colors.blue.withOpacity(0.4),
          child: const FooterComponent(),
        )
      ],
    );
  }
}
