import 'package:flutter/material.dart';
import 'package:homewardtest/models/blog/blog_detail.dart';
import 'package:homewardtest/models/blog/blog_list.dart';
import 'package:homewardtest/services/api_client.dart';
import 'package:homewardtest/services/api_url.dart';
import 'package:homewardtest/utils/v_const.dart';
import 'package:homewardtest/utils/v_pref.dart';

class BlogDetailState extends ChangeNotifier {
  BlogDetail data;
  String erorrMsg = "";
  bool loaded = false;
  BlogList blog;

  BlogDetailState(this.blog) {
    getData();
  }

  getData() async {
    erorrMsg = "";
    loaded = false;
    data = null;
    notifyListeners();
    ApiClient().get(
      url: "${ApiUrl.blogList}/${blog.id}",
      headers: await VPref.getAuthorization(),
      callback: (status, message, res) {
        loaded = true;
        if (status == 200) {
          data = BlogDetail.fromJson(res as dynamic);
        } else {
          erorrMsg = VConst.fail;
        }
        notifyListeners();
        return;
      },
    );
  }
}
