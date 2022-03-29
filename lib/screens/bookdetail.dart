import 'dart:ui';
import 'package:book_worm/misc/colors.dart';
import 'package:book_worm/model/book.dart';
import 'package:book_worm/widgets/app_button.dart';
import 'package:book_worm/widgets/large_text.dart';
import 'package:book_worm/widgets/normal_text.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatelessWidget {
  Book book;
  BookDetail({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final arguments = (ModalRoute.of(context)?.settings.arguments ??
    //     <String, dynamic>{}) as Map;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Positioned(
              left: 0,
              right: 0,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: double.maxFinite,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
              )),
          Positioned(
              top: 5,
              right: 10,
              child: IconButton(
                  color: AppColors.textColor2,
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close))),
          Positioned(
              top: 180,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 580,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Container(
                  margin: const EdgeInsets.only(top: 180),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: NormalText(
                            text: 'By ' + book.author,
                            size: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Center(
                            child: LargeText(
                          text: book.title,
                          size: 20,
                        )),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            NormalText(text: 'ratings'),
                            NormalText(text: 'language'),
                            NormalText(text: 'pages')
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            LargeText(
                              text: '4.9',
                              size: 16,
                            ),
                            LargeText(
                              text: 'english',
                              size: 16,
                            ),
                            LargeText(
                              text: '300',
                              size: 16,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LargeText(
                                text: 'Overview',
                                size: 18,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              NormalText(text: "book description here"),
                            ],
                          ),
                        ),
                      ]),
                ),
              )),
          Positioned(
              left: MediaQuery.of(context).size.width / 4,
              top: 40,
              child: Container(
                width: 200,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/${book.image}'))),
              )),
          Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppButton(
                      backgroundColor: AppColors.white,
                      borderColor: AppColors.mainColor,
                      size: 80,
                      isIcon: true,
                      icon: Icons.favorite_border,
                      textColor: AppColors.mainColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    AppButton(
                      backgroundColor: AppColors.mainColor,
                      borderColor: AppColors.mainColor,
                      size: 250,
                      textColor: AppColors.white,
                      text: 'Start reading',
                    )
                  ])),
        ]),
      ),
    );
  }
}

//  appBar:
//             AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
//           IconButton(
//               color: Colors.black,
//               onPressed: () => Navigator.pop(context),
//               icon: Icon(Icons.close))
//         ]),
//         backgroundColor: Colors.white,
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//                 width: double.infinity,
//                 height: 200,
//                 child: Image.asset('assets/images/hp.jpg')),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               child: Text(
//                 'some title',
//                 style: TextStyle(fontSize: 30, color: Colors.black),
//               ),
//             ),
//             Text(
//               'By some author',
//               style: TextStyle(fontSize: 18, color: Colors.grey[600]),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text(
//                   'Rating',
//                   style: TextStyle(fontSize: 15, color: Colors.grey[600]),
//                 ),
//                 Text(
//                   'Pages',
//                   style: TextStyle(fontSize: 15, color: Colors.grey[600]),
//                 ),
//                 Text(
//                   'Language',
//                   style: TextStyle(fontSize: 15, color: Colors.grey[600]),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text(
//                   '4.5',
//                   style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//                 ),
//                 Text(
//                   '128',
//                   style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   'English',
//                   style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Expanded(
//               child: Container(
//                 margin: EdgeInsets.only(left: 10, right: 10),
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Overview',
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Stack(children: [
//                         Container(
//                           height: 200,
//                           child: SingleChildScrollView(
//                             scrollDirection: Axis.vertical,
//                             child: Text(
//                                 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae scelerisque justo. Mauris felis nisl, lacinia non neque ac, congue varius diam. Nulla bibendum ex ultricies, dignissim diam sed, consectetur sem. Vivamus gravida nec lectus a lobortis. Suspendisse mollis porttitor nisl sit amet molestie. Praesent eu condimentum libero. Phasellus placerat ornare orci nec tristique. In cursus mauris vel suscipit feugiat. Nam quis gravida quam. ' +
//                                     'Duis vehicula auctor convallis.Nunc at consectetur augue, at posuere dolor. Maecenas posuere libero lorem, vel ultricies quam fringilla id. Nunc consectetur enim nec metus dictum pellentesque. Phasellus consequat maximus metus at pretium. ' +
//                                     'Etiam facilisis rhoncus ex, vel bibendum nunc aliquet quis. Praesent at faucibus dolor, suscipit ornare nunc. Ut nisi est, congue a placerat et, porttitor id nibh. Maecenas vitae malesuada odio. Integer lacinia dui eros, vitae accumsan leo aliquam vitae. Donec leo justo, sodales vulputate sem id, iaculis iaculis libero. Pellentesque in facilisis libero, in facilisis dolor. Ut nec ligula ut augue ' +
//                                     'sagittis aliquam quis nec ex. Fusce commodo sem in vulputate tincidunt. Morbi elementum placerat magna sit amet vulputate.',
//                                 textAlign: TextAlign.left,
//                                 maxLines: 11,
//                                 style: TextStyle(
//                                     letterSpacing: 0.75,
//                                     fontSize: 15,
//                                     wordSpacing: 1,
//                                     overflow: TextOverflow.fade,
//                                     color: Colors.grey[700])),
//                           ),
//                         ),
//                       ]),
//                       Container(
//                         child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Container(
//                                 width: 150,
//                                 height: 60,
//                                 decoration: BoxDecoration(
//                                     color: Color(0xffcb997e),
//                                     borderRadius: BorderRadius.circular(20)),
//                                 child: MaterialButton(
//                                   onPressed: () => {},
//                                   child: Text(
//                                     'Read',
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 18),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 width: 150,
//                                 height: 60,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                     border: Border.all(
//                                         width: 1, color: Color(0xffcb997e))),
//                                 child: MaterialButton(
//                                   onPressed: () => {},
//                                   child: Text(
//                                     'Add to library',
//                                     style: TextStyle(
//                                         color:
//                                             Color.fromARGB(255, 160, 118, 95),
//                                         fontSize: 18),
//                                   ),
//                                 ),
//                               )
//                             ]),
//                       )
//                     ]),
//               ),
//             )
//           ],
//         ),
