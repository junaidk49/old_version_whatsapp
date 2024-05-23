import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int index = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Sample data for avatars
    final List<Map<String, String>> avatarData = [
      {'name': 'My Status', 'url': 'assets/profile.jpg'},
      {'name': 'Alice', 'url': 'assets/adnan.jpg'},
      {'name': 'Bob', 'url': 'assets/imran.jpg'},
      {'name': 'Charlie', 'url': 'assets/zombie.jpg'},
      {'name': 'David', 'url': 'assets/tech.jpg'},
      {'name': 'Eve', 'url': 'assets/ary.jpg'},
      {'name': 'Alice', 'url': 'assets/adnan.jpg'},
      {'name': 'Bob', 'url': 'assets/imran.jpg'},
      {'name': 'Charlie', 'url': 'assets/zombie.jpg'},
      {'name': 'David', 'url': 'assets/tech.jpg'},
      {'name': 'Eve', 'url': 'assets/ary.jpg'},
    ];
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('WhatsApp'),
            backgroundColor: Colors.teal,
            bottom: const TabBar(
              tabs: [
                Tab(child: Icon(Icons.groups)),
                Tab(child: Text('Chats')),
                Tab(child: Text('Status')),
                Tab(child: Text('Calls')),
              ],
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              PopupMenuButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  itemBuilder: (context) => const [
                        PopupMenuItem(value: 1, child: Text('New Group')),
                        PopupMenuItem(value: 1, child: Text('Settings')),
                        PopupMenuItem(value: 1, child: Text('Logout'))
                      ])
            ],
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: 5, // You can adjust the number of containers
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: (index == 0)
                        ? Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Stack(
                                    children: [
                                      const CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.teal,
                                        backgroundImage:
                                            AssetImage('assets/profile.jpg'),
                                      ),
                                      Positioned(
                                        right: -2,
                                        bottom: -2,
                                        child: Container(
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                          ),
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  title: const Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text('New Community'),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const ExpandableContainer(),
                  );
                },
              ),
              ListView.builder(
                  itemCount: avatarData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 25, // Adjust the radius as needed
                        backgroundImage: AssetImage(avatarData[index]['url']!),
                        child: avatarData[index]['url'] == null
                            ? Text(
                                avatarData[index]['name']!.substring(0, 1),
                                style: const TextStyle(fontSize: 24),
                              )
                            : null,
                      ),
                      title: Text(
                        avatarData[index]['name']!,
                        style: const TextStyle(fontSize: 14),
                      ),
                      subtitle: const Text('Hey there I am using Whatsapp'),
                      trailing: const Text('3:15 PM'),
                    );
                  }),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: SizedBox(
                        height:
                            100, // Set the height for the horizontal ListView
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: avatarData.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.grey, width: 3),
                                        ),
                                        child: CircleAvatar(
                                          radius:
                                              25, // Adjust the radius as needed
                                          backgroundImage: AssetImage(
                                              avatarData[index]['url']!),
                                          child:
                                              avatarData[index]['url'] == null
                                                  ? Text(
                                                      avatarData[index]['name']!
                                                          .substring(0, 1),
                                                      style: const TextStyle(
                                                          fontSize: 24),
                                                    )
                                                  : null,
                                        ),
                                      ),
                                      if (avatarData[index]['name'] ==
                                          'My Status')
                                        Positioned(
                                          right: -2,
                                          bottom: -2,
                                          child: Container(
                                            padding: const EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              color: Colors.green
                                                  .shade800, // Background color for icon
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2),
                                            ),
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(
                                      height:
                                          8), // Adjust the space between the avatar and text
                                  Text(
                                    avatarData[index]['name']!,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 18, top: 5),
                          child: Text(
                            'Channels',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, right: 2),
                          child: IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                AssetImage(avatarData[index]['url']!),
                          ),
                          title: Text(
                            avatarData[index]['name']!,
                            style: const TextStyle(fontSize: 14),
                          ),
                          subtitle: const Row(
                            children: [
                              Icon(Icons.link),
                              Text('  https://youtu.be/com')
                            ],
                          ),
                          trailing: const Text('Yesterday'),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: SizedBox(
                        height:
                            100, // Set the height for the horizontal ListView
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor:
                                Colors.teal, // Adjust the radius as needed
                            child: Icon(
                              Icons.link,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            'Create call link',
                          ),
                          subtitle: Text('Share a link for your WhatsApp call'),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 320, bottom: 15),
                      child: Text(
                        'Recent',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                AssetImage(avatarData[index]['url']!),
                          ),
                          title: Text(
                            avatarData[index]['name']!,
                            style: const TextStyle(fontSize: 14),
                          ),
                          subtitle: (index % 2 == 0)
                              ? const Text(
                                  'Missed voice call \n Yesterday 2:45 PM')
                              : const Text(
                                  'Missed Video call \n Today 8:30 AM'),
                          trailing: (index % 2 == 0)
                              ? const Icon(Icons.phone)
                              : const Icon(Icons.video_call),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class ExpandableContainer extends StatefulWidget {
  const ExpandableContainer({super.key});

  @override
  _ExpandableContainerState createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            leading: Stack(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.teal,
                  backgroundImage: AssetImage('assets/intern.jpg'),
                ),
                Positioned(
                  right: -2,
                  bottom: -2,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),
            title: const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text('Opportunities PK'),
            ),
          ),
          const Divider(),
          if (isExpanded)
            const Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.teal,
                    backgroundImage: AssetImage('assets/tech.jpg'),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text('Lectures'),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.teal,
                    backgroundImage: AssetImage('assets/zombie.jpg'),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text('GDG Peshawar'),
                  ),
                ),
              ],
            ),
          TextButton(
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(isExpanded ? 'View Less' : 'View All'),
          ),
        ],
      ),
    );
  }
}
