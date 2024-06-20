import 'package:flutter/material.dart';

import '../repository/donor_repository.dart';
import '../repository/tipo_repository.dart';
import '../shared/image/colors.dart';
import '../shared/image/text_label.dart';

class DadosCadastraisPet extends StatefulWidget {
  const DadosCadastraisPet({
    Key? key,
  }) : super(key: key);

  @override
  State<DadosCadastraisPet> createState() => _DadosCadastraisPetState();
}

class _DadosCadastraisPetState extends State<DadosCadastraisPet> {
  var nomeController = TextEditingController(text: "");
  var idadePetController = TextEditingController(text: "");
  var pesoPetController = TextEditingController(text: "");
  var racaController = TextEditingController(text: "");
  var descricaoController = TextEditingController(text: "");

  var tipoRepository = TipoRepository();
  var donorRepository = DonorRepository();
  var tipo = [];
  var opcao = [];
  var tipoSelecionado = "";
  var opcaoSelecionada = "";
  double salarioEscolhido = 0;
  int tempoExperiencia = 0;
  bool loading = false;

  @override
  void initState() {
    tipo = tipoRepository.retornaTipo;
    opcao = donorRepository.retornaOpcao();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ligthCoral,
        title: const Text(
          "Dados do Pet",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  const TextLabel(texto: "Nome do Pet"),
                  TextField(
                    controller: nomeController,
                    keyboardType: TextInputType.name,
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
                  const TextLabel(texto: "Idade do Pet"),
                  TextField(
                    controller: idadePetController,
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
                  const TextLabel(texto: "Peso"),
                  TextField(
                    controller: pesoPetController,
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
                  const TextLabel(texto: "Raça"),
                  TextField(
                    controller: racaController,
                    keyboardType: TextInputType.name,
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
                  const TextLabel(texto: "Especie"),
                  Column(
                    children: tipo
                        .map(
                          (tipo) => RadioListTile(
                            activeColor: ligthCoral,
                            title: Text(
                              tipo.toString(),
                            ),
                            dense: true,
                            value: tipo.toString(),
                            groupValue:
                                tipoSelecionado, //recebe o nivel selecionado
                            selected: false,
                            onChanged: (tipo) {
                              setState(
                                () {
                                  tipoSelecionado = tipo
                                      .toString(); //nivelSelecionado recebe o valor selecionado
                                },
                              );
                            },
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const TextLabel(
                      texto:
                          "Seu animalzinho está apto para realizar uma doaçāo de sangue?"),
                  Column(
                    children: opcao
                        .map(
                          (opcao) => RadioListTile(
                            activeColor: ligthCoral,
                            title: Text(
                              opcao.toString(),
                            ),
                            dense: true,
                            value: opcao.toString(),
                            groupValue:
                                opcaoSelecionada, //recebe o nivel selecionado
                            selected: false,
                            onChanged: (opcao) {
                              setState(
                                () {
                                  opcaoSelecionada = opcao
                                      .toString(); //nivelSelecionado recebe o valor selecionado
                                },
                              );
                            },
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const TextLabel(texto: "Fale um pouco sobre seu pet: "),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLines: 5,
                    controller: descricaoController,
                    keyboardType: TextInputType.name,
                    style: const TextStyle(color: darkGreyColor),
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: darkGreyColor),
                        borderRadius: BorderRadius.all(
                          Radius.circular(3),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: ligthCoral,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      filled: true,
                      fillColor: whiteColor,
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(
                        () {
                          loading =
                              false; //sempre que clicar o botao, limpa a var pra ter certeza q ta falso
                        },
                      );
                      if (nomeController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: errorColor,
                            content: Text(
                              'O nome precisa ser preenchido',
                              style: TextStyle(
                                  fontSize: 20, fontStyle: FontStyle.normal),
                            ),
                          ),
                        );
                        return;
                      } else {
                        print(nomeController.text);
                      }

                      if (tipoSelecionado.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: errorColor,
                            content: Text(
                              'selecione uma especie',
                              style: TextStyle(
                                  fontSize: 20, fontStyle: FontStyle.normal),
                            ),
                          ),
                        );
                        return;
                      } else {
                        print(tipoSelecionado);
                      }
                      if (opcaoSelecionada.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: errorColor,
                            content: Text(
                              'selecione ao menos uma opçāo',
                              style: TextStyle(
                                  fontSize: 20, fontStyle: FontStyle.normal),
                            ),
                          ),
                        );
                        return;
                      } else {
                        print((opcaoSelecionada));
                      }

                      //apos validar tudo, seta loading pra true e salva
                      setState(() {
                        loading = true;
                      });
                      // print('salvo');
                      //apos salvar executa o delayed com setstate e loading para de salvar/carregar
                      //e fecha a tela
                      Future.delayed(
                        const Duration(seconds: 2),
                        () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('dados salvos com sucesso'),
                            ),
                          );
                          Navigator.pop(context);
                        },
                      );
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
