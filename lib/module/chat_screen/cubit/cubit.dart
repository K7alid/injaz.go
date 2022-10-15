import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injaz_go/module/chat_screen/chat_model.dart';
import 'package:injaz_go/module/chat_screen/cubit/states.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(AppInitialState());

  static ChatCubit get(context) => BlocProvider.of(context);

  sendMessage(String message) {
    chats.add(Chat(
      name: 'Khalid',
      image: Chat.getImage(true),
      message: message,
      time: 'from now',
      isMe: true,
    ));
    emit(AppChatSendMessageState());
  }
}
