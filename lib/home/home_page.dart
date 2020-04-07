import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  //Lista de categorias
  List<String> categorias = ['Filosofia','Matemática', 'Fotografia', 'Ciência',
  'Programação'];

  //Categoria selecionada
  int _categoriaSelecionada = 0;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 50.0, left: 20.0),
                  child: Text('Navegar',
                  style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w600),),
                ),
                SizedBox(
                  height: 10.0,
                  width: 20.0,
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text('Recomendações',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey
                  ),),
                )
              ],
            ),
            Container(
              height: 80.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categorias.length,
                  itemBuilder: (BuildContext contexto, int item){
                    return Padding(
                      padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            this._categoriaSelecionada = item;
                          });
                        },
                        child: Chip(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          backgroundColor: _categoriaSelecionada == item ?
                          Colors.blue : Colors.grey[100],
                          label: Text(categorias.elementAt(item),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: _categoriaSelecionada == item ? Colors.white
                                : Colors.grey[500]
                          ),
                          )
                        ),
                      ),
                    );
                  }

              ),
            )
          ],
        ),
      ),
    );
  }
}
