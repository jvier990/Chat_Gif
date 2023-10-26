import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  final String message;
  final String? urlGif;
  const HerMessageBubble({super.key, this.message = '', this.urlGif});
//Ah este si le movi, este .dart configura el diseño de la burbuja que te responde el programa
  @override
  Widget build(BuildContext context) {
    /*
     Aqui el profe en la linea de abajp se trae del archivo que esta en config Theme, la paleta de colores y las gaurda en una variable colors,
    Yo como estaba aferradoa a la idea que queria comente la linea y le puse un color propio a cada componente de la burbujita, es la linea de abajo, lo puede comparar con el programa 
    original para ver que show
    */
    //final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // height: 10,
          // width: 10,
          /*Este ejemplo de container decoration -Box decoration me sirvio porque lo volvi usar para el fondo principal y para el AppBar
          Pues aqui es decoration : BoxDecoration, y le agregue una imagen de fondo (un gif de nieve cayendo), del box decoration es image : NetworkImage('Y aqui va el link de la imagen')
          Ya lo demas es color redondear el box del mensaje y el propio mesaje que viene de afuera, y aqui fue todo lo que le cambie xd, Lo demas es funcional
          */
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: NetworkImage('https://i.gifer.com/3klb.gif')),
              color: const Color.fromARGB(255, 129, 16, 12),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message,
                style: const TextStyle(
                  color: Color.fromARGB(255, 242, 242, 242),
                )),
          ),
        ),
        const SizedBox(height: 5),
        _ImageBubble(urlGif: urlGif),
        const SizedBox(height: 10),
      ],
    );
  }
}

//https://i.gifer.com/3klb.gif
class _ImageBubble extends StatelessWidget {
  final String? urlGif;

  const _ImageBubble({this.urlGif});
  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        urlGif!,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) =>
            (loadingProgress == null)
                ? child
                : Container(
                    width: size.width * 0.7,
                    height: 150,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: const Text('cargando la imagen...'),
                  ),
      ),
    );
  }
}
