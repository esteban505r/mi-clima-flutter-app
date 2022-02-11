
import 'package:flutter/material.dart';

class SlideWidget extends StatefulWidget {

  final Offset begin;
  final Offset end;
  final Curve curve;
  final bool autoStart;
  final Widget child;
  final AnimationController animationController;

  const SlideWidget({GlobalKey<SlideWidgetState>? key,required this.animationController,required this.child,this.begin = const Offset(-1,0),this.end = const Offset(0,0),this.curve = Curves.easeOut, this.autoStart = true}) : super(key: key);

  @override
  SlideWidgetState createState() => SlideWidgetState();
}

class SlideWidgetState extends State<SlideWidget> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    if(widget.autoStart){
      startAnimation();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: Tween<Offset>(begin: widget.begin,end: widget.end ).animate(CurvedAnimation(parent: widget.animationController, curve: widget.curve)),child: widget.child,);
  }

  @override
  startAnimation(){
    widget.animationController.reset();
    widget.animationController.forward();
  }


}
