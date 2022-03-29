import 'dart:ffi';
import 'package:book_worm/main.dart';
import 'package:book_worm/misc/colors.dart';
import 'package:book_worm/model/book.dart';
import 'package:book_worm/widgets/large_text.dart';
import 'package:book_worm/widgets/normal_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:book_worm/screens/bookdetail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

int _selectedIndex = 0;

class _HomePageState extends State<HomePage> {
  var authors = {
    'john.jpg': 'John Green',
    'chelsea.jpg': 'Chelsea Bieker',
    'jk.jpg': 'J.K. Rowling',
    'anna.jpg': 'Anna Todd'
  }.entries.toList();
  List<Book> books = [
    Book(
        title: "Harry Potter and the Goblet of Fire",
        author: "J.K Rowling",
        image: "hp.jpg"),
    Book(title: "God Shot", author: "Chelsea Bieker", image: "gotshot.jpg"),
    Book(
        title: "The Golden Flea",
        author: "Micheal Rips",
        image: "goldenflea.jpg"),
    Book(
        title: "The Fault in Our Stars",
        author: "John Green",
        image: "tfios.jpg"),
    Book(title: "After", author: "Anna Todd", image: "afteranna.jpg")
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: const EdgeInsets.only(left: 20, top: 40),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              LargeText(
                text: "Explore",
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LargeText(
                    text: "Popular",
                    size: 20,
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      child: NormalText(text: 'See all'))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 350,
                child: ListView.builder(
                  itemCount: books.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(right: 25),
                    width: 200,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 8,
                              child: InkWell(
                                onTap: () => showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) =>
                                      BookDetail(book: books[index]),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          offset: Offset(0, 3))
                                    ],
                                  ),
                                  margin: EdgeInsets.only(bottom: 16, top: 15),
                                  child: Hero(
                                    tag: index,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        'assets/images/${books[index].image}',
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                          LargeText(
                            text: books[index].title,
                            size: 18,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          NormalText(text: books[index].author)
                        ]),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LargeText(
                    text: "Top Authors",
                    size: 20,
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      child: NormalText(text: 'See all'))
                ],
              ),
              Container(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: authors.length,
                  itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Container(
                            width: 100,
                            margin: EdgeInsets.only(right: 20),
                            child: CircleAvatar(
                              foregroundImage: AssetImage(
                                  'assets/images/${authors[index].key}'),
                              radius: 40,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: NormalText(
                            text: authors[index].value,
                          ),
                        )
                      ]),
                ),
              )
            ]),
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 0,
            selectedItemColor: AppColors.mainColor,
            unselectedItemColor: AppColors.textColor2,
            elevation: 0,
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            backgroundColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Library'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile")
            ],
          )),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
