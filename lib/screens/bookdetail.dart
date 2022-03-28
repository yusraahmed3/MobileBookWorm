import 'dart:ffi';
import 'package:book_worm/main.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    return SafeArea(
      child: Scaffold(
        appBar:
            AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
          IconButton(
              color: Colors.black,
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.close))
        ]),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                width: double.infinity,
                height: 200,
                child: Image.asset('assets/images/${arguments['image']}')),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                arguments['title'],
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
            Text(
              'By ' + arguments['author'],
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Rating',
                  style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                ),
                Text(
                  'Pages',
                  style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                ),
                Text(
                  'Language',
                  style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '4.5',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  '128',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'English',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Overview',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Stack(children: [
                        Container(
                          height: 200,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae scelerisque justo. Mauris felis nisl, lacinia non neque ac, congue varius diam. Nulla bibendum ex ultricies, dignissim diam sed, consectetur sem. Vivamus gravida nec lectus a lobortis. Suspendisse mollis porttitor nisl sit amet molestie. Praesent eu condimentum libero. Phasellus placerat ornare orci nec tristique. In cursus mauris vel suscipit feugiat. Nam quis gravida quam. ' +
                                    'Duis vehicula auctor convallis.Nunc at consectetur augue, at posuere dolor. Maecenas posuere libero lorem, vel ultricies quam fringilla id. Nunc consectetur enim nec metus dictum pellentesque. Phasellus consequat maximus metus at pretium. ' +
                                    'Etiam facilisis rhoncus ex, vel bibendum nunc aliquet quis. Praesent at faucibus dolor, suscipit ornare nunc. Ut nisi est, congue a placerat et, porttitor id nibh. Maecenas vitae malesuada odio. Integer lacinia dui eros, vitae accumsan leo aliquam vitae. Donec leo justo, sodales vulputate sem id, iaculis iaculis libero. Pellentesque in facilisis libero, in facilisis dolor. Ut nec ligula ut augue ' +
                                    'sagittis aliquam quis nec ex. Fusce commodo sem in vulputate tincidunt. Morbi elementum placerat magna sit amet vulputate.',
                                textAlign: TextAlign.left,
                                maxLines: 11,
                                style: TextStyle(
                                    letterSpacing: 0.75,
                                    fontSize: 15,
                                    wordSpacing: 1,
                                    overflow: TextOverflow.fade,
                                    color: Colors.grey[700])),
                          ),
                        ),
                      ]),
                      Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 150,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Color(0xffcb997e),
                                    borderRadius: BorderRadius.circular(20)),
                                child: MaterialButton(
                                  onPressed: () => {},
                                  child: Text(
                                    'Read',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                              Container(
                                width: 150,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        width: 1, color: Color(0xffcb997e))),
                                child: MaterialButton(
                                  onPressed: () => {},
                                  child: Text(
                                    'Add to library',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 160, 118, 95),
                                        fontSize: 18),
                                  ),
                                ),
                              )
                            ]),
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
