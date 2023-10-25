import 'package:flutter/material.dart';

class HerPresentation extends StatelessWidget implements PreferredSizeWidget {
  final String nombre;
  final String urlAvatar;

  const HerPresentation({
    super.key,
    this.nombre = 'Santaaaa',
    this.urlAvatar = 'https://i.gifer.com/ZgUz.gif',
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(3.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(urlAvatar),
        ),
      ),
      title: Text(
          style: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 242, 242, 242),
              fontWeight: FontWeight.bold),
          nombre),
      centerTitle: false,
      actions: const <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(
              "https://media0.giphy.com/media/KtrhyNGwNCSYM4pVRq/giphy.webp?cid=ecf05e470j2ui3tn556nor9jrdq52myiu1t9dbgkhvqzb6wa&ep=v1_gifs_search&rid=giphy.webp&ct=g"),
        ),
      ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            image: DecorationImage(
                image: NetworkImage('https://i.gifer.com/5WWU.gif'),
                fit: BoxFit.cover),
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 58, 32, 79),
              Color.fromARGB(255, 37, 40, 80),
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
      ),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  // ignore: todo
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

//https://png.pngtree.com/background/20210714/original/pngtree-merry-christmas-wallpaper-decoration-picture-image_1234795.jpg

//https://png.pngtree.com/background/20210714/original/pngtree-christmas-background-creative-christmas-wallpaper-background-picture-image_1231926.jpg