import 'dart:ffi';
import 'package:book_worm/main.dart';
import 'package:flutter/material.dart';
import 'package:book_worm/screens/bookdetail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

int _selectedIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
                child: Container(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(50)),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey[700],
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(50)),
                        hintText: 'Search books',
                        hintStyle:
                            TextStyle(color: Colors.grey[700], fontSize: 15)),
                  ),
                ),
              ),
              Container(
                height: 70,
                width: double.infinity,
                padding: EdgeInsets.only(top: 16, left: 25, right: 16),
                child: Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Text(
                          'Popular',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w800),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Text(
                          'View all',
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 15),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      height: 300,
                      width: 400,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        children: [
                          BookCards(
                              title: 'Harry Potter',
                              author: 'J.K Rowling',
                              image: 'hp.jpg'),
                          BookCards(
                              title: 'God Shot',
                              author: 'Chelsea Bieker',
                              image: 'gotshot.jpg'),
                          BookCards(
                              title: 'The Fault in our Stars',
                              author: 'John Green',
                              image: 'tfios.jpg'),
                          BookCards(
                              title: 'The Golden Flea',
                              author: 'Micheal Rips',
                              image: 'goldenflea.jpg'),
                        ],
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text('Top Authors',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w800)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    width: 400,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        children: [
                          AuthorAvatar(name: 'John Green', image: 'john.jpg'),
                          AuthorAvatar(
                              name: 'Chelsea Bieker', image: 'chelsea.jpg'),
                          AuthorAvatar(name: 'J.K Rowling', image: 'jk.jpg'),
                        ]),
                  ),
                ],
              ),
            ],
          ),
          bottomNavigationBar: Container(
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 8,
                      blurRadius: 12,
                      offset: Offset(0, 3))
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              child: BottomNavigationBar(
                unselectedItemColor: Colors.grey,
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                iconSize: 30,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: Colors.amberAccent,
                selectedIconTheme: IconThemeData(color: Color(0xffcb997e)),
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.book,
                      ),
                      label: 'Library'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.search,
                      ),
                      label: 'Search'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                      ),
                      label: 'Profile')
                ],
              ),
            ),
          )),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class DataSearch extends SearchDelegate<String> {
  final cities = ['Jeddah', "Riyadh", 'Addis Ababa'];
  final recentCities = ['New york', 'New Delhi', 'Uk'];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () => {}, icon: Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => {},
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestList = query.isEmpty ? recentCities : cities;
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.location_city),
        title: Text(suggestList[index]),
      ),
      itemCount: suggestList.length,
    );
  }
}

Widget BookCards({title, author, image}) {
  return InkWell(
    onTap: () => navigatorKey.currentState?.pushNamed('/book',
        arguments: {'title': title, 'author': author, 'image': image}),
    child: Container(
        margin: EdgeInsets.only(right: 16, left: 16, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 12,
                      offset: Offset(0, 3))
                ],
              ),
              margin: EdgeInsets.only(bottom: 16, top: 15),
              child: Hero(
                tag: title,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/${image}',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            )),
            LimitedBox(
              maxWidth: 150,
              child: Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              author,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            )
          ],
        )),
  );
}

Widget AuthorAvatar({name, image}) {
  return Container(
      margin: EdgeInsets.only(right: 16, left: 16, bottom: 8),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              width: 200,
              margin: EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blueGrey,
                        spreadRadius: 0.5,
                        blurRadius: 2,
                        offset: Offset(0, 1))
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[100]),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      foregroundImage: AssetImage('assets/images/${image}'),
                      radius: 35,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'book count',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ]),
            ))
          ]));
}
