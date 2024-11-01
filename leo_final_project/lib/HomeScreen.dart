import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'AcccountScreen.dart';
import 'groups.dart';
import 'chat_screen.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    // ChatScreen1(userId: "k9dtwry0yvhbo8t", phoneNumber: "YOUR_PHONE"),
    GroupsScreen(),
    GameScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.blue[700],
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.blue[50]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.comments,
                  text: 'Chat',
                ),
                GButton(
                  icon: LineIcons.users,
                  text: 'Group',
                ),
                GButton(
                  icon: LineIcons.gamepad,
                  text: 'Game',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Account',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Chats',
          style: TextStyle(color: Colors.blue[700], fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.blue[700]),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.blue[700]),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.blue[700],
          labelColor: Colors.blue[700],
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(text: 'CHATS'),
            Tab(text: 'STATUS'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ChatListView(),
          StatusView(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(_tabController.index == 0 ? Icons.chat : Icons.camera_alt),
        backgroundColor: Colors.blue[700],
      ),
    );
  }
}

class ChatListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://picsum.photos/seed/${index + 1}/200'),
          ),
          title: Text('User ${index + 1}'),
          subtitle: Text('Last message...'),
          trailing: Text('12:00 PM'),
        );
      },
    );
  }
}

class StatusView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Stack(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('https://picsum.photos/seed/myStatus/200'),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 20),
                ),
              ),
            ],
          ),
          title: Text('My Status'),
          subtitle: Text('Tap to add status update'),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Recent updates', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue[700]!, width: 2),
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage('https://picsum.photos/seed/status${index + 1}/200'),
                ),
              ),
              title: Text('User ${index + 1}'),
              subtitle: Text('Today, 12:0${index + 1} PM'),
            );
          },
        ),
      ],
    );
  }
}



class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Game Screen'));
  }
}

