import 'package:city/pages/home_page.dart';
import 'package:city/shared/image/text_label.dart';
import 'package:flutter/material.dart';

import '../shared/image/colors.dart';

class DadosPet extends StatefulWidget {
  const DadosPet({
    Key? key,
  }) : super(key: key);

  @override
  State<DadosPet> createState() => _DadosPetState();
}

class _DadosPetState extends State<DadosPet> {
  TextEditingController emailController = TextEditingController();
  var nomeController = TextEditingController(text: "");
  var pesoController = TextEditingController(text: "");
  var racaController = TextEditingController(text: "");
  var opcaoController = TextEditingController(text: "");
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: const Text(
          "Perfil Pet",
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: ligthCoral,
                        borderRadius: BorderRadius.circular(20)),
                    height: 160,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 130),
                    child: const CircleAvatar(
                      backgroundColor: whiteColor,
                      radius: 55,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("assets/images/pet.png"),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Cazé",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    decoration: TextDecoration.underline),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 20, 10),
              child: Container(
                height: 550,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  child: ListView(
                    children: [
                      const TextLabel(texto: "Nome"),
                      TextField(
                        controller: nomeController,
                        style: const TextStyle(color: darkGreyColor),
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.edit),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: darkGreyColor,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: ligthCoral,
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const TextLabel(texto: "Peso"),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: pesoController,
                        style: const TextStyle(color: darkGreyColor),
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.edit),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: darkGreyColor,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: ligthCoral,
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const TextLabel(texto: "Especie"),
                      TextField(
                        controller: racaController,
                        style: const TextStyle(color: darkGreyColor),
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.edit),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: darkGreyColor,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: ligthCoral,
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const TextLabel(
                          texto:
                              "Seu animalzinho está apto para realizar uma doaçāo de sangue?"),
                      TextField(
                        controller: opcaoController,
                        style: const TextStyle(color: darkGreyColor),
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.edit),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: darkGreyColor,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: ligthCoral,
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            loading =
                                false; //sempre que clicar o botao, limpa a var pra ter certeza q ta falso
                          });

                          if (nomeController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: errorColor,
                                content: Text(
                                  'o nome precisa ser preenchido',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                            );
                            return;
                          } else {
                            print(nomeController.text);
                          }

                          if (pesoController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: errorColor,
                                content: Text(
                                  'insira um peso',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                            );
                            return;
                          } else {
                            print(pesoController);
                          }
                          if (racaController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: errorColor,
                                content: Text(
                                  'insira a especie',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                            );
                            return;
                          } else {
                            print(racaController);
                          }
                          if (opcaoController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: errorColor,
                                content: Text(
                                  'insira se ele está apto ou nāo',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                            );
                            return;
                          } else {
                            print(opcaoController);
                          }

                          setState(() {
                            loading = true;
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ));

                          Future.delayed(const Duration(seconds: 2), () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('salvo com sucesso'),
                              ),
                            );

                            Navigator.pop(context);
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(ligthCoral),
                        ),
                        child: const Text(
                          "Salvar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
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
  }
}
