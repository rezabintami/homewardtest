import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:homewardtest/models/blog/blog_list.dart';
import 'package:homewardtest/providers/blog_detail_state.dart';
import 'package:homewardtest/widgets/v_text.dart';
import 'package:provider/provider.dart';

class BlogDetailScreen extends StatelessWidget {
  final BlogList data;

  BlogDetailScreen(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: VText(data.title)),
      body: ChangeNotifierProvider<BlogDetailState>(
        create: (_) => BlogDetailState(data),
        child: Consumer(
          builder: (BuildContext context, BlogDetailState state, Widget child) {
            return _body(state);
          },
        ),
      ),
    );
  }

  Widget _body(BlogDetailState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: data.title,
          child: CachedNetworkImage(
            imageUrl: data.imageUrl,
            width: double.infinity,
          ),
        ),
        VText(
          data.title,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 20.0),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              VText("Details:"),
              VText(state.data?.title),
            ],
          ),
        ),
      ],
    );
  }
}
