import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/app/core/base/base_view.dart';
import '/app/core/values/app_values.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/core/widget/paging_view.dart';
import '/app/modules/home/controllers/home_controller.dart';
import '/app/modules/home/widget/item_github_project.dart';

class HomeView extends BaseView<HomeController> {
  HomeView({super.key}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // This will be called after the widget is built
    });
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context, HomeController controller) {
    return CustomAppBar(
      appBarTitleText: '首页',
    );
  }

  @override
  Widget body(BuildContext context, HomeController controller) {
    // Initialize on first build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.projectList.isEmpty) {
        controller.getGithubProjectList();
      }
    });

    return PagingView(
      onRefresh: () async {
        controller.onRefreshPage();
      },
      onLoadNextPage: () {
        controller.onLoadNextPage();
      },
      child: Padding(
        padding: const EdgeInsets.all(AppValues.padding),
        child: Consumer<HomeController>(
          builder: (context, controller, child) {
            return ListView.separated(
              shrinkWrap: true,
              itemCount: controller.projectList.length,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var model = controller.projectList[index];

                return ItemGithubProject(dataModel: model);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: AppValues.smallMargin),
            );
          },
        ),
      ),
    );
  }
}
