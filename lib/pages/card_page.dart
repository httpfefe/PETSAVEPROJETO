import 'package:city/shared/image/colors.dart';

import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 30,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/perfil3.jpg"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                      color: ligthCoral,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                        style: TextStyle(color: whiteColor, fontSize: 14),
                        'O Border Collie é uma raça conhecida\npor sua inteligência e energia.\nUm Border Collie típico pode viver entre 12\n e 15 anos, sendo que alguns chegam a\n viver até mais tempo,.'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 30,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/perfil2.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: ligthCoral,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'Gatos é uma raça de cães conhecida\npor sua inteligência e energia.\nUm Border Collie típico pode viver entre 12\n e 15 anos, sendo que alguns chegam a\n viver até mais tempo,.',
                      style: TextStyle(color: whiteColor, fontSize: 14),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 30,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/perfiltutor.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: ligthCoral,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                        style: TextStyle(color: whiteColor, fontSize: 14),
                        'Os cachorros sao conhecidos por sua\ninteligência e energia.\nUm Border Collie típico pode viver entre 12\n e 15 anos, sendo que alguns chegam a\n viver até mais tempo,.'),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
