import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receptyUser/core/constants/app_strings.dart';
import 'package:receptyUser/features/components/custom_progress_loader.dart';
import 'package:receptyUser/features/components/custom_snackbar.dart';
import 'package:receptyUser/features/components/my_context.dart';
import 'package:receptyUser/features/screens/blogs/cubit/blogs_cubit.dart';
import 'package:receptyUser/features/screens/blogs/cubit/blogs_state.dart';
import 'package:receptyUser/features/screens/blogs/view/blog_details.dart';
import 'package:receptyUser/features/screens/home/widget/news_card.dart';

class BlogsHomepage extends StatefulWidget {
  const BlogsHomepage({Key? key}) : super(key: key);

  @override
  State<BlogsHomepage> createState() => _BlogsHomepageState();
}

class _BlogsHomepageState extends State<BlogsHomepage> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    context.read<BlogsCubit>().getBlogs();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlogsCubit, BlogsState>(
      listener: (context, state) {
        if (state.status == BlogsStatus.loading) {
          showProgressDialog();
          log("loading state...........");
        } else if (state.status == BlogsStatus.success) {
          dismissProgressDialog();
        } else if (state.status == BlogsStatus.blogsDeleteSuccess) {
          context.read<BlogsCubit>().getBlogs().then((value) {
            dismissProgressDialog();
            showCustomSnackBar(
                context: context, message: state.message, isError: false);
          });
        } else {
          dismissProgressDialog();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.allBlogs.tr()),
          ),
          body: ListView.builder(
            padding: EdgeInsets.all(10),
              itemCount: state.blogsModel?.blogs?.length ?? 0,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    GetContext.to(BlogsDetailPage(blogs: state.blogsModel?.blogs?[index],));
                  },
                  child: NewsCard(
                    title: state.blogsModel?.blogs?[index].name,
                    description: state.blogsModel?.blogs?[index].description,
                    image: state.blogsModel?.blogs?[index].image,
                  ),
                );
              }),
        );
      },
    );
  }
}
