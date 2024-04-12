import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/SINGLController.dart';
import 'package:task/utils/my_style.dart';

class TextFiedWidget extends StatelessWidget {
  final Color color;
  final Color tcolor;
  final String title;
  final TextEditingController controlle;
  final Color Tcolor;
  final void Function() onTap;
  final void Function(String) onChanged;
  final BoxBorder? border;
  const TextFiedWidget({
    super.key,
    required this.color,
    required this.tcolor,
    required this.title,
    required this.Tcolor,
    required this.controlle,
    required this.onChanged,
    required this.onTap,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 140,
          width: Get.width,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20), border: border),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                // height: 140,
                child: TextField(
                    controller: controlle,
                    onChanged: onChanged,
                    style: 30.monserrat600.copyWith(color: tcolor),
                    textAlign: TextAlign.end,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                        hintStyle: 30.monserrat600.copyWith(color: tcolor),
                        hintText: '00',
                        filled: true,
                        fillColor: Colors.transparent,
                        border: InputBorder.none)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              InkWell(
                onTap: onTap,
                child: Text(
                  title,
                  style: 14.monserrat600.copyWith(color: Tcolor),
                ),
              ),
              const SizedBox(width: 5),
              const Icon(Icons.arrow_downward)
            ],
          ),
        ),
      ],
    );
  }
}
