import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:qr_code_app/models/feedback_model.dart';
import 'package:qr_code_app/models/search_model.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class MockGoogleService {
  static const String URL = "https://script.google.com/macros/s/AKfycbz73d41UUizJne4aQnT4vd1MN52zc2t_jYgXJ1iFG3Jbvpsg9tVdxR23Spn60_jOUOm4w/exec";

  Future<String> submitForm(FeedbackForm feedbackForm) async {
    Response response = await get(URL + feedbackForm.toParams());
    var data = jsonDecode(response.body);
    print(data['status']);
    return data['status'];
  }

  Future<String> searchData(SearchForm searchForm) async {
    Response response = await get(URL + searchForm.toParams());
    var data = jsonDecode(response.body);
    print(data);
  }

}