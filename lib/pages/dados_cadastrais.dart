import 'package:flutter/material.dart';

import '../shared/image/colors.dart';
import '../shared/image/text_label.dart';
import 'apresentacao.dart';

class DadosCadastrais extends StatefulWidget {
  const DadosCadastrais({
    Key? key,
  }) : super(key: key);

  @override
  State<DadosCadastrais> createState() => _DadosCadastraisState();
}

class _DadosCadastraisState extends State<DadosCadastrais> {
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  var cidadeController = TextEditingController(text: "");
  var phoneController = TextEditingController(text: "");

  DateTime? dataNascimento;

  bool loading = false;
  //ao inves de variaves, usamos o texteditingcontroller para salvar oq foi digitado no input
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController repitaSenhaController = TextEditingController();
  String errorMsg = '';

  String? validadeLogin(String? value) {
    if (emailController.text.isEmpty) {
      return 'entre com um email valido';
    }
    if (senhaController.text.isEmpty) {
      return 'uma senha valida';
    }

    return null;
  }

  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ligthCoral,
        title: const Text("Cadastro do tutor"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  const TextLabel(texto: "Nome"),
                  TextField(
                    controller: nomeController,
                    style: const TextStyle(color: darkGreyColor),
                    decoration: const InputDecoration(
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
                  const TextLabel(texto: "Senha"),
                  TextField(
                      controller: senhaController,
                      obscureText: isObscureText,
                      onChanged: (value) {
                        print(senhaController);
                      },
                      style: const TextStyle(color: darkGreyColor),
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: darkGreyColor,
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: ligthCoral,
                        )),
                        hintStyle: const TextStyle(color: darkGreyColor),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            child: Icon(isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility)),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextLabel(texto: "Repita a senha"),
                  TextField(
                      controller: repitaSenhaController,
                      obscureText: isObscureText,
                      onChanged: (value) {
                        print(senhaController);
                      },
                      style: const TextStyle(color: darkGreyColor),
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: darkGreyColor,
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: ligthCoral,
                        )),
                        hintStyle: const TextStyle(color: darkGreyColor),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            child: Icon(isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility)),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 30,
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
                                  fontSize: 20, fontStyle: FontStyle.normal),
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
                                  fontSize: 20, fontStyle: FontStyle.normal),
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
                                  fontSize: 20, fontStyle: FontStyle.normal),
                            ),
                          ),
                        );
                        return;
                      } else {
                        print(phoneController);
                      }

                      //apos validar tudo, seta loading pra true e salva
                      setState(() {
                        loading = true;
                      });
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Apresentacao(),
                          ));
                      // print('salvo');
                      //apos salvar executa o delayed com setstate e loading para de salvar/carregar
                      //e fecha a tela
                      Future.delayed(const Duration(seconds: 2), () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('cadastrado com sucesso'),
                          ),
                        );
                        //setstate aqui é desnecessario
                        // setState(() {
                        //   loading = false;
                        // });
                        Navigator.pop(context);
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(ligthCoral),
                    ),
                    child: const Text(
                      "Cadastrar",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
