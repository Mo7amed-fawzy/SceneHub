import 'package:ai_movie_app/core/utils/app_text_styles.dart';
import 'package:ai_movie_app/feature/on_bourding/data/models/on_boarding_model.dart';
import 'package:ai_movie_app/feature/on_bourding/presentation/views/widgets/custom_smooth_page_indecator.dart';
import 'package:flutter/material.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({
    super.key,
    required this.controler,
    this.onPageChanged,
  });
  // تحديد أن الكائن هو ثابت يمكن إنشاؤه مرة واحدة فقط، ويمكن استخدامه في أوقات لاحقة دون الحاجة إلى إعادة إنشائه const
  // بس علشان بستعمل فاينال فدا معناه ان المتغيرات دي مش ثابته
  final PageController controler;
  // فاينال يعني هعين قيمته مره وحده بس (غير ثابته)

  final Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return
    // Expanded(
    SizedBox(
      height: 500,
      //دي البتخليني اسكرول يمين وشمال حسب الداتا العندي
      child: PageView.builder(
        onPageChanged: onPageChanged,
        physics: const BouncingScrollPhysics(),
        controller: controler,
        itemCount: onBoardingData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: 290,
                height: 343,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(onBoardingData[index].imagePath),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              // Image.asset(Assets.imagesOnBoarding1),
              const SizedBox(height: 13),
              CustomSmoothPageIndicator(controller: controler),
              const SizedBox(height: 13),
              Text(
                onBoardingData[index].title,
                style: CustomTextStyles.poppins400style16.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Text(
                onBoardingData[index].subTitle,
                style: CustomTextStyles.poppins400style16,
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}
