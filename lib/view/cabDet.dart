import 'package:app_login/build/form.dart';
import 'package:app_login/model/cab.dart';
import 'package:app_login/model/globals.dart';
import 'package:flutter/material.dart';

class CabDet extends StatefulWidget {
  final int? pk;
  const CabDet({this.pk, Key? key}) : super(key: key);

  @override
  State<CabDet> createState() => _CabDetState();
}

class _CabDetState extends State<CabDet> {
  Cab objModel = Cab();
  int? pk;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    pk = widget.pk;
    if (pk == null) {
      // cria lista vazia
      objModel.newCab();
    } else {
      // cria lista com os dados
      objModel.oldCab(pk!);
    }
    super.initState();
  }

  @override
  void dispose() {
    objModel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<Object>(
        stream: objModel.stream,
        builder: (context, snapshot) {
          if (objModel.loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: ListView.builder(
                        itemCount: objModel.listController.length,
                        itemBuilder: (value, index) {
                          if (objModel.listController[index]['SHOW_FORM'] == 1) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BuildForm(
                                objModel.listController[index]['CONTROLLER'],
                                hintText: objModel.listController[index]['LABEL'],
                                inputType: objModel.listController[index]['INPUT_FORM'],
                              ),
                            );
                          } else {
                            return Container();
                          }
                        }),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        objModel.cabIU().then((value) {
                          SnackBar snackBar = SnackBar(
                            content: Text(objModel.msg),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                      }
                    },
                    child: const Text("Salvar"),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
