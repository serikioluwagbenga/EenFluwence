import 'dart:convert';
import 'dart:core';

import 'package:enfluwence/data/repositories/authentication/authentication_repository.dart';
import 'package:enfluwence/http/auth/auth.dart';
import 'package:enfluwence/pages/auth/models/siginin.dart';
import 'package:enfluwence/pages/auth/models/signup.dart';
import 'package:enfluwence/pages/auth/screens/OTP/otp.dart';
import 'package:enfluwence/pages/influencers/models/user.dart';
import 'package:enfluwence/pages/influencers/screens/home/home.dart';
import 'package:enfluwence/utills/consts/asset_paths.dart';
import 'package:enfluwence/utills/consts/text.dart';
import 'package:enfluwence/utills/helpers/network_manager.dart';
import 'package:enfluwence/utills/local_storage/storage_utility.dart';
import 'package:enfluwence/utills/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  // form varibles
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signInFromKey = GlobalKey<FormState>();

  Future<void> signIn() async {
    try {
      // start loading
      AFullScreenLoader.openLoadingDialog(
          AText.processInfo, AAssets.docerAnimation);
      // check inetrnet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;
      // from validation
      if (!signInFromKey.currentState!.validate()) return;

      // Login user through API
      SignIn data =
          SignIn(email: email.text.trim(), password: password.text.trim());
      var response = await AuthApi.signIn(data);
      var user = response['data']['user'];
      // save auth user data in localStorage
      var storage = ALocalStorage();
      await storage.saveData("currentUser", user);
      await storage.saveData("token", response['data']['token']);
      // show success message
      Get.snackbar('Great!', response['message']);
      // stop loading
      AFullScreenLoader.stopLoading();
      // redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // handle error
      Get.snackbar('Oh Snap!', e.toString());
      print(e.toString());
    } finally {
      // remove loader
      AFullScreenLoader.stopLoading();
    }
  }
}
