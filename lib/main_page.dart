import 'package:flutter/material.dart';
import 'package:listview_gridview/main.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isGrid = true;

  List<String> items = [
    'Anna',
    'Brandon',
    'Emma',
    'Lucas',
    'Murphy',
    'Oliver',
    'Sophia',
    'Yasmin',
    'Zahara',
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      actions: [
        IconButton(
          icon: const Icon(Icons.calendar_view_month),
          tooltip: 'toggle view',
          onPressed: () {
            setState(() {
              isGrid = isGrid ? false : true;
            });

          },
        ),
      ],
      title: Text("ListView vs GridView"),
      centerTitle: true,
    ),
    body: buildList(),
  );


  Widget buildList() => isGrid ?
      GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // nombre of column
          crossAxisSpacing: 8, // spacing between column
            mainAxisSpacing: 5  // spacing between row
        ),
      itemCount: items.length,  // nombre of items
      itemBuilder: (context,index) {
        final item = items[index];

        return GridTile(child: InkWell(
          child: Ink.image(
            image: NetworkImage('https://source.unsplash.com/random?sig=$index'),
          fit: BoxFit.cover,
          ),
          onTap: () => selectedItem(item),
        ),
          footer: Container(
            padding: EdgeInsets.all(12),
            alignment: Alignment.center,
            child: Text(
              item,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
      )

     : ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index){
          final item = items[index];

      return ListTile(
        leading: CircleAvatar(
          radius: 28,
          backgroundImage: NetworkImage('https://source.unsplash.com/random?sig=$index'),
        ),
        title: Text(item),
        subtitle: Text('Subtitle $index'),
        onTap: () => selectedItem(item),
      );
    },
  );

  void selectedItem(String item){
    final snackBar = SnackBar(content: Text(
      'Selected $item...',
      style: TextStyle(fontSize: 24),
    ),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(snackBar);

  }


  }

