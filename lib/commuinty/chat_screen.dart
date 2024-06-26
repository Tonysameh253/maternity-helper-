import 'package:maternityhelperap/commuinty/dummy_data.dart';
import 'package:maternityhelperap/src/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}
class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController sendMessageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mother/'s Experince Chat",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w200,
            color: Color(0xFF806BB2),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                if (messagesList[index].senderId == myId) {
                  return buildMyMessage(context, index);
                } else {
                  return buildSenderMessage(index, context);
                }
              },
              itemCount: messagesList.length,
            ),
          ),
          buildSendMessageWidget(),
        ],
      ),
    );
  }
  Widget buildMyMessage(BuildContext context, int index) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.7,
        ),
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(top: 4, right: 8),
        decoration: BoxDecoration(
          color: Colors.deepPurple[100],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              messagesList[index].text,
            ),
            Text(
              "${messagesList[index].dateTime.hour.toString()}:${messagesList[index].dateTime.minute.toString()}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildSenderMessage(int index, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(messagesList[index].senderImg),
          radius: 25,
        ),
        Container(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * 0.7),
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(top: 8, left: 4, bottom: 8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                messagesList[index].senderName,
                style: const TextStyle(
                  color: Color(0xFF806BB2),
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                messagesList[index].text,
                style: const TextStyle(),
              ),
              Text(
                "${messagesList[index].dateTime.hour.toString()}:${messagesList[index].dateTime.minute.toString()}",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget buildSendMessageWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF806BB2),
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Expanded(child: TextFormField(
            controller: sendMessageController,
            style: const TextStyle(fontWeight: FontWeight.w200),
            decoration: const InputDecoration(
                focusedBorder: InputBorder.none, border: InputBorder.none),
          )),
          IconButton(
              onPressed: () {
                setState(() {
                  messagesList.add(MessageModel(
                      text: sendMessageController.text,
                      senderId: myId,
                      senderImg: '',
                      dateTime: DateTime.now(),
                      senderName: ''));
                });
                sendMessageController.text = '';
                scrollController.animateTo(
                  scrollController.position.maxScrollExtent + 100,
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                );
              },
              icon: const Icon(
                Icons.send_outlined,
                color: Color(0xFF806BB2),
              )),
        ],
      ),
    );
  }
}
