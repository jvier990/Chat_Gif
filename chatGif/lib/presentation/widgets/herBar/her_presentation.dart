import 'package:flutter/material.dart';

class HerPresentation extends StatelessWidget implements PreferredSizeWidget {
  final String nombre;
  final String urlAvatar;

  const HerPresentation({
    //Aqui no es necesario cambiar nada pq al final de cuentas tu le vas a pasar esos parametros cuando llames a la clase en el chatScreen, asi que solo esto sera definicion el build xd
    super.key,
    this.nombre = 'Santaaaa',
    this.urlAvatar = 'https://i.gifer.com/ZgUz.gif',
  });
/*Aqui esta la configuracion del AppBar, aqui tambien me lleve un ratito para modificarlo 
/para que quedara a mi idea que traia yo, me siento como el mecanico que nomas le pone un parche a la fuga del carro jajajaja, asi se siente el codigo*/
/* Si te das cuenta yo me mame un poquito aqui pq el codigo del profe estaba bien cortito limpio y estructurado yo me ondie e hice un spaguetti PERO QUE A LA IDEA QUE TRAIA YO
(mas o menos xd)*/
  @override
  Widget build(BuildContext context) {
    //del leading hasta center title esta casi igual solo le agregue mas cosas al Text con TextStyle, para que convinara con lo demas
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
      /*Aqui esta lo mio, en actions le puse una lista de Widgets, aunque solo use uno, tenia pensado en agregarle mas cosas navideñas pero aun no se como, o que mas agregarle xd
      Asi que solo tiene un gif de un perrito bien cool
      */
      actions: const <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(
              "https://media0.giphy.com/media/KtrhyNGwNCSYM4pVRq/giphy.webp?cid=ecf05e470j2ui3tn556nor9jrdq52myiu1t9dbgkhvqzb6wa&ep=v1_gifs_search&rid=giphy.webp&ct=g"),
        ),
      ],
      /*Este atributo de flexibleSpace, me permite decorar mas el AppBar, y pues aproveche para poenrle un Container y decorarlo con el espacio que este da
       (Queria que si o si cayera nieve)
      Con el box decoration (Asi como en el her_message_bubble), le di la imagen para un hiciera la simulacion que cayera nieve.
      Aparte encontre esta propiedad (gradient) con la cual puedes hacer un degradado de 2 colores, y bajo esta propiedad puede hacer un begin y end, donde alinias como quieres que sea
      el degradado, vertical, horizontal, nadamas que como todo esto esta en un container es importante que el backgorund del AppBar sea transparente, 
      Y como modificamos tmb el radio de las 2 esquinas de abajo (borderRadius) puede que se vean unas esquinas blancas ahi todas feas blancas
      Pero no pasa nada en el chaScreen le doy un fondo general para que todo se vea cool
      Y creo que es todo en el AppBar
      */
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