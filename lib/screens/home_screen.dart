import 'package:flutter/material.dart';
import 'package:responsive_pokemon_app/const/pokemon_type_container.dart';
import 'package:responsive_pokemon_app/const/text_style.dart';
import 'package:responsive_pokemon_app/screens/details_screen.dart';

import '../const/colors.dart';
import '../services/api_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text("Pokemon App", style: TextStyle(fontFamily: 'circula_bold', fontSize: 36),),
              SizedBox(height: 30,),
              
              Expanded(
                child: FutureBuilder(
                  future: getApi(),
                  builder: (context, AsyncSnapshot snapshot){
                    if(snapshot.hasData){
                      return GridView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            // condition for different screen sizes
                              crossAxisCount: width < 600 ? 2 : width < 1100 ? 4 : 6,
                              mainAxisSpacing: 8, crossAxisSpacing: 8),
                          itemBuilder: (context, index){
                            return InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(
                                  data: snapshot.data[index],
                                )));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(12),
                                ),

                                child: Stack(
                                  children: [
                                    Positioned(
                                        bottom: -20,
                                        right: -20,
                                        child: Image.asset('assets/pokeball.jpg', color: Colors.white.withOpacity(0.5), width: 150,)),

                                    Positioned(
                                        bottom: -2,
                                        right: -2,
                                        // child: Image.asset('assets/img1.jpg', width: 150,)),
                                        child: Image.network(snapshot.data[index]['imageurl'], width: 150,)),

                                    Positioned(
                                        top: 20,
                                        left: 10,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            headingText(text: snapshot.data[index]['name'].toString(), color: Colors.white, size: 24),
                                            typeContainer(text: "Grass", color: Colors.white, size: 16),
                                            SizedBox(height: 6,),
                                            typeContainer(text: "Poison", color: Colors.white, size: 16),
                                          ],
                                        )
                                    )

                                  ],
                                ),
                              ),
                            );
                          });
                    }

                    else{
                      return Center(child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                          lightGreen,
                        ),
                      ));
                    }

                  },
                )
              )

            ],
          ),
        ),
      ),
    );
  }
}

