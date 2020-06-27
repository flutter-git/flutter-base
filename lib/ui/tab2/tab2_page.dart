import 'dart:io';

import 'package:flutter/material.dart';

// File tab2_page
// @project flutter_base
// @author minhhoang on 25-06-2020
class Tab2Page extends StatefulWidget {
  @override
  _Tab2PageState createState() => _Tab2PageState();
}

class _Tab2PageState extends State<Tab2Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
        child: Center(child: InkWell(
          onTap: ()async{
            Socket socket;
            try{
              socket=await Socket.connect("8.8.4.4",53,timeout: Duration(seconds:10 ));
              socket?.destroy();
              print("ok");
            }catch(e){
              socket?.destroy();
              print(e.message);
            }
          },
            child: Text("Tab2Page")))
    );
  }
  @override
  void initState() {
    print("Tab2Page: initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("Tab2Page: didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(Tab2Page oldWidget) {
    print("Tab2Page: didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }
  @override
  void dispose() {
    print("Tab2Page: dispose");
    super.dispose();
  }
}