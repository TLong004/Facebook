import 'package:facebook/widgets/CircleAction.dart';
import 'package:facebook/widgets/CircleAvatar.dart';
import 'package:facebook/widgets/StoryCard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: _isSearching 
        ? Container(
          height: 40,
          margin: EdgeInsets.symmetric(horizontal: 5),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey[200],
          ),
          child: Row(
            children: [
              IconButton( 
                icon: Icon(Icons.search),
                onPressed: (){},
              ),
              Expanded(
                child: TextField(
                  autofocus: true,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: "Tìm kiếm trên facebook",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    isCollapsed: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          )
        )
        : const Text(
          "facebook",
          style: TextStyle(
            color: Color(0xFF1877F2),
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: -1.2,
          ),
        ),
        centerTitle: true,
        actions: [
          CircleAction(
            icon: _isSearching ? Icons.close : Icons.search,
            onPressed: () => setState(() => _isSearching = !_isSearching),
            iconSize: _isSearching ? 18 : 22,
          ),
          CircleAction(
            icon: Icons.notifications,
            onPressed: () {},
            iconSize: 20,
            iconColor: _isSearching ? Colors.black : const Color(0xFF1877F2),
          ),
          const SizedBox(width: 8,)
        ],
      ),
      drawer: Drawer(

      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 18, right: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MyCircleAvatar(),
                const SizedBox(width: 10),
                Expanded( 
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey[200],
                    ),
                    child: const TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "Bạn đang nghĩ gì?",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        isCollapsed: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 5), 
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      enabled: false,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, bottom: 8),
            child: const Divider(thickness: 1, color: Color(0xFFE0E0E0),),
          ),

          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: 10,
              itemBuilder: (context, index) {
                return StoryCard(index: index);
              }
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, bottom: 8, top: 8),
            child: const Divider(thickness: 1, color: Color(0xFFE0E0E0),),
          ),

          
        ],
      ),
    );
  }
}
