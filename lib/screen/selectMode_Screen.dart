import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task/utils/my_images.dart';
import 'package:task/utils/my_style.dart';

class SelectmodeScreen extends StatefulWidget {
  const SelectmodeScreen({super.key});

  @override
  State<SelectmodeScreen> createState() => _SelectmodeScreenState();
}

class _SelectmodeScreenState extends State<SelectmodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('CONVERTER MODE'),
        titleTextStyle: 22.monserrat700.copyWith(color: const Color(0xff007AFF)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                ///Single Converter
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        height: 133,
                        width: 192,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: const Color(0xffD7D7D7)),
                        ),
                        child: Center(
                          child: SvgPicture.asset(MyImages.arrow),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Single converter',
                        style: 20.monserrat500,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 54,
                  width: Get.width,
                  decoration: BoxDecoration(color: const Color(0xff007AFF), borderRadius: BorderRadius.circular(14)),
                  child: Center(
                    child: Text('Get started', style: 16.monserrat400.copyWith(color: Colors.white)),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}