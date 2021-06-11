import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:homewardtest/models/blog/blog_list.dart';
import 'package:homewardtest/providers/blog_state.dart';
import 'package:homewardtest/utils/date_utils.dart';
import 'package:homewardtest/utils/v_navigation.dart';
import 'package:homewardtest/widgets/v_loading.dart';
import 'package:homewardtest/widgets/v_text.dart';
import 'package:provider/provider.dart';

class BlogListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: VText("Blog List"),
      ),
      body: ChangeNotifierProvider<BlogState>(
        create: (_) => BlogState(),
        child: Consumer(
          builder: (BuildContext context, BlogState state, Widget child) {
            return _body(context, state);
          },
        ),
      ),
    );
  }

  Widget _body(context, BlogState state) {
    if (!state.loaded) return VLoading();
    if (state.erorrMsg.isNotEmpty) return Center(child: VText(state.erorrMsg));
    if (state.data.isEmpty) return Center(child: VText("No data"));

    return ListView.separated(
      itemCount: state.data.length,
      separatorBuilder: (c, i) => Divider(),
      itemBuilder: (c, i) {
        BlogList data = state.data[i];
        return ListTile(
          leading: Hero(
            tag: data.title,
            child: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(data.imageUrl),
            ),
          ),
          title: VText(data.title),
          subtitle: VText(DateUtils.dateToString(data.createdAt)),
          onTap: () => VNav.blogDetail(context, data),
        );
      },
    );
  }
}
