import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pc = PageController();
  int current = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: PageView(
          controller: pc,
          onPageChanged: (value) {
            setState(() {
              current = value;
            });
          },
          children: const [
            OnBoardingItems(
                img: 'assets/1.png',
                title: 'Get Inspired',
                subtitle:
                    "Don't know what to eat? Take a\nPicture, we will suggest things to \n cookwith your ingredeints",
                color: Color.fromRGBO(255, 175, 78, 1)),
            OnBoardingItems(
                img: 'assets/2.png',
                title: 'Easy and Healthy',
                subtitle:
                    "Find thousands of easy and\nhealthy recipes so you save\n time and eat better",
                color: Color.fromRGBO(255, 190, 151, 1)),
            OnBoardingItems(
                img: 'assets/3.png',
                title: 'Save your favorites',
                subtitle:
                    "Save your favorite recipes and\nget reminder to buy the \n ingredeints to cook them",
                color: Color.fromRGBO(31, 176, 144, 1)),
          ],
        ),
        bottomNavigationBar: current == 2
            ? Container(
                height: size.height / 10,
                width: size.width,
                alignment: Alignment.center,
                color: const Color.fromRGBO(31, 176, 144, 1),
                child: Container(
                    height: size.width / 15,
                    width: size.width / 1.6,
                    child: Text(
                      'Get Started',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    alignment: Alignment.center),
              )
            : Container(
                height: size.height / 14,
                width: size.width,
                color: current == 0
                    ? Color.fromRGBO(255, 175, 78, 1)
                    : Color.fromRGBO(255, 190, 151, 1),
                child: Row(
                  children: [
                    SizedBox(
                      width: size.width / 40,
                    ),
                    TextButton(
                        onPressed: () {
                          pc.animateToPage(current - 1,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.ease);
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                    SizedBox(width: size.width / 4.5),
                    for (int i = 0; i <= 2; i++)
                      i == current ? buildCircle(true) : buildCircle(false),
                    SizedBox(width: size.width / 4.5),
                    TextButton(
                        onPressed: () {
                          pc.animateToPage(current + 1,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.ease);
                        },
                        child: Text(
                          'Get Started',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                  ],
                ),
              ));
  }

  Widget buildCircle(bool isActive) {
    return AnimatedContainer(
      padding: EdgeInsets.all(8),
      duration: Duration(milliseconds: 150),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50))),
    );
  }
}

class OnBoardingItems extends StatelessWidget {
  final String img, title, subtitle;
  final Color color;
  const OnBoardingItems(
      {Key? key,
      required this.img,
      required this.title,
      required this.subtitle,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: size.width,
        color: color,
        child: Column(
          children: [
            SizedBox(height: size.height / 10),
            Container(
              height: size.height / 2,
              width: size.width,
              decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: size.height / 20,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: size.height / 20),
          ],
        ));
  }
}
