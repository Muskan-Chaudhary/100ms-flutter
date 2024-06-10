// ///dart imports
// library;

// import 'dart:developer';
// import 'dart:io';

// ///Package imports
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// ///Project imports
// import 'package:hms_room_kit/src/layout_api/hms_room_layout.dart';
// import 'package:hms_room_kit/src/layout_api/hms_theme_colors.dart';
// import 'package:hms_room_kit/src/preview/preview_participant_chip.dart';
// import 'package:hms_room_kit/src/preview/preview_store.dart';
// import 'package:hms_room_kit/src/widgets/common_widgets/hms_subheading_text.dart';
// import 'package:hms_room_kit/src/widgets/common_widgets/hms_title_text.dart';

// ///[PreviewHeader] is the header of the preview screen
// ///It contains the logo, title, subtitle and the participant chip
// ///The participant chip is only visible when the room state is enabled
// ///and the peer list is not empty and the peer role has the permission to receive room state
// class PreviewHeader extends StatelessWidget {
//   final PreviewStore previewStore;
//   final double width;
//   const PreviewHeader(
//       {super.key, required this.previewStore, required this.width});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       decoration: BoxDecoration(
//           gradient: previewStore.isVideoOn
//               ? LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   stops: const [0.45, 1],
//                   colors: [
//                     HMSThemeColors.backgroundDim.withOpacity(1),
//                     HMSThemeColors.backgroundDim.withOpacity(0)
//                   ],
//                 )
//               : null),
//       child: Padding(
//         padding: EdgeInsets.only(
//           top: (!(previewStore.peer?.role.publishSettings!.allowed
//                       .contains("video") ??
//                   false)
//               ? MediaQuery.of(context).size.height * 0.4
//               : Platform.isIOS
//                   ? 50
//                   : 35),
//         ),
//         child: Column(
//           children: [
//             ///We render a generic logo which can be replaced
//             ///with the company logo from dashboard
//             HMSRoomLayout.roleLayoutData?.logo?.url == null
//                 ? Container()
//                 : HMSRoomLayout.roleLayoutData!.logo!.url!.contains("svg")
//                     ? SvgPicture.network(
//                         HMSRoomLayout.roleLayoutData!.logo!.url!,
//                         height: 30,
//                         width: 30,
//                       )
//                     : Image.network(
//                         HMSRoomLayout.roleLayoutData!.logo!.url!,
//                         errorBuilder: (context, exception, _) {
//                           log('Error is $exception');
//                           return const SizedBox(
//                             width: 30,
//                             height: 30,
//                           );
//                         },
//                         height: 30,
//                         width: 30,
//                       ),
//             const SizedBox(
//               height: 16,
//             ),
//             HMSTitleText(
//                 text: HMSRoomLayout.roleLayoutData?.screens?.preview
//                         ?.previewHeader?.title ??
//                     "Get Started",
//                 fontSize: 24,
//                 lineHeight: 32,
//                 textColor: HMSThemeColors.onSurfaceHighEmphasis),
//             const SizedBox(
//               height: 4,
//             ),
//             HMSSubheadingText(
//                 text: HMSRoomLayout.roleLayoutData?.screens?.preview
//                         ?.previewHeader?.subTitle ??
//                     "Setup your audio and video before joining",
//                 textColor: HMSThemeColors.onSurfaceMediumEmphasis),

//             ///Here we use SizedBox to keep the UI consistent
//             ///until we have received peer list or the room-state is
//             ///not enabled
//             const SizedBox(
//               height: 16,
//             ),
//             PreviewParticipantChip(previewStore: previewStore, width: width)
//           ],
//         ),
//       ),
//     );
//   }
// }

///dart imports
library;

///Package imports
import 'package:flutter/material.dart';
import 'package:hms_room_kit/hms_room_kit.dart';

import 'package:hms_room_kit/src/preview/preview_store.dart';
import 'package:hms_room_kit/src/widgets/common_widgets/hms_subheading_text.dart';

///[PreviewHeader] is the header of the preview screen
///It contains the logo, title, subtitle and the participant chip
///The participant chip is only visible when the room state is enabled
///and the peer list is not empty and the peer role has the permission to receive room state
class PreviewHeader extends StatelessWidget {
  final PreviewStore previewStore;
  final String userName;
  final String? imgUrl;
  final bool isVideoCall;
  const PreviewHeader(
      {super.key,
      required this.previewStore,
      this.imgUrl,
      required this.userName,
      this.isVideoCall = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: previewStore.isVideoOn
              ? LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.2, 1],
                  colors: [
                    HMSThemeColors.backgroundDim.withOpacity(0.6),
                    HMSThemeColors.backgroundDim.withOpacity(0)
                  ],
                )
              : null),
      child: Padding(
          padding: EdgeInsets.only(top: 60, left: isVideoCall ? 24 : 0),
          child: isVideoCall
              ? Row(
                  children: [
                    if (imgUrl != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: ClipOval(
                            child: Image.network(
                          imgUrl!,
                          height: 56,
                          width: 56,
                        )),
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HMSTitleText(
                          text: Constant.prebuiltOptions?.userName ?? "",
                          textColor: HMSThemeColors.onSurfaceHighEmphasis,
                          fontSize: 24,
                          lineHeight: 32,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        HMSSubheadingText(
                            text: "Video Calling...",
                            textColor: HMSThemeColors.onSurfaceMediumEmphasis)
                      ],
                    )
                  ],
                )
              : Column(children: [
                  if (imgUrl != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: ClipOval(
                          child: Image.network(
                        imgUrl!,
                        height: 56,
                        width: 56,
                      )),
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HMSTitleText(
                        text: Constant.prebuiltOptions?.userName ?? "",
                        textColor: HMSThemeColors.onSurfaceHighEmphasis,
                        fontSize: 24,
                        lineHeight: 32,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      HMSSubheadingText(
                          text: "Calling...",
                          textColor: HMSThemeColors.onSurfaceMediumEmphasis)
                    ],
                  ),
                ])),
    );
  }
}
