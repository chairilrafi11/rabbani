import 'package:chairil/core/app/app.dart';
import 'package:chairil/core/util/util.dart';
import 'package:chairil/presentation/component/shimmer.dart';
import 'package:chairil/presentation/home/cubit/home_cubit.dart';
import 'package:chairil/presentation/user/pages/user_form_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../component/component.dart';

class HomePage extends StatelessWidget {

  HomePage({ Key? key }) : super(key: key);

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Component.textBold("List User", colors: ColorPalette.darkBlue, fontSize: 27),
          elevation: 0,
          backgroundColor: ColorPalette.whiteBackground,
        ),
        backgroundColor: ColorPalette.whiteBackground,
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const ShimmerList();
            } else if (state is HomeSuccess) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: TextFormField(
                              controller: searchController,
                              decoration: InputDecoration(
                                fillColor: ColorPalette.grey.withAlpha(30),
                                filled: true,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    context.read<HomeCubit>().onClear();
                                    searchController.clear();
                                  },
                                  child: const Icon(Icons.close, size: 20, color: ColorPalette.darkBlue,),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: ColorPalette.grey.withAlpha(30)),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ColorPalette.grey.withAlpha(30)),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: ColorPalette.grey.withAlpha(30)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: ColorPalette.grey.withAlpha(30)),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: ColorPalette.grey.withAlpha(30)),
                                ),
                                counterText: "",
                                hintText: "Cari user",
                                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                hintStyle: const TextStyle(fontSize: 12.0, color: ColorPalette.textGrey, fontWeight: FontWeight.w500)
                              ),
                              maxLength: 16,
                              keyboardType: TextInputType.text,
                              onChanged: (value){
                                CoreFunction.debouncer.debounce(() {
                                  CoreFunction.logPrint("seartch", value);
                                  if (value.isEmpty) {
                                  CoreFunction.logPrint("", value);
                                    context.read<HomeCubit>().onClear();
                                  } else {
                                    context.read<HomeCubit>().onSearch(value);
                                  }
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 5,),
                          InkWell(
                            onTap: (){
                              bottomsheetOpton(context);
                            }, 
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorPalette.darkBlue
                                ),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                              child:  const Icon(Icons.menu, color: ColorPalette.darkBlue,)
                            ),
                          ),
                          const SizedBox(width: 5,),
                          InkWell(
                            onTap: (){
                              routePush(UserFormPage(), RouterType.material);
                            }, 
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorPalette.darkBlue
                                ),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                              child:  const Icon(Icons.add, color: ColorPalette.darkBlue,)
                            ),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.listUser.length,
                        // physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Component.textBold(
                                        state.listUser[index].name ?? "",
                                        colors: ColorPalette.darkBlue
                                      ),
                                      const Spacer(),
                                      Component.textDefault(
                                        state.listUser[index].phoneNumber ?? "",
                                        fontSize: 12
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  Component.textDefault(
                                    state.listUser[index].email ?? "",
                                    fontSize: 12
                                  ),
                                  const SizedBox(height: 5,),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Component.textDefault(
                                        state.listUser[index].address ?? "",
                                        fontSize: 12
                                      ),
                                      const Spacer(),
                                      const Icon(Icons.location_on, color: ColorPalette.darkBlue, size: 15,),
                                      const SizedBox(width: 5,),
                                      Component.textBold(
                                        state.listUser[index].city ?? "",
                                        fontSize: 12
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          );
                        },
                      ),
                    ),
                    if (state.listUser.isEmpty) Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Component.textBold("Tidak ada user"),
                    )
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      )
    ) ;
  }

  bottomsheetOpton(BuildContext context){
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Component.textBold("Opsi", fontSize: 27),
              const SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  context.read<HomeCubit>().onSortByName();
                  Navigator.of(context).pop();
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
                    "Urutkan berdasarkan nama"
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                  bottomsheetCity(context);
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
                  child: Component.textDefault("Filter berdasarkan kota"),
                ),
              ),      
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                  context.read<HomeCubit>().onClear();
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
                  child: Component.textDefault("Bersihkan Opsi"),
                ),
              )
            ],
          ),
        );
      }
    ).then((value) {
    });
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
                itemCount: context.read<HomeCubit>().listCity.length,
                itemBuilder: (BuildContext contextt, int index) {
                  return GestureDetector(
                    onTap: (){
                      context.read<HomeCubit>().onFilterCity(context.read<HomeCubit>().listCity[index]);
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
                        context.read<HomeCubit>().listCity[index].name ?? "",
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