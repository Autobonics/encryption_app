import 'package:flutter/material.dart';
import 'package:secret_app/models/chat.dart';
import 'package:secret_app/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

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
            CircleAvatar(
              radius: 18,
              backgroundImage: viewModel.user!.photoUrl != "nil"
                  ? NetworkImage(viewModel.user!.photoUrl)
                  : null,
              child: viewModel.user!.photoUrl == "nil"
                  ? Text(viewModel.user!.fullName[0])
                  : null,
            ),
          if (viewModel.user != null)
            IconButton(
              onPressed: viewModel.logout,
              icon: const Icon(Icons.logout),
            )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kcPrimaryColor,
        onPressed: viewModel.showBottomSheetUserSearch,
        label: Row(
          children: const [
            Text('New chat'),
            Icon(Icons.add_circle),
          ],
        ),
      ),
      body: Center(
        child: viewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : viewModel.data?.isEmpty ?? true
                ? const Center(child: Text('No chats yet'))
                : ListView.builder(
                    itemCount: viewModel.data?.length,
                    itemBuilder: (context, index) {
                      final chat = viewModel.data![index];
                      return ChatListTile(
                        chat: chat,
                        onTap: viewModel.navigateToChat,
                      );
                    },
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

class ChatListTile extends StatelessWidget {
  final Chat chat;
  final Function(Chat) onTap;

  const ChatListTile({
    Key? key,
    required this.chat,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(chat.name),
        // subtitle: Text(chat.email),
        leading: CircleAvatar(
            // backgroundImage:
            child: Text(chat.name[0])),
        // trailing: const Icon(
        //   Icons.add_box_rounded,
        //   color: kcPrimaryColor,
        // ),
        onTap: () => onTap(chat),
      ),
    );
  }
}
