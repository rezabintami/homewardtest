import 'package:flutter/material.dart';
import 'package:homewardtest/services/api_client.dart';
import 'package:homewardtest/services/api_url.dart';
import 'package:homewardtest/utils/v_navigation.dart';
import 'package:homewardtest/widgets/v_popup.dart';

class AuthState extends ChangeNotifier {
  BuildContext context;
  bool obscure = true;
  final formKey = GlobalKey<FormState>();
  Map<String, String> body = {};

  AuthState(this.context);

  toggleObscure() {
    obscure = !obscure;
    notifyListeners();
  }

  submit() async {
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();
    VPopup.loadingPopup(context);
    ApiClient().post(
      url: ApiUrl.login,
      body: body,
      callback: (status, message, res) {
        Navigator.pop(context);
        if (status == 201) {
          VNav.blog(context);
        } else {
          VPopup.error(context, message);
        }
        return;
      },
    );
  }
}
