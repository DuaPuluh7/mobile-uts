import 'package:a/pages/login_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.transparent,
                      width: 0,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('lib/images/orang.jpg'),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Your Name",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Poppins', // Mengubah font menjadi 'Poppins'
                  ),
                ),
                Text(
                  ("Login As: " + user.email!),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'Poppins', // Mengubah font menjadi 'Poppins'
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 180,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                final card = profileCompletionCards[index];
              return SizedBox(
                width: 160,
                child: Card(
                  shadowColor: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Icon(
                          card.icon,
                          size: 30,
                        ),
                        SizedBox(height: 10),
                        Text(
                          card.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins', // Mengubah font menjadi 'Poppins'
                          ),
                        ),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            primary: Colors.black,
                          ),
                          child: Text(
                            card.buttonText,
                            style: TextStyle(
                              fontFamily: 'Poppins', // Mengubah font menjadi 'Poppins'
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context,index)=> 
            const Padding(
              padding: EdgeInsets.only(right: 5)),
              itemCount: profileCompletionCards.length,
            ),
          ),
          SizedBox(height: 20),
          ...List.generate(
            customListTiles.length,
            (index) {
              final title = customListTiles[index];
              if (title.title == "Logout") {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Card(
                    elevation: 4,
                    shadowColor: Colors.black12,
                    child: ListTile(
                      leading: Icon(title.icon),
                      title: Text(
                        title.title,
                        style: TextStyle(
                          fontFamily: 'Poppins', // Mengubah font menjadi 'Poppins'
                        ),
                      ),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {
                        // Show an alert dialog
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Logout Confirmation"),
                            content: Text("Are you sure you want to log out?"),
                            actions: [
                              TextButton(
                                child: Text("Cancel"),
                                onPressed: () {
                                  // Close the alert dialog
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                               child: Text("Yes"),
                                onPressed: () async {
                                  await FirebaseAuth.instance.signOut();
                                  Navigator.of(context).pop();

                                  // Arahkan pengguna kembali ke halaman AuthPage
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Card(
                    elevation: 4,
                    shadowColor: Colors.black12,
                    child: ListTile(
                      leading: Icon(title.icon),
                      title: Text(
                        title.title,
                        style: TextStyle(
                          fontFamily: 'Poppins', // Mengubah font menjadi 'Poppins'
                        ),
                      ),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class ProfileCompletionCard {
  final String title;
  final String buttonText;
  final IconData icon;
  ProfileCompletionCard({
    required this.title,
    required this.buttonText,
    required this.icon
  });
}

List<ProfileCompletionCard> profileCompletionCards = [
  ProfileCompletionCard(
    icon: CupertinoIcons.person_circle,
    title: "Set Your Profile Details",
    buttonText: "Continue",
  ),
  ProfileCompletionCard(
    icon: CupertinoIcons.doc,
    title: "Upload Your Resume",
    buttonText:"Upload",
  ),
  ProfileCompletionCard(
    icon: CupertinoIcons.square_list,
    title: "Add Your Skills",
    buttonText: "Add",
  ),
];

class CustomListTile {
  final IconData icon;
  final String title;
  CustomListTile({
    required this.icon,
    required this.title,
  });
}

List<CustomListTile> customListTiles = [
  CustomListTile(
    icon: Icons.insights,
    title: "Activity",
  ),
  CustomListTile(
    icon: CupertinoIcons.bell,
    title: "Notification",
  ),
  CustomListTile(
    icon: Icons.settings,
    title: "Settings",
  ),
  CustomListTile(
    icon: CupertinoIcons.arrow_right_arrow_left,
    title: "Logout",
  ),
];
