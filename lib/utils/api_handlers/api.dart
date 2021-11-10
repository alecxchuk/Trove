import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trove/models/api_response.dart';

import 'failures.dart';

abstract class Api {
  /// THIS IS THE API ABSTRACT CLASS FOR THE APP
  /// THE PURPOSE OF WRITING THIS FILE IS TO AID THE USE OF SERVICES
  /// ALSO TO HIDE THE SERVICES USED, FROM THE USER.

  // LOGIN SERVICE
  Future<dynamic> login({required String email, required String password});

  // SIGNUP SERVICE
  Future<dynamic> signUp(
      {String? firstname,
      String? lastname,
      String? phonenumber,
      required String email,
      required String password,
      String? bankName,
      String? bankUsername,
      bankAccountNumber,
      String? dateOfBirth});

  // THE SERVICE TO GET USER PORTFOLIO
  Future<dynamic> fetchUserPortfolio(String id, String token);

  // THE SERVICE TO GET ALL USER ACTIVE LOANS
  Future<List<dynamic>> getActiveLoans(String id, String token);

  // THE SERVICE TO GET USER LOAN HISTORY
  Future fetchLoanHistory(String id, String token);

  // THE SERVICE TO  REQUEST A LOAN
  Future requestLoan(String id, String amount, String duration, String token);

  // THE SERVICE TO UPDATE USER INFORMATION
  Future<dynamic> updateUserInfo(
      String id,
      String firstnane,
      String lastname,
      String phonenumber,
      String bankName,
      String bankUsername,
      bankAccountNumber,
      String dateOfBirth,
      String token);

  // THE SERVICE TO UPDATE AN ORGANIZATION NAME
  Future changeUserPassworSd(String id, String oldPasswprd, String newPassword,
      String confirmPassword);

  /// THE SERVICE TO SEND GET REQUEST
  sendGetRequest(endpoint);

  /// POSTS REQUEST SERVICE
  sendPostRequest(body, endpoint);

  /// PATCH REQUEST SERVICE
  sendPatchRequest(body, endpoint, userId);

  /// ERROR HANDLING SERVICE
  Failure handleApiError(DioError e);

  /// A SERVICE TO SEND PATCH REQUEST TO THE ENDPOINT
  Future<ApiResponse?> patch(String path,
      {Map<String, dynamic>? body, String? token});
}
