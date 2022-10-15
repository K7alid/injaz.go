import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injaz_go/module/chat_screen/chat_model.dart';
import 'package:injaz_go/module/chat_screen/cubit/cubit.dart';
import 'package:injaz_go/module/chat_screen/cubit/states.dart';
import 'package:injaz_go/shared/components.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';

class ChatScreen extends StatelessWidget {
  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ChatCubit(),
      child: BlocConsumer<ChatCubit, ChatStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: chatColor,
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 70, bottom: 70, start: 20),
                    child: CustomText(
                      text: 'Welcome, Let us help you?',
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(35),
                            topEnd: Radius.circular(35)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                itemBuilder: (context, index) =>
                                    buildChatContainer(index),
                                separatorBuilder: (context, index) =>
                                    spaceInHeight(height: 25),
                                itemCount: chats.length,
                              ),
                            ),
                            Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: EdgeInsets.all(7),
                              child: ListView(
                                reverse: true,
                                children: <Widget>[
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Enter anything',
                                    ),
                                    onFieldSubmitted: (value) {
                                      ChatCubit.get(context).sendMessage(value);
                                      messageController.clear();
                                    },
                                    controller: messageController,
                                  ),
                                ].reversed.toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget buildChatContainer(index) => Column(
      children: [
        Row(
          mainAxisAlignment: chats[index].isMe
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            chats[index].isMe
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: chats[index].name,
                        size: 14,
                      ),
                      CustomText(
                        text: chats[index].time,
                        size: 10,
                      ),
                    ],
                  )
                : Container(),
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(Chat.getImage(chats[index].isMe)),
            ),
            spaceInWidth(width: 10),
            chats[index].isMe
                ? Container()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: chats[index].name,
                        size: 14,
                      ),
                      CustomText(
                        text: chats[index].time,
                        size: 10,
                      ),
                    ],
                  ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: chats[index].isMe ? chatColor : Colors.grey[400],
            borderRadius: chats[index].isMe
                ? BorderRadiusDirectional.only(
                    topStart: Radius.circular(15),
                    bottomEnd: Radius.circular(15),
                    bottomStart: Radius.circular(15),
                  )
                : BorderRadiusDirectional.only(
                    topEnd: Radius.circular(15),
                    bottomEnd: Radius.circular(15),
                    bottomStart: Radius.circular(15),
                  ),
          ),
          padding: EdgeInsets.all(10),
          child: Expanded(
            child: CustomText(
              text: chats[index].message,
              color: chats[index].isMe ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
