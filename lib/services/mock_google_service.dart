import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:qr_code_app/models/feedback_model.dart';
import 'package:qr_code_app/models/search_model.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class MockGoogleService {
  static const String URL =
      "https://script.google.com/macros/s/AKfycbyygvucWIdAS7Q-AtA-KcQkkrMgwBgct2OKIdSHGKc_wZ3aOolz2AJhysSm8FNqRVbh2A/exec";

  Future<String> submitForm(FeedbackForm feedbackForm) async {
    Response response = await get(URL + feedbackForm.toParams());
    var data = jsonDecode(response.body);
    print(data['status']);
    return data['status'];
  }

  Future<Map<String, dynamic>> searchData(SearchForm searchForm) async {
    Response response = await get(URL + searchForm.toParams());
    var data = jsonDecode(response.body);
    // print(data);
    return data;
  }
}
