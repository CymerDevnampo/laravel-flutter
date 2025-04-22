import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:forumapp/constants/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthenticationController extends GetxController {
  final isLoading = false.obs;

  Future register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    try {
      var data = {
        'name': name,
        'username': username,
        'email': email,
        'password': password,
      };

      var response = await http.post(
        Uri.parse(url + 'register'),
        headers: {
          'Accept': 'application/json',
        },
        body: data,
      );

      if (response.statusCode == 201) {
        isLoading.value = false;
        // debugPrint(json.decode(response.body));
        debugPrint(json.decode(response.body).toString());
      } else {
        isLoading.value = false;
        // debugPrint(json.decode(response.body));
        debugPrint(json.decode(response.body).toString());
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }
}
