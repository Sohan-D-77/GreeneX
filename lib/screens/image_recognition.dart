import 'package:flutter/material.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import '../consts.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import '../main.dart';

class ChatbotScreen extends StatelessWidget {
  final _openAI = OpenAI.instance.build(
    token: OPENAI_API_KEY,
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 5),
    ),
    enableLog: true,
  );

  final ChatUser _user = ChatUser(
    id: '1',
    firstName: 'Charles',
    lastName: 'Leclerc',
  );

  final ChatUser _gptChatUser = ChatUser(
    id: '2',
    firstName: 'Chat',
    lastName: 'GPT',
  );

  final ValueNotifier<List<ChatMessage>> _messages = ValueNotifier([
    ChatMessage(
      text: 'Hey!',
      user: ChatUser(
        id: '1',
        firstName: 'Charles',
        lastName: 'Leclerc',
      ),
      createdAt: DateTime.now(),
    )
  ]);

  final ValueNotifier<List<ChatUser>> _typingUsers = ValueNotifier([]);
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  ChatbotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 166, 126, 1),
        title: const Text(
          'GPT Chat',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ValueListenableBuilder<List<ChatMessage>>(
        valueListenable: _messages,
        builder: (context, messages, _) {
          return DashChat(
            currentUser: _user,
            messageOptions: const MessageOptions(
              currentUserContainerColor: Colors.black,
              containerColor: Color.fromRGBO(0, 166, 126, 1),
              textColor: Colors.white,
            ),
            onSend: (ChatMessage m) {
              _getChatResponse(m);
            },
            messages: messages,
            typingUsers: _typingUsers.value,
          );
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _currentIndex,
        builder: (context, currentIndex, _) {
          return BottomNavigationBar(
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              _currentIndex.value = index;
              if (_currentIndex.value == 0) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              }
              // Handle other index cases as needed
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Centers'),
              BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Grid'),
              BottomNavigationBarItem(icon: Icon(Icons.gamepad), label: 'Games'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Shop'),
            ],
          );
        },
      ),
    );
  }

  Future<void> _getChatResponse(ChatMessage message) async {
    _messages.value = List.from(_messages.value)..insert(0, message);
    _typingUsers.value = List.from(_typingUsers.value)..add(_gptChatUser);

    List<Map<String, dynamic>> messagesHistory = _messages.value.reversed.map((m) {
      return (m.user == _user)
          ? Messages(role: Role.user, content: m.text).toJson()
          : Messages(role: Role.assistant, content: m.text).toJson();
    }).toList();

    final request = ChatCompleteText(
      messages: messagesHistory,
      maxToken: 200,
      model: GptTurbo0301ChatModel(),
    );
    final response = await _openAI.onChatCompletion(request: request);

    if (response != null) {
      for (var element in response.choices) {
        if (element.message != null) {
          _messages.value = List.from(_messages.value)
            ..insert(
              0,
              ChatMessage(
                user: _gptChatUser,
                createdAt: DateTime.now(),
                text: element.message!.content,
              ),
            );
        }
      }
    }

    _typingUsers.value = List.from(_typingUsers.value)..remove(_gptChatUser);
  }
}
