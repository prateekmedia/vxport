import 'package:flutter/material.dart';
import 'package:vxport/src/common_widgets/dividers.dart';
import 'package:vxport/src/common_widgets/tap_handler.dart';
import 'package:vxport/src/features/main/application/selected_file_index_provider.dart';
import 'package:vxport/src/features/main/application/toc_controller_provider.dart';
import 'package:vxport/src/features/main/presentation/components/expandable_side_item.dart';
import 'package:vxport/src/features/main/presentation/components/outline_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown_widget/config/toc.dart';
import 'package:markdown_widget/widget/blocks/leaf/heading.dart';

class ExplorerWidget extends ConsumerWidget {
  const ExplorerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final tocController = ref.read(tocControllerProvider);
    return Column(
      children: [
        const ExpandableSideItem(
          title: "outline",
          isExpanded: true,
        ),
        Expanded(
          child: Container(
            color: Colors.black.withValues(alpha: 0.2),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TocWidget(
                        controller: tocController,
                        shrinkWrap: true,
                        itemBuilder: (data) => TapHandler(
                          onTap: () {
                            final index = ref.read(selectedFileIndexProvider);
                            if (index == 0) {
                              // to be done
                            } else if (index == 1) {
                              tocController.jumpToIndex(data.index);
                            }
                          },
                          child: OutlineItem(
                            canExpand: data.toc.node.headingConfig.tag == "h1",
                            inner:
                                data.toc.node.headingConfig.tag == "h1" ? 1 : 4,
                            child: Text.rich(
                              data.toc.node
                                  .copy(
                                      headingConfig: H1Config(
                                          style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 18 / 16,
                                  )))
                                  .childrenSpan,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const DividerXX(),
        const ExpandableSideItem(
          title: "timeline",
          isExpanded: false,
        ),
        const ExpandableSideItem(
          title: "prateeks_portfolio",
          isExpanded: false,
        ),
      ],
    );
  }
}
