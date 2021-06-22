import 'package:flutter/material.dart';
import 'package:justmarryapp/help/ui.dart';

class ServiceCard extends StatefulWidget {
  final String imageUrl;

  final String desc;

  const ServiceCard({Key key, this.imageUrl, this.desc}) : super(key: key);

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  Size sizeDevice;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sizeDevice = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // Navigator.pushNamed(context, 'job_detail');
        },
        child: Container(
          height: 120,
          width: sizeDevice.width*0.8,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0 ,20.0,0.0),
            child: Card(
              elevation: 10.0,

              color: Colors.white,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [Image(image: AssetImage(widget.imageUrl,),width: 300,
                    height: 150,
                    fit:BoxFit.fill ),
                  UIHelper.verticalSpaceVerySmall(),
                  Text(widget.desc, style: TextStyle(fontSize: 12,color: Colors.amber)),
                ],
              ),


            ),
          ),

        ),
      ),
    );
  }
}