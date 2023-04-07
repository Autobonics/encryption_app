import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:secret_app/ui/common/app_colors.dart';
import 'package:secret_app/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Secure App',
        ),
        actions: [
          if (viewModel.user != null)
            IconButton(
              onPressed: viewModel.logout,
              icon: const Icon(Icons.logout),
            )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // MaterialButton(
                //     color: Colors.black,
                //   onPressed: viewModel.incrementCounter,
                //   child: Text(
                //     viewModel.counterLabel,
                //     style: const TextStyle(color: Colors.white),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) => viewModel.onModelReady();
}
