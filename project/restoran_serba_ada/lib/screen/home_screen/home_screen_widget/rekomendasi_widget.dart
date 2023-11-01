import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restoran_serba_ada/screen/home_screen/bloc/get_ai_reommendation_bloc/get_ai_recommendation_bloc.dart';
import 'package:restoran_serba_ada/screen/theme/theme_color.dart';
import 'package:restoran_serba_ada/screen/theme/theme_text.dart';
import 'package:restoran_serba_ada/screen/widget/text_field_widget.dart';

class RekomendasiWidget extends StatelessWidget {
  final String recommendation;
  const RekomendasiWidget({super.key, required this.recommendation});

  @override
  Widget build(BuildContext context) {
    TextEditingController dataController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        TextFieldWidget(
          hintText: 'Insert Requirements',
          errorMessage: '',
          dataController: dataController,
        ),
        const SizedBox(
          height: 14,
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                ThemeColor().lightRed,
              ),
            ),
            onPressed: () {
              BlocProvider.of<GetAiRecommendationBloc>(context)
                  .add(GetAIMenuRecommendationEvent(data: dataController.text));
            },
            child: const Text(
              'Get',
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          recommendation,
          style: ThemeTextStyle().textStyleForth,
        ),
      ],
    );
  }
}
