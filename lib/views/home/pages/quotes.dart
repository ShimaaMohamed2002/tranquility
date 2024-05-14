import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquility/core/design/app_image.dart';
import 'package:tranquility/core/logic/helper_methods.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  final list = [
    QuoteModel(
      body:
          "The greatest glory in living lies not in never falling, but in rising every time we fall.",
      author: "Confucius",
    ),
    QuoteModel(
      body: "The purpose of our lives is to be happy.",
      author: "Dalai Lama",
    ),
    QuoteModel(
      body: "The only limit to our realization of tomorrow will be our doubts of today.",
      author: "Franklin D. Roosevelt",
    ),
    QuoteModel(
      body:
          "The greatest glory in living lies not in never falling, but in rising every time we fall.",
      author: "Nelson Mandela",
    ),
    QuoteModel(
      body: "Happiness is not something ready-made. It comes from your own actions.",
      author: "Dalai Lama",
    ),
    QuoteModel(
      body: "The only impossible journey is the one you never begin.",
      author: "Tony Robbins",
    ),
    QuoteModel(
      body: "Success is not final, failure is not fatal: It is the courage to continue that counts",
      author: "Winston Churchill",
    ),
    QuoteModel(
      body: "The future belongs to those who believe in the beauty of their dreams.",
      author: "Eleanor Roosevelt",
    ),
    QuoteModel(
      body: "Believe you can and you're halfway there.",
      author: "Theodore Roosevelt",
    ),
    QuoteModel(
      body: "The only way to do great work is to love what you do",
      author: "Steve Jobs",
    ),
    QuoteModel(
      body: "In the end, it's not the years in your life that count. It's the life in your years.",
      author: "Abraham Lincoln",
    )
  ];
  final bgs = [
    "https://static-cse.canva.com/blob/1145215/1.magebyRodionKutsaevviaUnsplash.jpg",
    "https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvdjU0NmJhdGNoMy1teW50LTM0LWJhZGdld2F0ZXJjb2xvcl8xLmpwZw.jpg",
    "https://images.unsplash.com/photo-1483232539664-d89822fb5d3e?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG8lMjBiYWNrZ3JvdW5kfGVufDB8fDB8fHww",
    "https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvcm0yMjItbWluZC0xNl8xLmpwZw.jpg",
    "https://plus.unsplash.com/premium_photo-1675603849941-835c6e9d28b5?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG8lMjBiYWNrZ3JvdW5kfGVufDB8fDB8fHww",
    "https://i.pinimg.com/474x/7e/9f/95/7e9f950bd6bee173fdbe80742bfc4114.jpg",
    "https://lumiere-a.akamaihd.net/v1/images/sa_pixar_virtualbg_coco_16x9_9ccd7110.jpeg?region=0,0,1920,1080&width=960",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: AppImage(
              "quotes_bg.jpg",
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            color: Color(0xffD9D9D9).withOpacity(.5),
          ),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {});
                },
                itemBuilder: (context, index) => Center(
                  child: Container(
                    margin: EdgeInsets.all(16.r),
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 36.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4.h),
                          blurRadius: 4.r,
                          color: Colors.black.withOpacity(.25),
                        ),
                      ],
                      color: Colors.white.withOpacity(.81),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppImage(
                          "quotes.svg",
                          color: Colors.black,
                          height: 50.h,
                          width: 50.h,
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              '“ ${list[index].body} “',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 32.sp,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text(
                            list[index].author,
                            style: TextStyle(
                              fontSize: 24.sp,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        GestureDetector(
                          onTap: () {
                            FlutterClipboard.copy(list[index].body).then((value) {
                              showMessage("Copied Success", type: MessageType.success);
                            }).catchError((ex) {
                              showMessage("Something Wrong");
                            });
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Copy",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                const AppImage("copy.svg")
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                itemCount: list.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class QuoteModel {
  final String body, author;

  QuoteModel({
    required this.body,
    required this.author,
  });
}
