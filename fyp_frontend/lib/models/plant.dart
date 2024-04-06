class Disease {
  final int diseaseId;
  final String cause;
  final double rating;
  final int humidity;
  final String temperature;
  final String diseaseName;
  final String imageURL;
  bool isFavorated;
  final String decription;
  bool isSelected;

  Disease(
      {required this.diseaseId,
        required this.diseaseName,
        required this.cause,
        required this.rating,
        required this.humidity,
        required this.temperature,
        required this.imageURL,
        required this.isFavorated,
        required this.decription,
        required this.isSelected});

  //List of Plants data
  static List<Disease> diseaseList = [
    Disease(
        diseaseId: 0,
        diseaseName: 'Black Sigatoka',
        cause: 'Black Sigatoka is a foliar disease of banana caused by the fungus Pseudocercospora fijiensis.',
        rating: 4.5,
        humidity: 34,
        temperature: '23 - 34',
        imageURL: 'assets/images/blacksigatoka.png',
        isFavorated: true,
        decription:
        'Black Sigatoka is a leaf spot disease of banana. It is an important economic banana disease in many countries around the world. Severely infected leaves can die, significantly reducing fruit yield, and causing mixed and premature ripening of fruit bunches. Early leaf symptoms are tiny reddish-rusty brown flecks that are most evident on the underside of leaves. These gradually lengthen, widen, and darken to form reddish-brown or dark brown or black leaf streaks. The early streaks run parallel to the leaf veins and are more evident on the underside of the leaf. The streaks broaden and become visible on both leaf surfaces. The streaks expand and become more oval shaped, and the centre of the lesion becomes sunken and turns grey over time. At this stage a yellow halo may develop around the edge of the lesion. In susceptible banana cultivars, high levels of disease can cause large areas of the leaf to die, which can lead to total leaf collapse. As leaves die, fruit yield is reduced and ripening of bunches can be uneven.',
        isSelected: false),
    Disease(
        diseaseId: 1,
        diseaseName: 'Cordana Leaf Spot',
        cause: 'Medium',
        rating: 4.8,
        humidity: 56,
        temperature: '19 - 22',
        imageURL: 'assets/images/cordana.png',
        isFavorated: false,
        decription:
        'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Disease(
        diseaseId: 3,
        diseaseName: 'Fusarium Wilt',
        cause: 'Small',
        rating: 4.5,
        humidity: 35,
        temperature: '23 - 28',
        imageURL: 'assets/images/fusariumwilt.png',
        isFavorated: false,
        decription:
        'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Disease(
        diseaseId: 4,
        diseaseName: 'Pestalotiopsis',
        cause: 'Large',
        rating: 4.1,
        humidity: 66,
        temperature: '12 - 16',
        imageURL: 'assets/images/pestalotiopsis.png',
        isFavorated: true,
        decription:
        'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
  ];
}