//custon d=rawimport 'package:flutter/material.dart';

import 'package:city/pages/home_page.dart';
import 'package:city/shared/image/text_label.dart';
import 'package:flutter/material.dart';

import '../shared/image/colors.dart';

class DadosTutor extends StatefulWidget {
  const DadosTutor({
    Key? key,
  }) : super(key: key);

  @override
  State<DadosTutor> createState() => _DadosTutorState();
}

class _DadosTutorState extends State<DadosTutor> {
  TextEditingController emailController = TextEditingController();
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  var cidadeController = TextEditingController(text: "");
  var phoneController = TextEditingController(text: "");
  bool loading = false;
  DateTime? dataNascimento;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: const Text(
          "Perfil tutor",
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
                    padding: EdgeInsets.only(top: 130),
                    child: const CircleAvatar(
                      backgroundColor: whiteColor,
                      radius: 55,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage("assets/images/perfiltutor.png"),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Ricardo",
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
                      const TextLabel(texto: "Data de nascimento"),
                      TextField(
                        readOnly: true,
                        controller: dataNascimentoController,
                        onTap: () async {
                          var data = await showDatePicker(
                            context: context,
                            initialDate: DateTime(2000, 1,
                                1), //initial e lastDate funcionam como limitadores de datas
                            firstDate: DateTime(1900, 5, 20),
                            lastDate: DateTime(2023, 10, 23),
                          );
                          if (data != null) {
                            dataNascimentoController.text = data
                                .toString(); //se a data nao for nula, passa a data selecionada para o textField
                            dataNascimento = data; //recebe o valor da data
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const TextLabel(texto: "Cidade/Estado"),
                      TextField(
                        controller: cidadeController,
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
                      const TextLabel(texto: "Email"),
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
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
                      const TextLabel(texto: "Telefone para contato"),
                      TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.number,
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
                          if (dataNascimento == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: errorColor,
                                content: Text(
                                  'data de nascimento invalida',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                            );
                            return;
                          } else {
                            print(dataNascimento);
                          }
                          if (phoneController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: errorColor,
                                content: Text(
                                  'insira um telefone',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                            );
                            return;
                          } else {
                            print(phoneController);
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
