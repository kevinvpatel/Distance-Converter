import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/universal_controller.dart';
import 'package:task/utils/my_color.dart';
import 'package:task/utils/my_style.dart';

class UniversalConvertScreen extends StatefulWidget {
  UniversalConvertScreen({super.key});

  @override
  State<UniversalConvertScreen> createState() => _UniversalConvertScreenState();
}

class _UniversalConvertScreenState extends State<UniversalConvertScreen> {
  final con = Get.put(UniversalController());

  @override
  void initState() {
    con.addList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Hero(
          tag: 'animate universal',
          child: Text(
            'Universal converter',
            style: 20.monserrat600,
          ),
        ),
        titleTextStyle: 14.monserrat600,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: MyColor.textfiledC1,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      cursorHeight: 45,
                      keyboardType: TextInputType.number,
                      style: 30.monserrat600.copyWith(color: Colors.black),
                      decoration: const InputDecoration(border: InputBorder.none, hintText: "00"),
                      onChanged: (value) {
                        con.inputValue = double.tryParse(value) ?? 0.0;
                        con.convert();
                        setState(() {});
                      },
                    )),
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
                                          // setState(() {
                                          con.toUnit.value = con.fromtext[index];
                                          con.convert();
                                          con.addList();
                                          Get.back();
                                          // });
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
                      child: Row(
                        children: [
                          Obx(() => Text(
                                con.toUnit.value.toString(),
                                style: 14.monserrat500.copyWith(color: MyColor.primaryColor),
                              )),
                          const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            size: 25,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Obx(() => Wrap(
                    spacing: 20,
                    runSpacing: 18,
                    alignment: WrapAlignment.center,
                    children: con.ucList.map((e) => displayUC(convertedText: e.convertedText.toString(), unit: e.unit ?? "")).toList(),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  String numberToShorthand(double number) {
    if (number >= 1000000000000) {
      ///For Trillion
      return (number / 1000000000000).toStringAsFixed(1) + 'T';
    } else if (number >= 1000000000) {
      ///For Billion
      return (number / 1000000000).toStringAsFixed(1) + 'B';
    } else if (number >= 1000000) {
      ///For Million
      return (number / 1000000).toStringAsFixed(1) + 'M';
    } else {
      ///For Normal Numbers
      return number.toString();
    }
  }

  Widget displayUC({String? convertedText, unit}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 100,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MyColor.grey,
          ),
          child: Text(
            // con.convertValue(unit ?? "").toString(),
            '${numberToShorthand(double.parse(con.convertValue(unit ?? "").toStringAsFixed(2)))}',
            style: 14.monserrat600.copyWith(color: Colors.black),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          unit ?? '',
          style: 12.monserrat500.copyWith(color: MyColor.primaryColor),
        )
      ],
    );
  }
}
