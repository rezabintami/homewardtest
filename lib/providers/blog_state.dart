import 'package:flutter/material.dart';
import 'package:homewardtest/models/blog/blog_list.dart';
import 'package:homewardtest/services/api_client.dart';
import 'package:homewardtest/services/api_url.dart';
import 'package:homewardtest/utils/v_const.dart';
import 'package:homewardtest/utils/v_pref.dart';

class BlogState extends ChangeNotifier {
  List<BlogList> data = [];
  String erorrMsg = "";
  bool loaded = false;

  BlogState() {
    getData();
  }

  getData() async {
    erorrMsg = "";
    loaded = false;
    data = [];
    notifyListeners();
    ApiClient().get(
      url: ApiUrl.blogList,
      headers: await VPref.getAuthorization(),
      callback: (status, message, res) {
        loaded = true;
        if (status == 200) {
          if (!(res is Map)) {
            res.forEach((dynamic data) {
              this.data.add(BlogList.fromJson(data as dynamic));
            });
          }
        } else {
          erorrMsg = VConst.fail;
        }
        notifyListeners();
        return;
      },
    );
  }
}
