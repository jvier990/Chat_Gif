import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    //final colors = Theme.of(context).colorScheme;
    final focusNode = FocusNode();
    final textControl = TextEditingController();
    final outLineInputBorder = inputBorderCustom();
    final inputDecoration =
        inputDecoradorCustom(outLineInputBorder, textControl);

    void fieldSubmitCustom(textValue) {
      // valor al dar submit
      onValue(textValue);
      textControl.clear();
      focusNode.requestFocus();
    }

    return Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            image: DecorationImage(
                image: NetworkImage('https://i.gifer.com/5WWU.gif'),
                fit: BoxFit.cover),
            gradient: LinearGradient(colors: [
              Colors.deepPurple,
              Color.fromARGB(255, 58, 32, 79),
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        child: TextFormField(
          style: const TextStyle(
            fontSize: 15,
            color: Color.fromARGB(255, 242, 242, 242),
          ),
          onTapOutside: (event) => focusNode.unfocus(),
          focusNode: focusNode,
          controller: textControl,
          decoration: inputDecoration,
          onFieldSubmitted: fieldSubmitCustom,
          //onChanged: (value) {
          //valores de tecla por tecla
          //},
        ));
  }

  UnderlineInputBorder inputBorderCustom() {
    return UnderlineInputBorder(borderRadius: BorderRadius.circular(40));
  }

  InputDecoration inputDecoradorCustom(UnderlineInputBorder outLineInputBorder,
      TextEditingController textControl) {
    return InputDecoration(
      hintText: 'End your message with a "?"',
      hintStyle: const TextStyle(
        fontSize: 15,
        color: Color.fromARGB(80, 242, 242, 242),
      ),
      enabledBorder: outLineInputBorder,
      focusedBorder: outLineInputBorder,
      filled: true,
      suffixIcon: IconButton(
          icon: const Icon(
            Icons.send_outlined,
            color: Color.fromARGB(214, 255, 255, 255),
            shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 2.0)],
          ),
          onPressed: () {
            //valor de la caja de texto
            final textValue = textControl.value.text;
            onValue(textValue);
            textControl.clear();
          }),
    );
  }
}
