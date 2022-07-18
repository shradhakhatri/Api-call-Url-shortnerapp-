import 'package:url_shortner_app/model/url_shortner_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Urlshortnerprovider extends ChangeNotifier {
  final urlController = TextEditingController();
  String shortUrlMessage = 'Give some long URL to convert';

  handleGetLinkButton() async {
    final longUrl = urlController.text;

    final String shortUrl = await getshortLink(longUrl);

    shortUrlMessage = '$shortUrl';
    notifyListeners();
  }

  Future<String> getshortLink(String longUrl) async {
    final result = await http.post(
        Uri.parse('https://cleanuri.com/api/v1/shorten'),
        body: {'url= longUrl'});

    if (result.statusCode == 200) {
      print('Successfully Completed');
      print(result.body);

      final response = urlShortnerResponseFromJson(result.body);
      return response.resultUrl;
    } else {
      print('Error in Api');
      print(result.body);
      return 'There is error in shortening the URL';
    }
  }
}
