import 'package:faccebook_ui/config/palette.dart';
import 'package:faccebook_ui/data/data.dart';
import 'package:faccebook_ui/models/post_model.dart';
import 'package:faccebook_ui/widgets/contacts_list.dart';
import 'package:faccebook_ui/widgets/create_post_container.dart';
import 'package:faccebook_ui/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  


  @override
  // void dispose(){
  //   _trackingScrollController.dispose();
  //   super.dispose();
  // }
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _HomeScreenMobile(),
          desktop: _HomeScreenDesktop(),
          tablet: _HomeScreenTablet(),
          
        )
          
        ),
    );
      
    
  }
}

class _HomeScreenMobile extends StatelessWidget {

 


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      
            slivers: [
              SliverAppBar(
                brightness: Brightness.light,
                backgroundColor: Colors.white,
                
                  
                    title: Text("facebook",
                      style: const TextStyle(color: Palette.facebookBlue,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      ),
                      ),
                centerTitle: false,
                floating: true,
                actions: [
                  IconButton(icon: Icon(Icons.comment),
                  iconSize: 30.0,
                  
                  color: Colors.black,
                  onPressed: () => print('Search'))
                ],
                ),
                  
                  SliverToBoxAdapter(
                    child: CreatePostContainer(currentUser:currentUser),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                    sliver: SliverToBoxAdapter(
                      child: Rooms(onlineUsers:onlineUsers),
                    ),
                  ),
                   SliverPadding(
              padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
              sliver: SliverToBoxAdapter(
                child: Stories(
                  currentUser: currentUser,
                  stories: stories,
                ),
              ),
            ),
            SliverList(delegate: SliverChildBuilderDelegate((context , index){
              final Post post = posts[index];
              return PostContainer(post:post);
            },
            childCount : posts.length,
            )
            )
                
            ]
              );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  // var scrollController;

  // final TrackingScrollController scrollController;

  const _HomeScreenDesktop({
    Key? key,
    //  required this.scrollController ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(padding: const EdgeInsets.all(12.0),
            child: MoreOptionsList(currentUser: currentUser) ,),
          )
        ),
          const Spacer(),
        Container(
          width: 600.0,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
              sliver: SliverToBoxAdapter(
                child: Stories(
                  currentUser: currentUser,
                  stories: stories,
                ),
              ),
            ),
                  SliverToBoxAdapter(
                    child: CreatePostContainer(currentUser:currentUser),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                    sliver: SliverToBoxAdapter(
                      child: Rooms(onlineUsers:onlineUsers),
                    ),
                  ),
                   
            SliverList(delegate: SliverChildBuilderDelegate((context , index){
              final Post post = posts[index];
              return PostContainer(post:post);
            },
            childCount : posts.length,
            )
            )
                
            ]
              ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(padding: const EdgeInsets.all(12.0),
            child: ContactsList(users: onlineUsers) ,),
          )
        ),
         
      ],

    );
  }
  }


class _HomeScreenTablet extends StatelessWidget {
  const _HomeScreenTablet({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
            slivers: [
              SliverAppBar(
                brightness: Brightness.light,
                backgroundColor: Colors.white,
                
                  
                    title: Text("facebook",
                      style: const TextStyle(color: Palette.facebookBlue,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      ),
                      ),
                centerTitle: false,
                floating: true,
                actions: [
                  IconButton(icon: Icon(Icons.comment),
                  iconSize: 30.0,
                  
                  color: Colors.black,
                  onPressed: () => print('Search'))
                ],
                ),
                  
                  SliverToBoxAdapter(
                    child: CreatePostContainer(currentUser:currentUser),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                    sliver: SliverToBoxAdapter(
                      child: Rooms(onlineUsers:onlineUsers),
                    ),
                  ),
                   SliverPadding(
              padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
              sliver: SliverToBoxAdapter(
                child: Stories(
                  currentUser: currentUser,
                  stories: stories,
                ),
              ),
            ),
            SliverList(delegate: SliverChildBuilderDelegate((context , index){
              final Post post = posts[index];
              return PostContainer(post:post);
            },
            childCount : posts.length,
            )
            )
                
            ]
              );
  }
}
  
             
                  