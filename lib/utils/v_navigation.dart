import 'package:flutter/material.dart';
import 'package:homewardtest/views/auth/login_screen.dart';
import 'package:homewardtest/views/blog/blog_detail_screen.dart';
import 'package:homewardtest/views/blog/blog_list_screen.dart';

import 'v_pref.dart';

class VNav {
  VNav._();

  static logout(context) {
    VPref.clearAll();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route<dynamic> route) => false);
  }

  static blog(context) async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => BlogListScreen()),
        (Route<dynamic> route) => false);
  }

  static blogDetail(context, data) async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => BlogDetailScreen(data)));
  }
}
