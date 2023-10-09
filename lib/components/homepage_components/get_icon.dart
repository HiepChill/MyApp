import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget getWeatherIcon(int code) {
  switch (code) {
    case >= 200 && < 300:
      return Lottie.network(
          'https://lottie.host/96126d26-e37f-49df-8e69-d4245f2db59b/uKt7Pr0FOQ.json');
    case >= 300 && < 400:
      return Lottie.network(
          'https://lottie.host/fe7c7c41-13cf-456e-8f2e-a9066c75533a/2iOfrHZPH7.json');
    case >= 500 && < 600:
      return Lottie.network(
          'https://lottie.host/25d58a06-1fa4-4153-8673-e5874d8ba1fa/YjOEtwgycz.json');
    case >= 600 && < 700:
      return Lottie.network(
          'https://lottie.host/785200a8-d0d8-4ba9-80b7-0880ad5cf1df/tqlp0to16T.json');
    case >= 700 && < 800:
      return Lottie.network(
          'https://lottie.host/a31ccd70-47c5-4bed-86a5-9f58f8835517/7UvQ3cd8VU.json');
    case == 800:
      return Lottie.network(
          'https://lottie.host/55411935-5017-457e-8534-e5b625b285fd/ZnS67AE0ES.json');
    case > 800 && <= 804:
      return Lottie.network(
          'https://lottie.host/bada60bc-1f70-426c-a282-394709831f4b/arxQzCvPEI.json');
    default:
      return Lottie.network(
          'https://lottie.host/bada60bc-1f70-426c-a282-394709831f4b/arxQzCvPEI.json');
  }
}
