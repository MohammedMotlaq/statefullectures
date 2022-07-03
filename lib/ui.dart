import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  //const ({Key? key}) : super(key: key);

  @override
  State<Test> createState() {
    return Stateful();
}
}

class Stateful extends State<Test>{
  String content = 'Hello World!';
  Color backgroundcolor = Colors.white;
  int index = 0;
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        backgroundColor: backgroundcolor,
        appBar: AppBar(
          title: Text('stateful'),
        ),
        drawer: Drawer(
          child: Column(
            children:  [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.tealAccent),
                accountName: Text('Mohammed MOtlaq'),
                accountEmail: Text('mohammedmotlaq32@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text('Moh'),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                trailing:Icon(Icons.arrow_forward_ios)  ,
                subtitle: Text("Wish List Product"),
                title: Text("Home"),
                onTap:(){
                  index = 0;
                  setState((){
                    content = 'Home Page';
                    Navigator.pop(context);
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                trailing:Icon(Icons.arrow_forward_ios)  ,
                subtitle: Text("Favorite Products"),
                title: Text("Favorites"),
                onTap:(){
                  index = 1;
                  setState((){
                    content = 'Favorite';
                    Navigator.pop(context);
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.perm_identity),
                trailing:Icon(Icons.arrow_forward_ios)  ,
                subtitle: Text("Your Profile"),
                title: Text("Profile"),
                onTap:(){
                  index = 2;
                  setState((){
                    content = 'Your Profile';
                    Navigator.pop(context);
                  });
                },
              ),
            ],

          ),
        ),
        body: Container(

          width: 400,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(isDark ?'On' : 'Off'),
                  const Spacer(),
                  Switch(
                      value: isDark,
                      onChanged: (value){
                        isDark = value;
                        setState((){
                          
                        });
                      })
                ],
              ),
              Text(content, textAlign: TextAlign.center,),
              ElevatedButton(
                onPressed:() {
                  setState(() {
                    backgroundcolor = backgroundcolor == Colors.white ? Colors.blue :Colors.white;
                    content = content == 'Hello World!' ? 'Good By World.' : 'There is no World!';
                  });
                },
                child: Text('change content'),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (i){
            index=i;
            if (i == 0){
              content = 'Home';
            }else if(i == 1){
              content = 'favorite';
            }else{
              content = 'Identity';
            }
            setState ((){

            });
          },
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(icon:Icon(Icons.menu),label: 'Menu'),
            BottomNavigationBarItem(icon:Icon(Icons.favorite),label: 'Favorite'),
            BottomNavigationBarItem(icon:Icon(Icons.perm_identity),label: 'Identity'),

          ],
        ),
      ),
    );
  }
}




