import 'package:flutter/material.dart';
import 'package:secret_app/models/chat.dart';
import 'package:stacked/stacked.dart';

import 'chat_viewmodel.dart';

class ChatView extends StackedView<ChatViewModel> {
  final Chat chat;
  const ChatView({Key? key, required this.chat}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChatViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: viewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : viewModel.data?.isEmpty ?? true
                ? const Center(child: Text('No chats yet'))
                : ListView.builder(
                    itemCount: viewModel.data?.length,
                    itemBuilder: (context, index) {
                      final chat = viewModel.data![index];
                      // return ChatListTile(
                      //   chat: chat,
                      //   onTap: (Chat) {},
                      // );
                    },
                  ),
      ),
    );
  }

  @override
  ChatViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatViewModel();

  @override
  void onViewModelReady(ChatViewModel viewModel) =>
      viewModel.onModelReady(chat);
}
