import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spacex_missions/constans/color.dart';
import 'package:spacex_missions/services/services.dart';
import 'package:spacex_missions/widgets/post_container.dart';
import '../models/spacex_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
            image: DecorationImage(
                image: AssetImage('assets/space.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBar(
                backgroundColor: Colors.transparent.withOpacity(0.1),
                title: Image.asset('assets/spacex.png' , width: 160, height: 70, fit: BoxFit.cover,),
                centerTitle: true,
              ),
              FutureBuilder<Spacex>(
                future: Services().getDetailsApi(),
                  builder: (context, snapshot){
                    if (snapshot.hasData) {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: 1,
                            itemBuilder:  (context, index){
                              return Column(
                                children: [
                                  PostContainer(
                                    name: snapshot.data!.name.toString(),
                                    details: snapshot.data!.details.toString(),
                                    patch: snapshot.data!.links!.patch!.small.toString(),
                                    flightNumber: snapshot.data!.flightNumber.toString(),
                                    dateLocal: snapshot.data!.dateLocal.toString(),
                                  ),

                                ],
                              );
                            }
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: secondary,
                          backgroundColor: white,
                        ),
                      );
                    }
                  }
              )
            ],
          ),
        )
      ),
    );
  }
}
