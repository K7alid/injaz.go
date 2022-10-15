import 'package:injaz_go/shared/constants.dart';

class Chat {
  final String name;
  final String message;
  final String time;
  final String image;
  final bool isMe;

  Chat({
    required this.name,
    required this.image,
    required this.message,
    required this.time,
    required this.isMe,
  });
  static getImage(bool isMe) {
    if (isMe) {
      return '${assetImageBaseUrl}me.jpg';
    }
    return '${assetImageBaseUrl}otherPerson.jpg';
  }
}

List<Chat> chats = [
  Chat(
    name: 'Khalid',
    message: 'Eng Johary I have finished chat task',
    time: 'from 10m',
    isMe: true,
    image: Chat.getImage(true),
  ),
  Chat(
    name: 'Eng Johary',
    message: 'Okay now complete our project screens',
    time: 'from 8m',
    isMe: false,
    image: Chat.getImage(false),
  ),
  Chat(
    name: 'Eng Johary',
    message: 'But please do what I want not what Eng mahmoud salah wants',
    time: 'from 8m',
    isMe: false,
    image: Chat.getImage(false),
  ),
  Chat(
    name: 'Khalid',
    message:
        'Okay I\'m gonna finish it but tomorrow I have to go to my college',
    time: 'from 7m',
    isMe: true,
    image: Chat.getImage(true),
  ),
  Chat(
    name: 'Eng Johary',
    message: 'Okay never mind we can continue after ur college',
    time: 'from 6m',
    isMe: false,
    image: Chat.getImage(false),
  ),
  Chat(
    name: 'Khalid',
    message: 'Okay cool but I\'m gonna stay there for two days',
    time: 'from 5m',
    isMe: true,
    image: Chat.getImage(true),
  ),
  Chat(
    name: 'Eng Johary',
    message: 'Can\'t u finish it there?',
    time: 'from 2m',
    isMe: false,
    image: Chat.getImage(false),
  ),
  Chat(
    name: 'Khalid',
    message: 'No, I can\'t because there will not be any internet',
    time: 'from 1m',
    isMe: true,
    image: Chat.getImage(true),
  ),
  Chat(
    name: 'Eng Johary',
    message: 'Okay no problem',
    time: 'from now',
    isMe: false,
    image: Chat.getImage(false),
  ),
];
