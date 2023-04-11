import 'package:flutter/material.dart';
import 'package:secret_app/models/appuser.dart';
import 'package:secret_app/models/chat.dart';
import 'package:secret_app/models/chat_message.dart';
import 'package:secret_app/ui/common/app_colors.dart';
import 'package:secret_app/ui/smart_widgets/message_sender/message_sender.dart';
import 'package:secret_app/ui/smart_widgets/message_tile/message_tile.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
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
      appBar: AppBar(
        title: Text(chat.name),
        actions: [
          if (viewModel.receiver != null)
            Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    viewModel.receiver!.fullName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                ),
                SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundImage: viewModel.receiver!.photoUrl != "nil"
                        ? NetworkImage(viewModel.receiver!.photoUrl)
                        : null,
                    child: viewModel.receiver!.photoUrl == "nil"
                        ? Text(viewModel.receiver!.fullName[0])
                        : null,
                  ),
                ),
              ],
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: viewModel.isBusy
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : viewModel.data?.isEmpty ?? true
                    ? const Center(child: Text('No chats yet'))
                    : ListView.builder(
                        itemCount: viewModel.data!.length,
                        reverse: true,
                        itemBuilder: (context, index) {
                          final chatMessage = viewModel.data![index];
                          return MessageTile(
                            key: UniqueKey(),
                            chat: viewModel.chat,
                            user: viewModel.user!,
                            messageSender:
                                viewModel.getUser(chatMessage.senderId),
                            chatMessage: chatMessage,
                          );
                        },
                      ),
          ),
          MessageSender(chat: chat),
        ],
      ),
    );
  }

  @override
  ChatViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatViewModel(chat: chat);

  @override
  void onViewModelReady(ChatViewModel viewModel) => viewModel.onModelReady();
}
