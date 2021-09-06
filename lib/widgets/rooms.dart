import 'package:faccebook_ui/config/palette.dart';
import 'package:faccebook_ui/data/data.dart';
import 'package:faccebook_ui/models/models.dart';
import 'package:faccebook_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({Key? key, required this.onlineUsers}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
    margin: EdgeInsets.symmetric(horizontal: isDesktop?5.0 : 0.0),
    elevation: isDesktop?1.0 : 0.0,
    shape: isDesktop ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)):null,
      child: Container(
        height: 60.0,
        color: Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          
          itemBuilder: (BuildContext context , int index){
            if(index == 0){
              return Padding(padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: _CreateRoomButton(),
              );
            }
            final User user = onlineUsers[index - 1];
            return Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ProfileAvatar(imageUrl: user.imageUrl,isActive: true,),);
          },),
        
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
       
      
      onPressed: () => print("Create room"),
      
      
     child: Row(
       children: [
       ShaderMask(shaderCallback:(rect)=> Palette.createRoomGradient.createShader(rect),
          child: Icon(Icons.video_call,size: 30.0,color: Colors.red,)
       ),
       const SizedBox(width: 4.0,),
       Text("Create\nRoom")
     ],), 
     
    
    
      
      
      


    );
      
    
  }
}