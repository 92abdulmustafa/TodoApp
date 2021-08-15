import 'package:flutter/material.dart';
class Todo extends StatefulWidget {
  
  @override
  _TodoState createState() => _TodoState();
}
class _TodoState extends State<Todo>{
var title = "";
var ele = "" ;
var descrp = "" ;
List<dynamic> titleList = [];
List<dynamic> eleList =[];
List<dynamic> descrpList = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBar(
            automaticallyImplyLeading: false, // hides leading widget
            backgroundColor:Colors.teal[300],
            title:Padding(
              padding: const EdgeInsets.only(top:20),
              child: Center(
                child:Text("TODO APP",style:TextStyle(fontSize:35,fontWeight:FontWeight.bold,color:Colors.blueGrey[600]),)
              ),
            ),
          ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: eleList.length,
              itemBuilder: (context,index){
              return Container(
                height: 80,
                color: Colors.black87,
                margin: EdgeInsets.only(top: 10),
                child: ListTile(
                  title: Text("${titleList[index]}" ,style: TextStyle(color: Colors.white,fontSize: 18,fontStyle: FontStyle.italic)),
                  subtitle: Column(
                    children: [
                      Text("${eleList[index]}",style: TextStyle(color: Colors.white70,fontSize: 15,fontStyle: FontStyle.italic),),
                      Text("${descrpList[index]}",style: TextStyle(color: Colors.white70,fontSize: 10),),
                    ],
                  ),
                  trailing: Container(
                    width: 50,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            showDialog(context: context, builder: (context){
                            return AlertDialog(
                            title: Text("Edit Item"),
                            content: SizedBox(
                              height: 150,
                              child: Column(
                                children: [
                                  TextField(
                                    decoration: InputDecoration(hintText: "Title Of ToDo List"),
                                    onChanged: (value){
                                      title = value;
                                    },
                                  ),
                                  TextField(
                                    decoration: InputDecoration(hintText: "Element Of ToDo List"),
                                    onChanged: (value){
                                      ele = value;
                                    },
                                  ),
                                  TextField(
                                    decoration: InputDecoration(hintText: "Description Of ToDo List"),
                                    onChanged: (value){
                                      descrp = value;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                primary: Colors.teal[200]
                              ),
                              onPressed: (){
                                setState(() {
                                  titleList.replaceRange(index, index+1, {title});
                                  eleList.replaceRange(index, index+1, {ele});
                                  descrpList.replaceRange(index, index+1, {descrp});
                                  //the line below close the dialogbox after click on "+" button
                                Navigator.of(context, rootNavigator: true).pop();
                              });
                            }, child: Text("Edit",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),)),
                            
                          ],
                        );
                       });
                      },
                      child: Icon(Icons.edit, color: Colors.white,),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          titleList.removeAt(index);
                          eleList.removeAt(index);
                          descrpList.removeAt(index);
                        });
                      },
                      child: Icon(Icons.delete,color: Colors.white,)
                      ),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    ),
  ),
  floatingActionButton:SizedBox(
    height: 80,
    width: 70,
    child: FloatingActionButton(
    backgroundColor: Colors.teal[300],
      onPressed: (){
        showDialog(context: context, builder: (context){
          return AlertDialog(
            title: Text("Add Item"),
            content: SizedBox(
            height: 150,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: "Title Of ToDo List"),
                      onChanged: (value){
                          title = value;
                        },
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Element Of ToDo List"),
                    onChanged: (value){
                        ele = value;
                      },
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Description Of ToDo List"),
                    onChanged: (value){
                          descrp = value;
                        },
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  primary: Colors.teal[200]
                ),
                onPressed: (){
                  setState(() {
                    titleList.add(title);
                    eleList.add(ele);
                    descrpList.add(descrp);
                    //the line below close the dialogbox after click on "+" button
                    Navigator.of(context, rootNavigator: true).pop();
                  });
                }, child: Text("+",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),))
              ],
            );
          });
      },child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top:22),
              child: Column(
                children: [
                  Text("Add"),
                  Text("Item"),
                ],
              ),
            ),
          ),
        )
      )
    );
  }
}