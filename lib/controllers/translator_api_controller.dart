// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';

import 'package:macos/constants/utils.dart';

class TranslateAPIController {
  final String apiKey = "164746254e4fc7";
  Dio dio = Dio();

  Future<TranslationResponse> translate(String text, String langCode) async {
    Response response;

    response = await dio.post(
        'https://translation-api.translate.com/translate/v1/mt',
        data: {
          'source_language': 'en',
          'translation_language': langCode,
          'text': text
        },
        options: Options(headers: {
          'accept': '*/*',
          'Content-type': 'application/x-www-form-urlencoded',
          'x-api-key': apiKey
        }));
    printer(response);

    TranslationResponse translationResponse = TranslationResponse();

    translationResponse.text = text;
    translationResponse.translation = response.data['translation'];
    translationResponse.limit_used =
        double.parse(response.data['limit_used'].toString());
    translationResponse.limit_remaining =
        double.parse(response.data['limit_remaining'].toString());

    printer(response.data);

    return translationResponse;
  }
}

class TranslationResponse {
  String? text;
  String? translation;
  double? limit_used;
  double? limit_remaining;
}
