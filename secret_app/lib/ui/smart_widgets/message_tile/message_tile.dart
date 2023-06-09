import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';
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
  const MessageTile({
    Key? key,
    required this.chat,
    required this.user,
    required this.messageSender,
    required this.chatMessage,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MessageTileModel viewModel,
    Widget? child,
  ) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      child: Column(
        children: [
          if (viewModel.isUnlocked &&
              viewModel.file == null &&
              chatMessage.fileLink != '')
            const Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          else if (viewModel.file != null &&
              (chatMessage.fileFormat == "jpg" ||
                  chatMessage.fileFormat == "png"))
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(viewModel.file!),
            )
          else if (viewModel.file != null &&
              (chatMessage.fileFormat != "jpg" &&
                  chatMessage.fileFormat != "png"))
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      onPressed: () {
                        OpenFile.open(viewModel.file!.path);
                      },
                      child: Card(
                          color: kcPrimaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Open ${chatMessage.fileFormat} file",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ListTile(
            title: viewModel.isUnlocked
                ? chatMessage.message != ""
                    ? Text(viewModel.textDecrypt(chatMessage.message))
                    : null
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
                if (!viewModel.isBusy && chatMessage.senderId == user.id)
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: viewModel.deleteMessage,
                  ),
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
                      color: chatMessage.securityLevel == 1
                          ? Colors.green
                          : Colors.red,
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(Icons.check_circle_outline,
                        color: chatMessage.securityLevel == 0
                            ? null
                            : chatMessage.securityLevel == 1
                                ? Colors.green
                                : Colors.red),
                  ),
              ],
            ),
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
