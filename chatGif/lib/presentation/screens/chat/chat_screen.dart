import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_ejemplo/domain/dtos/message.dart';
import 'package:yes_no_ejemplo/presentation/providers/chats/chat_provider.dart';
import 'package:yes_no_ejemplo/presentation/widgets/chat/message_bubble.dart';
import 'package:yes_no_ejemplo/presentation/widgets/shared/message_field_box.dart';
import 'package:yes_no_ejemplo/presentation/widgets/herBar/her_presentation.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
/*Aqui esta lo bueno, pues, aqui creo que me complique yo solo ocuparia preguntarle al profe xd, pq para darle la imagen de fondo y cargar el body, pues ocupo el Scaffold,
 Pero para darle la imagen de fondo solo tenia el ejemplo del AppBar, asi que  lo cubri con un MaterialApp  y a la propiedad de home le puse un Conatiner para definer la imagen de fondo
 y con el fit: ya recubres toda la panatalla que ocupas, en el child le di el Scaffold donde esta el titulo que le quiere dar al AppBar asi como el url del avatar que le quieras poner
  y en el body ya le das el chat View
  De este modo ya le pude dar la imagen de fondo, pero jajaj, el MessageTextField Perdio su color, ocupo ver que onda ahi*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://img.freepik.com/premium-vector/seamless-christmas-nature-pattern-winter-forest-dark-blue-red-colours-trees-snow-night-black-background-fabric-material-packaging-wallpaper-design-textiles-vector-illustration_510988-420.jpg'),
              fit: BoxFit.cover),
        ),
        child: const Scaffold(
            backgroundColor: Colors.transparent,
            appBar: HerPresentation(
              nombre: 'Ask to Jack ',
              urlAvatar:
                  'https://www.looper.com/img/gallery/the-ending-of-the-nightmare-before-christmas-explained/l-intro-1669091105.jpg',
            ),
            body: ChatView()),
      ),
    );
  }
}

//Aqui lo deje igual, las propiedades de decoracion no se definen aqui

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(
                          message: message.text, urlGif: message.imageUrl)
                      : MyMessageBubble(message: message.text);
                },
              ),
            ),
            MessageFieldBox(onValue: chatProvider.sendMessage),
          ],
        ),
      ),
    );
  }
}







/*
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: HerPresentation(
          nombre: 'Ask to Santa Claus',
          urlAvatar:
              'https://media.tenor.com/hSEHY5EI0CIAAAAi/santa-dance-christmas-music.gif',
        ),
        body: ChatView());
  }
}

*/

//https://img.freepik.com/premium-vector/seamless-christmas-nature-pattern-winter-forest-dark-blue-red-colours-trees-snow-night-black-background-fabric-material-packaging-wallpaper-design-textiles-vector-illustration_510988-420.jpg
