import 'dart:io';

import 'package:dio/dio.dart';

class PromptRepo {
  static Future<File?> generateImage(String prompt) async {
    String url = 'POST https://api.vyro.ai/v2/image/generations';
    Map<String, dynamic> headers = {
      'Authorization':
          'Authorization: Bearer vk-30cri21jf2ygL0ggs4RNCF8azw1xlkmRzAOYz90Dk30BjWb'
    };

    Map<String, dynamic> payload = {
      'prompt': 'prompt',
      'style_id': '122',
      'aspect_ratio': '1.1',
      'cfg': '1',
      'seed': '1',
      'high_res_results': '1'
    };

    Dio dio = Dio();
    dio.options = BaseOptions(
      headers: headers,
    );

    final response = await dio.post(url, data: payload);
    if (response.statusCode == 200) {
      File file = File("image.jpg");
      file.writeAsBytesSync(response.data);
      return file;
    } else {
      return null;
    }
  }
}
