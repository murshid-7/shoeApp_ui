import 'package:flutter/material.dart';
import 'package:sneaker_store/screens/catagory_page.dart';
import 'package:sneaker_store/screens/home_page.dart';

class brandsLogo extends StatelessWidget {
  const brandsLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        brandLogos(
            'https://seeklogo.com/images/P/puma-logo-9092D1BD56-seeklogo.com.png',
            () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => PumaPage()));
        }),
        brandLogos(
            'https://seeklogo.com/images/A/adidas-logo-DE36EE9B0E-seeklogo.com.png',
            () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => adidasPage()));
        }),
        brandLogos(
            'https://seeklogo.com/images/N/Nike_Plus-logo-548F1B3E8F-seeklogo.com.png',
            () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => PumaPage()));
        }),
        brandLogos(
            'https://seeklogo.com/images/R/reebok-classic-logo-8620627707-seeklogo.com.png',
            () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ReebokPAge()));
        }),
      ],
    );
  }
}
