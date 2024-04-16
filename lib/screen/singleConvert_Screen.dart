import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task/coman/textfiledWidget.dart';
import 'package:task/controller/SINGLController.dart';
import 'package:task/utils/my_color.dart';
import 'package:task/utils/my_images.dart';
import 'package:task/utils/my_style.dart';

class SingleconvertScreen extends StatefulWidget {
  const SingleconvertScreen({super.key});

  @override
  State<SingleconvertScreen> createState() => _SingleconvertScreenState();
}

class _SingleconvertScreenState extends State<SingleconvertScreen> {
  final con = Get.put(SingleController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('SINGLE CONVERTER'),
        titleTextStyle: 14.monserrat600,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Obx(() => TextFiedWidget(
                  border: con.isValid.value ? Border.all(color: Colors.red) : null,
                  controlle: con.inputController,
                  title: con.fromUnit,
                  color: MyColor.textfiledC1,
                  tcolor: MyColor.black,
                  Tcolor: MyColor.black,
                  onChanged: (value) {
                    setState(() {
                      if (value.length > 9) {
                        con.isValid.value = true;
                      } else {
                        con.inputValue = double.tryParse(value) ?? 0.0;
                        con.convert();
                        con.isValid.value = false;
                      }
                    });
                  },
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white),
                            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                            child: ListView.separated(
                              separatorBuilder: (context, index) => const Divider(),
                              shrinkWrap: true,
                              itemCount: con.fromtext.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        con.fromUnit = con.fromtext[index];
                                        con.convert();
                                        Get.back();
                                      });
                                    },
                                    child: SizedBox(
                                      width: Get.width,
                                      child: Center(
                                        child: Text(
                                          '${con.fromtext[index]}',
                                          style: 17.monserrat400,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ));
                      },
                    );
                  },
                )),
            const SizedBox(height: 5),
            Obx(() => Text(
                  con.isValid.value ? "Please add less than 9 digits" : "",
                  style: 12.monserrat600.copyWith(color: Colors.red),
                )),
            const SizedBox(height: 0),
            InkWell(
                onTap: () {
                  String m = con.fromUnit;
                  con.fromUnit = con.toUnit;
                  con.toUnit = m;
                  // con.convert();
                  double d = con.convertedValue;
                  con.convertedValue = double.tryParse(con.inputController.text) ?? 0.0;
                  con.inputController.text = d.toStringAsFixed(4).replaceFirst(RegExp(r'\.?0*$'), '');

                  setState(() {});
                },
                child: SvgPicture.asset(MyImages.refresh)),
            const SizedBox(height: 15),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white),
                        margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const Divider(),
                          shrinkWrap: true,
                          itemCount: con.fromtext.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    con.toUnit = con.toist[index];
                                    con.convert();
                                    Get.back();
                                  });
                                },
                                child: SizedBox(
                                  width: Get.width,
                                  child: Center(
                                    child: Text(
                                      '${con.fromtext[index]}',
                                      style: 17.monserrat400,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ));
                  },
                );
              },
              child: Container(
                height: 140,
                width: Get.width,
                decoration: BoxDecoration(color: MyColor.primaryColor, borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Text(
                            con.toUnit,
                            style: 14.monserrat600.copyWith(color: MyColor.white),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.arrow_downward,
                            color: MyColor.white,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: SizedBox(
                              width: Get.width * .8,
                              child: Text(con.convertedValue.toStringAsFixed(4).replaceFirst(RegExp(r'\.?0*$'), ''),
                                  overflow: TextOverflow.ellipsis, textAlign: TextAlign.right, style: 30.monserrat600.copyWith(color: MyColor.white)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
