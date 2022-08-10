import 'package:flutter/material.dart';
import 'package:shop_app/layout/screens/login_screen.dart';
import 'package:shop_app/layout/widgets/page_veiw_item.dart';
import 'package:shop_app/models/boarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardinScreen extends StatelessWidget {
  OnBoardinScreen({Key? key}) : super(key: key);
  final PageController controller = PageController();
  int currentIndex = 0;
  final List<BoardingModel> models = [
    BoardingModel(
      title: 'Title 1',
      body: "Body 1",
      image: 'assets/images/onboarding1.png',
    ),
    BoardingModel(
      title: 'Title 2',
      body: "Body 2",
      image: 'assets/images/onboarding2.png',
    ),
    BoardingModel(
      title: 'Title 3',
      body: "Body 3",
      image: 'assets/images/onboarding3.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              icon: Text(
                "Skip",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: PageView.builder(
                itemBuilder: (context, index) => PageVeiwItemBuilder(
                  model: models[index],
                ),
                physics: const BouncingScrollPhysics(),
                controller: controller,
                itemCount: models.length,
                onPageChanged: (value) {
                  currentIndex = value;
                },
              ),
            ),
            Positioned(
              bottom: 10,
              left: MediaQuery.of(context).size.width * 0.40,
              child: SmoothPageIndicator(
                  controller: controller,
                  count: models.length,
                  effect: WormEffect(
                    activeDotColor: Theme.of(context).primaryColor,
                    dotColor: Colors.grey,
                    dotHeight: 10.0,
                    spacing: 10,
                    type: WormType.thin,
                  )),
            ),
            Positioned(
              right: 5,
              top: MediaQuery.of(context).size.height * 0.40,
              child: FloatingActionButton(
                elevation: 10,
                onPressed: () {
                  controller.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn);
                  if (currentIndex == models.length - 1) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  }
                },
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ));
  }
}
