import 'package:hmssdk_flutter/src/model/hms_hls_meeting_url_variant.dart';

///100ms HMSHLSConfig
///
///[HMSHLSConfig] contains a list of [HMSHLSMeetingURLVariant].
class HMSHLSConfig {
  List<HMSHLSMeetingURLVariant> variants;

  HMSHLSConfig(this.variants);

  Map<String, dynamic> toMap() {
    List<Map<String, String>> list = [];

    variants.forEach((element) {
      list.add(element.toMap());
    });

    return {
      'meeting_url_variants': list,
    };
  }
}
