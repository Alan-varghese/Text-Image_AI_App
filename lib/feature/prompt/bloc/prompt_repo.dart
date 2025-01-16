class PromptRepo {
  static generateImage(String prompt) async {
    String url = 'POST https://api.vyro.ai/v2/image/generations';
    Map<String, dynamic> headers = {
      'Authorization':'Authorization: Bearer {{API_TOKEN}}'

    };


  }
}
