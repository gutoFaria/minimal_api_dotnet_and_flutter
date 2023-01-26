import 'package:flutter/material.dart';

import '../model/work.dart';
import '../widgets/work_item.dart';

class WorkList extends StatefulWidget {
  const WorkList({super.key});

  @override
  State<WorkList> createState() => _WorkListState();
}

class _WorkListState extends State<WorkList> {
  List<Work> works = List<Work>.empty(growable: true);

  @override
  void initState(){
    super.initState();

    works.add(
      Work(
        workId:1,
        workName:"Consertar bolsa",
        description:"Alça da bolça descosturando",
        category:"acessórios",
        initialPrice: 5,
        intermediatePrice:10,
        advancedPrice:20,
        addedTime:""
      ),
    );

    works.add(
      Work(
        workId:2,
        workName:"Consertar calça",
        description:"Ajustar tamanho e largura da calça",
        category:"vestimenta",
        initialPrice: 7,
        intermediatePrice:10,
        advancedPrice:25  ,
        addedTime:""
      ),
    );
  }

  Widget workList(works){
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.green,
                  minimumSize: const Size(88,36),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10)
                    )
                  )
                ),
                onPressed: (){
                  Navigator.pushNamed(context, "add-work");
                },
                child:const Text("Add Work"),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: works.length,
                itemBuilder: (context, index) {
                  return WorkItem(
                    model: works[index],
                    onDelete: (Work model){},
                  );
                },
              )
            ],
          )
        ],
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(".NET - WORK App"),
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: workList(works),
    );
  }
}