
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List locales = [
    "English",
    "فارسی",
    "العربی"
  ];

  //Language code use to change language based on code
  List localeCodes = [
    "en",
    "fa",
    "ar"
  ];

  int currentIndex = 0;

  bool selectedLocale = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Now if we want our text widget get translated we should replace Text widget with LocaleText
        title: const LocaleText("welcome"),
      ),

      //Now we are going to create language to switch between

      body: Center(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: locales.length,
            itemBuilder: (context,index){
              //If currentIndex equal index of builder the the bool value gets true
              selectedLocale = currentIndex == index;
          return Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8)
            ),
            child: ListTile(
              onTap: (){
                // in here we make a click on each language to switch between based on its index
                setState(() {
                  // Sorry my mistake
                  currentIndex = index;
                });
                Locales.change(context, localeCodes[currentIndex]);
              },
              //So now we want the leading icon to change after selected language
              leading: Icon(selectedLocale? Icons.check : Icons.language,color: Colors.white,),
              title: Text(locales[index],style: const TextStyle(color: Colors.white),),
              trailing: const Icon(Icons.arrow_forward_ios_rounded,size: 15,color: Colors.white,),
            ),
          );
        }),
      ),
    );
  }
}
