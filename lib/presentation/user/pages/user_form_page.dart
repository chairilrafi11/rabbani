import 'package:chairil/domain/data/user_create.dart';
import 'package:chairil/presentation/user/cubit/user_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app/color_palette.dart';
import '../../component/component.dart';

class UserFormPage extends StatelessWidget {

  UserFormPage({ Key? key }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserFormCubit(),
      child: Scaffold(
      appBar: AppBar(
        title: Component.textBold("Add User", colors: ColorPalette.darkBlue, fontSize: 27),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: ColorPalette.whiteBackground,
      ),
      body: BlocBuilder<UserFormCubit, UserFormState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: ListView(
                  children: [
                    const SizedBox(height: 20,),
                    Component.textBold("Nama", fontSize: 13, colors: ColorPalette.darkBlue),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: nameController,
                      decoration: Component.decorationNoBorder("Nama"),
                      maxLength: 16,
                      keyboardType: TextInputType.text, 
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Nama harus di isi";
                        } 
                        return null;
                      },
                    ),
                    const SizedBox(height: 20,),
                    Component.textBold("Alamat", fontSize: 13, colors: ColorPalette.darkBlue),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: addressController,
                      decoration: Component.decorationNoBorder("Masukan Alamat"),
                      maxLength: 50,
                      keyboardType: TextInputType.text, 
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Alamat harus di isi";
                        } 
                        return null;
                      },
                    ),
                    const SizedBox(height: 20,),
                    Component.textBold("Email", fontSize: 13, colors: ColorPalette.darkBlue),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: emailController,
                      decoration: Component.decorationNoBorder("Email"),
                      maxLength: 50,
                      keyboardType: TextInputType.text, 
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email";
                        } 
                        return null;
                      },
                    ),
                    const SizedBox(height: 20,),
                    Component.textBold("No Handphone", fontSize: 13, colors: ColorPalette.darkBlue),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: phoneController,
                      decoration: Component.decorationNoBorder("08xxx"),
                      maxLength: 16,
                      keyboardType: TextInputType.text, 
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "No Handphone harus di isi";
                        } 
                        return null;
                      },
                    ),
                    const SizedBox(height: 20,),
                    Component.textBold("Kota", fontSize: 13, colors: ColorPalette.darkBlue),
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        bottomsheetCity(context);
                      },
                      child: TextFormField(
                        enabled: false,
                        controller: TextEditingController(text: state.city.name ?? ""),
                        decoration: Component.decorationNoBorder("City"),
                        maxLength: 16,
                        keyboardType: TextInputType.text, 
                        validator: (value) {
                          if (value == null || value.isEmpty || value == "") {
                            return "Kota Harus di isi";
                          } 
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 50,),
                    Component.button(
                      label: "Simpan", 
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          context.read<UserFormCubit>().onCreateUser(UserCreate(
                            address: addressController.text,
                            city: state.city.name,
                            email: emailController.text,
                            name: nameController.text,
                            phoneNumber: phoneController.text
                          ));
                        }
                      }
                    )
                  ],
                ),
            ),
            );
          },
        )
      )
    );
  }

  bottomsheetCity(BuildContext context){
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      builder: (BuildContext buildContext) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Component.textBold("City", fontSize: 27),
              const SizedBox(height: 10,),
              ListView.builder(
                shrinkWrap: true,
                itemCount: context.read<UserFormCubit>().listCity.length,
                itemBuilder: (BuildContext contextt, int index) {
                  return GestureDetector(
                    onTap: (){
                      context.read<UserFormCubit>().onChangeCity(context.read<UserFormCubit>().listCity[index]);
                      Navigator.of(contextt).pop();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: ColorPalette.whiteBackground,
                            width: 1
                          )
                        )
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                      child: Component.textDefault(
                        context.read<UserFormCubit>().listCity[index].name ?? "",
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      }
    );
  }
}