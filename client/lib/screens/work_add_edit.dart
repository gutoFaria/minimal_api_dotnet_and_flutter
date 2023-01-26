import 'package:flutter/material.dart';

class WorkAddEdit extends StatefulWidget {
  const WorkAddEdit({super.key});

  @override
  State<WorkAddEdit> createState() => _WorkAddEditState();
}

class _WorkAddEditState extends State<WorkAddEdit> {
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isAPICallProcess = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(".NET-WORK app"),
          elevation: 0,
        ),
        backgroundColor: Colors.grey[200],
        // body: ProgressHUD(
        //   child: Form(
        //     key: globalKey,
        //     child: Text("Add"),
        //   ),
        //   inAsyncCall:isAPICallProcess,
        //   opacity:.3,
        //   key:UniqueKey()
        // )
      ),
    );
  }

  Widget workForm(){
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: const EdgeInsets.only(bottom: 10,top: 10),
          // child: FormHelper.inputFieldWidget(
          //   context,
          //   const Icon(Icons.ac_unit),
          //   "WorkName",
          //   "Work Name",

          // ),
          )
        ],
      )
    );
  }
}