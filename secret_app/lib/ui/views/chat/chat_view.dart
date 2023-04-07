import 'package:flutter/material.dart';
import 'package:secret_app/models/chat.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'chat_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'message',
  ),
])
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
                          return ListTile(
                            title: Text(chatMessage.message),
                            subtitle: Text(chatMessage.senderId),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                viewModel.deleteMessage(chatMessage);
                              },
                            ),
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

    // return Scaffold(
    //   backgroundColor: Theme.of(context).backgroundColor,
    //   body: Center(
    //     child: viewModel.isBusy
    //         ? const Center(child: CircularProgressIndicator())
    //         : viewModel.data?.isEmpty ?? true
    //             ? const Center(child: Text('No chats yet'))
    //             : ListView.builder(
    //                 itemCount: viewModel.data?.length,
    //                 itemBuilder: (context, index) {
    //                   final chat = viewModel.data![index];
    //                   // return ChatListTile(
    //                   //   chat: chat,
    //                   //   onTap: (Chat) {},
    //                   // );
    //                 },
    //               ),
    //   ),
    // );
  }

  @override
  ChatViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatViewModel(chat: chat);

  // @override
  // void onViewModelReady(ChatViewModel viewModel) =>
  //     viewModel.onModelReady(chat);
}
