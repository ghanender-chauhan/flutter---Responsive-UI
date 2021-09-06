
import 'package:faccebook_ui/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:faccebook_ui/models/models.dart';


class CreatePostContainer extends StatelessWidget {
    final User currentUser;

  const CreatePostContainer({Key? key, 
  required this.currentUser
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      height: 100.0,
      color: Colors.white,
      child: Column(children: [
        Row(
          children: [
            ProfileAvatar(imageUrl: currentUser.imageUrl,),
            const SizedBox(width: 10.0,),
            Expanded(
              child: TextField(
                decoration: InputDecoration.collapsed(hintText: "Whats on your mind? ",),))
          ],
        ),
        const Divider(height: 2.0, thickness: 0.2,),
        
        Container(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(onPressed: () => print('live'), icon: const Icon(Icons.videocam,
              color: Colors.red,), label: Text("Live",
              style: TextStyle(color:Colors.black,),
              ),
              ),
              
              const VerticalDivider(width: 8.0,),
              
              TextButton.icon(onPressed: () => print('Photo'),
               icon: const Icon(Icons.photo_library,
              color: Colors.teal,), label: Text("Photo",
              style: TextStyle(color:Colors.black,),
              ),
              ),
              
              const VerticalDivider(width: 8.0,),
              
              TextButton.icon(onPressed: () => print('Post'), 
              icon: const Icon(Icons.post_add_rounded,
              color: Colors.blue,), label: Text("Post",
              style: TextStyle(color:Colors.black,),
              ),
              ),
              
              const VerticalDivider(width: 8.0,),
            ],
          ),
        )
      ],),
      
    );
  }
}