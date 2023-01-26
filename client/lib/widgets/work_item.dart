import 'package:flutter/material.dart';

import '../model/work.dart';

class WorkItem extends StatelessWidget {
  const WorkItem({super.key,this.model,this.onDelete});

  final Work? model;
  final Function? onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50)
        ),
        child: workWidget(context),
      ),
    );
  }
  Widget workWidget(context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 120,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(5),
        child: Image.network("https://th.bing.com/th/id/OIP.8gmfMtjc_GKBxKsOuUoO9AHaHa?pid=ImgDet&rs=1",
        height: 70,
        fit: BoxFit.scaleDown,),
      ),
      Padding(padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model!.workName!,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height:10),
          Text("${model!.description}",style:const TextStyle(color: Colors.black),
          ),
          const SizedBox(height:10),
          Text("Preço básico:R\$ ${model!.initialPrice}.00",style:const TextStyle(color: Colors.black),),
          const SizedBox(height:10),
          Text("Preço intermediário:R\$ ${model!.intermediatePrice}.00",style:const TextStyle(color: Colors.black),),
          const SizedBox(height:10),
          Text("Preço :R\$ ${model!.advancedPrice}.00",style:const TextStyle(color: Colors.black),),
          const SizedBox(height:10),
          Container(
           
            child: Row(
              children: [
                GestureDetector(
                  child: const Icon(Icons.edit,color: Colors.blue,),
                  onTap: (){
                    
                  },
                ),
                const SizedBox(width: 15,),
                GestureDetector(
                  child: const Icon(Icons.delete,color: Colors.red,),
                  onTap: (){
                    onDelete!(model);
                  },
                )
              ],
            ),
          )
        ],
      ),
      )
    ],
  );
}
}

