part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String output = "Data is empty";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("---Demo get API---"),
              Text(output),
              ElevatedButton(
                  onPressed: () {
                    UserList.getUsers("1").then((users) {
                      output = "";
                      for (int i = 0; i < users.length; i++)
                        output = output + "[" + users[i].name + "]\n";
                      setState(() {});
                    });
                  },
                  child: Text("Get data"))
            ],
          ),
        ),
      ),
    );
  }
}
