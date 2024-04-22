import 'package:flutter/material.dart';
import 'package:sneaker_store/screens/brands/puma.dart';
import 'package:sneaker_store/screens/catagory_page.dart';

class BrandsLogo extends StatelessWidget {
  const BrandsLogo({
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
              .push(MaterialPageRoute(builder: (context) => PumaStore()));
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


Widget brandLogos(String imagePath, Function() onPressed) {
  return Expanded(
    child: TextButton(
      onPressed: onPressed,
      child: Image.network(
        imagePath,
        width: 50,
        height: 40,
        fit: BoxFit.contain,
      ),
    ),
  );
}