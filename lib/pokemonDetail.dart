import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke_dex/listOfPokemon.dart';

class pokeDetail extends StatelessWidget {
  final Pokemon pokemon;

  bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height/1.5,
            width: MediaQuery.of(context).size.width-20,
            left: 10.0,
            top: MediaQuery.of(context).size.height *0.1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                      height: 80.0,
                      ),
                  Text('${pokemon.name}',style: TextStyle(
                    fontFamily: 'Barriecito',
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0
                  ),),
                  Text("Height : ${pokemon.height}"),
                  Text("Weight : ${pokemon.weight}"),
                  Text("Types ",style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15.0
                  ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map((t) =>
                            FilterChip(backgroundColor:Colors.deepOrangeAccent,label: Text(t,style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white),), onSelected: (b) {}))
                        .toList(),
                  ),
                  Text("Weakness",style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses
                        .map((t) =>
                        FilterChip(backgroundColor:Colors.redAccent,label: Text(t,style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white),), onSelected: (b) {}))
                        .toList(),
                  ),
                  Text("Next Evolution",style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:pokemon.nextEvolution
                        ?.map((n) =>
                        FilterChip(backgroundColor:Colors.lightGreen,label: Text(n.name,style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white),), onSelected: (b) {}))
                        ?.toList()??[Text("Max Evolution",style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.0,
                    color: Colors.pink))],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(tag: pokemon.img,child: Container(
              height: 170.0,
              width: 170.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(pokemon.img)
                )
              ),
            ),),
          )
        ],
      );

  pokeDetail({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text(pokemon.name),
        backgroundColor: Colors.cyan,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: bodyWidget(context),
    );
  }
}
