import 'package:flutter/material.dart';
import 'event.dart';

class StateContainer extends StatefulWidget {
  final Widget child;
  final MyEventPojo event;

  StateContainer({@required this.child,this.event});

  static StateContainerState of(BuildContext context){
    return(context.dependOnInheritedWidgetOfExactType<InheritedContainer>()).data;
  }



  StateContainerState createState() => StateContainerState();
}

class StateContainerState extends State<StateContainer> {
    MyEventPojo event;
    
    void updateEventInfo({eventName,eventDetails,eventDate,eventLocation}){
      if(event==null){
        event=new MyEventPojo(eventName:eventName,eventDetails:eventDetails,eventDate:eventDate,eventLocation:eventLocation);
        setState(() {
         event=event; 
        });
      }
      else{
        setState(() {
         event.eventName=eventName ?? event.eventName; 
         event.eventDetails=eventDetails ?? event.eventDetails; 
         event.eventDate=eventDate ?? event.eventDate; 
         event.eventLocation=eventLocation ?? event.eventLocation; 
        });
      }

    }

  @override
  Widget build(BuildContext context) {
    return InheritedContainer(
        data:this,
       child: widget.child,
    );
  }
}

class InheritedContainer extends InheritedWidget {
   final StateContainerState data;

  InheritedContainer({Key key,@required this.data, @required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify( InheritedContainer oldWidget) {
    return true;
  }
}
