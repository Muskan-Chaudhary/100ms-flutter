import 'dart:convert';
import 'package:hmssdk_flutter_example/common/constant.dart';
import 'package:http/http.dart' as http;

class RoomService {
  Future<List<String?>?> getToken(
      {required String user, required String room}) async {
    List<String?> codeAndDomain = getCode(room) ?? [];
    print(codeAndDomain);
    if (codeAndDomain.length == 0) {
      return null;
    }
    Uri endPoint = codeAndDomain[2] == "true"
        ? Uri.parse(Constant.prodTokenEndpoint)
        : Uri.parse(Constant.qaTokenEndPoint);

    http.Response response = await http.post(endPoint, body: {
      'code': (codeAndDomain[1] ?? "").trim(),
      'user_id': user,
    }, headers: {
      'subdomain': (codeAndDomain[0] ?? "").trim()
    });

    var body = json.decode(response.body);
    print(body);
    return [body['token'], codeAndDomain[2]!.trim()];
  }

  List<String?>? getCode(String? roomUrl) {
    String? url = roomUrl;
    if (url == null) {
      return [];
    }
    url = url.trim();
    bool isProdM = url.contains(".app.100ms.live/meeting/");
    bool isProdP = url.contains(".app.100ms.live/preview/");
    bool isQaM = url.contains(".qa-app.100ms.live/meeting/");
    bool isQaP = url.contains(".qa-app.100ms.live/preview/");

    if (!isProdM && !isQaM && isQaP && isProdP) return [];

    List<String> codeAndDomain = [];
    String code = "";
    String subDomain = "";
    if (isProdM || isProdP) {
      codeAndDomain = isProdM
          ? url.split(".app.100ms.live/meeting/")
          : url.split(".app.100ms.live/preview/");
      code = codeAndDomain[1];
      subDomain = codeAndDomain[0].split("https://")[1] + ".app.100ms.live";
      print("$subDomain $code");
    } else if (isQaM || isQaP) {
      codeAndDomain = isQaM
          ? url.split(".qa-app.100ms.live/meeting/")
          : url.split(".qa-app.100ms.live/preview/");
      code = codeAndDomain[1];
      subDomain = codeAndDomain[0].split("https://")[1] + ".qa-app.100ms.live";
      print("$subDomain $code");
    }
    return [subDomain, code, isProdM || isProdP ? "true" : "false"];
  }
}
