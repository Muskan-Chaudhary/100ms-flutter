///Package imports
library;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///Project imports
import 'package:hms_room_kit/hms_room_kit.dart';

class HMSCallNotAnsweredScreen extends StatelessWidget {
  const HMSCallNotAnsweredScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HMSThemeColors.backgroundDim,
        body: Theme(
          data: ThemeData(
              brightness: Brightness.dark,
              primaryColor: HMSThemeColors.primaryDefault,
              scaffoldBackgroundColor: HMSThemeColors.backgroundDim),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () => {
                      ///Here we reset the layout colors and pop the leave screen
                      HMSThemeColors.resetLayoutColors(),
                      Navigator.pop(context)
                    },
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: HMSThemeColors.surfaceDefault,
                      child: SvgPicture.asset(
                        "packages/hms_room_kit/lib/src/assets/icons/close.svg",
                        height: 24,
                        width: 24,
                        colorFilter: ColorFilter.mode(
                            HMSThemeColors.onSurfaceHighEmphasis,
                            BlendMode.srcIn),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HMSTitleText(
                    text: "Consultant is currently unavailable",
                    textColor: HMSThemeColors.onSurfaceHighEmphasis,
                    fontSize: 24,
                    lineHeight: 32,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  HMSTitleText(
                    text: "Please try again later",
                    textColor: HMSThemeColors.onSurfaceMediumEmphasis,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
