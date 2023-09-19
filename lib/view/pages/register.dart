import 'dart:io';

import 'package:explore/providers/my_places.dart';
import 'package:explore/view/colors.dart';
import 'package:explore/view/widgets/image_input.dart';
import 'package:explore/view/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';


class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerDesc = TextEditingController();
  File? pickedImage;
  String? imageMap;


  // void selectPos(String){
  //   imageMap = 
  // }
  void selectImage(File image){
    pickedImage = image;
  }
  void addLugar(){
    if(controllerName.text.isEmpty || pickedImage == null){
      return;
    }
    Provider.of<MyPlaces>(context, listen: false).addPlace(
      controllerName.text, controllerDesc.text, pickedImage!, 
    );
    Navigator.pushNamed(context, '/home');
  }

  

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cadastrar Local'),
            centerTitle: true,
            backgroundColor: gray,
          ),
        backgroundColor: const Color(0xffe4e4e4),
        body: SafeArea(

          child: Form(
            autovalidateMode: AutovalidateMode.disabled,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 50),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffd3d3d3)),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                      const SizedBox(height: 10),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Nome do local',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        cursorColor: green,
                        decoration: const InputDecoration(
                          prefixIconColor: green,
                          border: OutlineInputBorder(),
                          hintText: "Digite o nome do local"
                        ),
                        controller: controllerName,
                        validator: Validatorless.required("O nome é obrigatório"),
                      ),
                      const SizedBox(height: 30),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Descrição',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        textAlign: TextAlign.left, 
                        textAlignVertical: TextAlignVertical.top,
                        cursorColor: green,
                        maxLines: 5,
                        
                        decoration: const InputDecoration(
                          hintText: "Digite a descrição do local",
                          prefixIconColor: green,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                            
                            
                          ),
                          
                        ),
                        controller: controllerDesc,
                        validator: Validatorless.required("A descrição é obrigatória"),
                      ),
                      const SizedBox(height: 30),
                      ImageInput(onSelectImage: selectImage,),
                      SizedBox(height: 30,),
                      LocationInput(),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   mainAxisSize: MainAxisSize.min,
                      //   children: [
                      //     Container(
                      //       width: 57.0,
                      //       height: 57.0,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(5),
                      //         color: green,
                      //       ),
                      //       child: IconButton(
                      //         onPressed: () {},
                      //         icon: const Icon(
                      //           Icons.pin_drop,
                      //           color: Color(0xffffffff),
                      //         ),
                      //       ),
                      //     ),
                      //     const SizedBox(width: 40),
                      //     Container(
                      //       width: 57.0,
                      //       height: 57.0,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(5),
                      //         color: green,
                      //       ),
                      //       child: IconButton(
                      //         onPressed: () {
                      //           //r.tirarFoto();
                      //         },
                      //         icon: const Icon(
                      //           Icons.camera_alt,
                      //           color: Color(0xffffffff),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(height: 40),
                      TextButton(
                        onPressed: () {
                          addLugar();
                          controllerDesc.text = '';
                          controllerName.text = '';

                        },
                        style: TextButton.styleFrom(
                          backgroundColor: gray,
                          minimumSize: const Size(double.infinity, 50)
                        ),
                        child: const Text(
                          'Cadastrar',
                          style: TextStyle(
                            color: Color(0xffffffff),
                          ),
                        ),
                      )
                    ]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
