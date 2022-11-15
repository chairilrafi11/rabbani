import 'package:cached_network_image/cached_network_image.dart';
import 'package:chairil/core/app/app.dart';
import 'package:chairil/core/util/util.dart';
import 'package:chairil/presentation/component/shimmer.dart';
import 'package:chairil/presentation/home/cubit/home_cubit.dart';
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
          title: Component.textBold("List Product", colors: ColorPalette.darkBlue, fontSize: 27),
          elevation: 0,
          backgroundColor: ColorPalette.whiteBackground,
        ),
        backgroundColor: ColorPalette.whiteBackground,
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const ShimmerList();
            } else if (state is HomeSuccess) {
              var size = MediaQuery.of(navGK.currentContext!).size;
              final double height = 300;
              final double width = size.width / 1.8;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
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
                          hintText: "Cari Product",
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
                    Flexible(
                      child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: (width / height),
                          ),
                          itemCount: state.listProduct.length,
                          // physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              color: ColorPalette.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: CachedNetworkImage(
                                        imageUrl: state.listProduct[index].thumbnailUrl ?? "",
                                        height: 150,
                                        width: width,
                                        fit: BoxFit.fill,
                                        placeholder: (context, url) => const CupertinoActivityIndicator(),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Component.textDefault(
                                      state.listProduct[index].productName ?? "",
                                      maxLines: 2,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Component.textBold(
                                          CoreFunction.moneyFormatter(state.listProduct[index].price.toString()),
                                          colors: ColorPalette.darkBlue,
                                          fontSize: 12
                                        ),
                                        const Spacer(),
                                        const Icon(Icons.star, color: Colors.amber, size: 15,),
                                        const SizedBox(width: 5,),
                                        Component.textDefault(
                                          "5",
                                          fontSize: 11
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                    Component.textDefault(
                                      "Panjang ${state.listProduct[index].length}, Lebar  ${state.listProduct[index].width}, Tinggi  ${state.listProduct[index].height}",
                                      fontSize: 11
                                    ),
                                    const SizedBox(height: 5),
                                    Component.textDefault(
                                      "Terjual ${state.listProduct[index].totalPurchased}",
                                      fontSize: 11
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                    ),
                    if (state.listProduct.isEmpty) Padding(
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
}