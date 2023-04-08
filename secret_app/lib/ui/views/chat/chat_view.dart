import 'package:flutter/material.dart';
import 'package:secret_app/models/appuser.dart';
import 'package:secret_app/models/chat.dart';
import 'package:secret_app/models/chat_message.dart';
import 'package:secret_app/ui/common/app_colors.dart';
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<int>(
                  value: viewModel.securityLevel,
                  iconEnabledColor: kcPrimaryColor,
                  underline: Container(),
                  onChanged: viewModel.setSecurityLevel,
                  // style: TextStyle(color: Colors.white),
                  items: viewModel.securityLevels
                      .map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(
                        "Security level $value",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
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
                            user: viewModel.user!,
                            message: viewModel.textDecrypt(chatMessage.message),
                            messageSender:
                                viewModel.getUser(chatMessage.senderId),
                            chatMessage: chatMessage,
                            onDelete: () {
                              viewModel.deleteMessage(chatMessage);
                            },
                          );
                        },
                      ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).dividerColor,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: viewModel.messageController,
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Send a message...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: viewModel.sendMessage,
                  ),
                ],
              ),
            ),
          ),
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

class MessageTile extends StatelessWidget {
  final String message;
  final AppUser user;
  final AppUser messageSender;
  final ChatMessage chatMessage;
  final VoidCallback onDelete;
  const MessageTile({
    Key? key,
    required this.message,
    required this.user,
    required this.messageSender,
    required this.chatMessage,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:
          chatMessage.securityLevel == 0 ? Text(message) : const Text('Locked'),
      subtitle: Text(messageSender.fullName),
      leading: CircleAvatar(
        backgroundImage: messageSender.photoUrl != "nil"
            ? NetworkImage(messageSender.photoUrl)
            : null,
        child: messageSender.photoUrl == "nil"
            ? Text(messageSender.fullName[0])
            : null,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (chatMessage.securityLevel > 0)
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.lock),
            ),
          if (chatMessage.senderId == user.id)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: onDelete,
            ),
        ],
      ),
    );
  }
}
