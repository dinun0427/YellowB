import 'package:flutter/material.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/models/plant.dart';
import 'package:fyp_frontend/ui/screens/disease_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int SelectedIndex = -1;
  int pressedIndex = -1;

  List<Disease> _diseaseList = Disease.diseaseList.where((disease) => disease.diseaseId != 4).toList();

  //Toggle Favorite button
  bool toggleIsFavorated(bool isFavorited) {
    return !isFavorited;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0, // Adjust this value as needed
            left: 0,
            right: 0,
            bottom: 10,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ListView.builder(
                  itemCount: _diseaseList.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true, // This is important
                  itemBuilder: (BuildContext context, int index) {
                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onHover: (event) {
                        setState(() {
                          SelectedIndex = index;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          SelectedIndex = -1;
                        });
                      },
                      child: GestureDetector(
                        onTapDown: (details) {
                          setState(() {
                            pressedIndex = index;
                          });
                        },
                        onTapUp: (details) {
                          setState(() {
                            pressedIndex = -1;
                          });
                        },
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DiseaseDetailPage(
                                  disease: _diseaseList[
                                      index]), // Pass the selected disease to the detail page
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: pressedIndex == index
                                ? Constants.primaryColor.withOpacity(.3)
                                : SelectedIndex == index
                                    ? Constants.primaryColor.withOpacity(.2)
                                    : Constants.primaryColor.withOpacity(.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: size.height / 5, // Changed here
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          margin: const EdgeInsets.only(bottom: 10, top: 10),
                          width: size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    child: Center(
                                      child: Image.asset(
                                        _diseaseList[index].imageURL,
                                        height: 130.0, // Adjusted here
                                        width: 130.0, // Adjusted here
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    child: Align(
                                      alignment: Alignment.center, // Add this
                                      child: Container(
                                        width: size.width -
                                            180, // Adjust this value as needed
                                        margin: EdgeInsets.only(
                                            left: 155,
                                            top: 65,
                                            ),
                                        padding: EdgeInsets.only(
                                          right: 20
                                        ), // Add this
                                        child: Text(
                                          _diseaseList[index].diseaseName,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.height /
                                                6 *
                                                0.15, // Adjusted here
                                            color: Constants.blackColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}