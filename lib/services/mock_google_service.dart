import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:qr_code_app/models/feedback_model.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class MockGoogleService {
  static const String URL = "https://script.google.com/macros/s/AKfycbx02wSPNaILhwUT1B8MIG9btNDyVdDzX7wZG7qPDlUdKTx-RuM2BNEqRABQObgNta98mA/exec";

  Future<String> submitForm(FeedbackForm feedbackForm) async {
    Response response = await get(URL + feedbackForm.toParams());
    var data = jsonDecode(response.body);
    print(data['status']);
    return data['status'];
  }

}