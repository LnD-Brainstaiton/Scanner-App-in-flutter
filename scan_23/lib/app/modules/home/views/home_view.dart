import 'package:flutter/material.dart';
import '/app/core/base/base_view.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widget/paging_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return PagingView(
      onRefresh: () async {
        controller.onRefreshPage();
      },
      onLoadNextPage: () {
        controller.onLoadNextPage();
      },
      child: const Padding(
        padding: EdgeInsets.all(AppValues.padding),
        child: Center(
          child: Text('Hello Flutter!'),
        )
      ),
    );
  }
}
