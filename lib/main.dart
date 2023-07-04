import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(const myApp());
}
class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: myHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class myHome extends StatefulWidget {
  const myHome({super.key});

  @override
  State<myHome> createState() => _myHomeState();
}

class _myHomeState extends State<myHome> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: myBody(),
    );
  }
}
class myBody extends StatefulWidget {
  const myBody({super.key});

  @override
  State<myBody> createState() => _myBodyState();
}

class _myBodyState extends State<myBody> {

  List images = ["https://images.pexels.com/photos/933054/pexels-photo-933054.jpeg?auto=compress&cs=tinysrgb&w=400","https://images.pexels.com/photos/1261728/pexels-photo-1261728.jpeg?auto=compress&cs=tinysrgb&w=400","https://images.pexels.com/photos/2335126/pexels-photo-2335126.jpeg?auto=compress&cs=tinysrgb&w=400"];
  List names=["Abc","Xyz","Dfg"];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
      child: Column(
        children: [
          CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (context, index, realIndex) {
                return GestureDetector(
                  onTap: (){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${names[index]}")));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6),
                  BlendMode.darken),
                  image: NetworkImage('${images[index]}'),
                  fit: BoxFit.cover,
                  ),
                  )),
                );
          }, options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            autoPlayCurve: Curves.easeInOut,
            scrollDirection: Axis.horizontal,
            autoPlayAnimationDuration: const Duration(milliseconds: 1000)
          ))
        ],
      ),
    );
  }
}
