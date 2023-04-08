import 'package:flutter/material.dart';
import 'package:secret_app/models/appuser.dart';
import 'package:secret_app/models/chat.dart';
import 'package:secret_app/models/chat_message.dart';
import 'package:secret_app/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'message_tilemodel.dart';

class MessageTile extends StackedView<MessageTileModel> {
  final Chat chat;
  final AppUser user;
  final AppUser messageSender;
  final ChatMessage chatMessage;
  final VoidCallback onDelete;
  const MessageTile({
    Key? key,
    required this.chat,
    required this.user,
    required this.messageSender,
    required this.chatMessage,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MessageTileModel viewModel,
    Widget? child,
  ) {
    return ListTile(
      title: viewModel.isUnlocked
          ? Text(viewModel.textDecrypt(chatMessage.message))
          : const Text('----'),
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
          if (viewModel.isBusy)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 20.0,
                  width: 20.0,
                  child: CircularProgressIndicator(strokeWidth: 2)),
            )
          else if (!viewModel.isUnlocked)
            IconButton(
              onPressed: viewModel.unLock,
              icon: Icon(
                Icons.lock,
                color:
                    chatMessage.securityLevel == 1 ? Colors.green : Colors.red,
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.check_circle_outline,
                  color: chatMessage.securityLevel == 0
                      ? null
                      : chatMessage.securityLevel == 1
                          ? Colors.green
                          : Colors.red),
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

  @override
  MessageTileModel viewModelBuilder(
    BuildContext context,
  ) =>
      MessageTileModel();

  @override
  void onViewModelReady(MessageTileModel viewModel) =>
      viewModel.onModelReady(chat, chatMessage, user);
}
