import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gloabal.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key? key, required this.insideSliderIndex}) : super(key: key);
  int insideSliderIndex = 0;

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              CupertinoIcons.left_chevron,
              color: Colors.black,
            )),
        title: const Text(
          "Carousel Slider",
          style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
          fontSize: 28,),
        ),
      ),
      body: Center(
        child: CarouselSlider.builder(
          itemCount: 6,
          options: CarouselOptions(height: 400.0, autoPlay: true),
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Container(
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  width: 300,
                  height: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            insideSliderList[widget.insideSliderIndex]
                                [itemIndex]["Place Pic"],
                          ))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  insideSliderList[widget.insideSliderIndex][itemIndex]
                      ["Place Name"],
                  style: TextStyle(fontSize: 24,
                  fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
