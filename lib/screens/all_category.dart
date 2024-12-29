import 'package:flutter/material.dart';
import 'package:leatning_flutter/screens/get_each_category.dart';

class AllCategory extends StatelessWidget {
  final List allcategory;
  const AllCategory({super.key, required this.allcategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: allcategory.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return GetEachCategory(eachProduct: allcategory[index]);
                      }));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        allcategory[index],
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
