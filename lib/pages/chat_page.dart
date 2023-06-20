import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kurir_sbw/common/assets.dart';
import 'package:kurir_sbw/common/constant.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<types.Message> messages = [];
  final user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');

  String randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  void addMessage(types.Message message) {
    setState(() {
      messages.insert(0, message);
    });
  }

  void handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

    addMessage(textMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Riswanto',
            style: whiteTextStyle.copyWith(fontSize: 16),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Online',
            style: whiteTextStyle.copyWith(fontSize: 14),
          ),
        ]),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SvgPicture.asset(
              callIcon,
              height: 30,
              // ignore: deprecated_member_use
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Chat(
        theme: DefaultChatTheme(
          primaryColor: kLightBlue,
          inputBackgroundColor: kDarkGreen,
          inputTextColor: Colors.white,
          sendButtonIcon: SvgPicture.asset(sendIcon),
          inputBorderRadius: BorderRadius.zero,
          attachmentButtonIcon: SvgPicture.asset(photoCamera),
          dateDividerMargin: const EdgeInsets.only(
            bottom: 8,
          ),
          dateDividerTextStyle: blackTextStyle.copyWith(
            fontSize: 12,
            fontWeight: bold,
          ),
          inputTextStyle: blackTextStyle.copyWith(
            fontWeight: medium,
          ),
          emptyChatPlaceholderTextStyle: blackTextStyle.copyWith(
            fontWeight: medium,
          ),
          sentMessageBodyTextStyle: blackTextStyle.copyWith(
            fontWeight: medium,
          ),
          receivedMessageBodyTextStyle: blackTextStyle.copyWith(
            fontWeight: medium,
          ),
          backgroundColor: Colors.grey.shade100,
        ),
        messages: messages,
        onSendPressed: handleSendPressed,
        onAttachmentPressed: () {},
        user: user,
      ),
    );
  }
}
