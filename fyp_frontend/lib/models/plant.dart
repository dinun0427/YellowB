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
        "Black Sigatoka, caused by the fungus Mycosphaerella fijiensis, is a highly destructive leaf spot disease that significantly impacts banana cultivation worldwide. This disease is notorious for its ability to cause severe defoliation, which dramatically reduces the plant's photosynthetic capacity, thereby hindering growth and fruit development. Black Sigatoka manifests as small, streak-like lesions on the leaves, which evolve into larger necrotic areas with a characteristic black color. The disease cycle is accelerated by high humidity and warm temperatures, conditions prevalent in many of the world's banana-producing regions. Effective management of Black Sigatoka involves an integrated approach, including the use of resistant banana varieties, timely application of fungicides, and the adoption of cultural practices that reduce humidity around the foliage, such as proper spacing and pruning. Additionally, regular monitoring and removal of infected leaves can help in controlling the spread of the disease. Given its rapid spread and resistance to treatment, Black Sigatoka poses a significant challenge to sustainable banana production, necessitating ongoing research and adaptation of control measures.",
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
        'Cordana leaf spot disease, caused by the fungus Cordana musae, is a notable fungal disease that affects banana leaves, posing a threat to banana cultivation worldwide. This disease is characterized by the appearance of small, dark brown to black spots on the leaves, which can coalesce into larger necrotic areas, ultimately leading to reduced photosynthesis capability and overall vitality of the plant. The spots often have a yellow halo around them, making them easily distinguishable from other leaf spot diseases. Cordana leaf spot primarily targets weakened or stressed plants, gaining entry through wounds or natural openings, and is exacerbated by high humidity and wet conditions. The disease cycle is rapid, and if left unchecked, can lead to significant yield losses. Effective management strategies include the use of resistant banana varieties, implementation of good agricultural practices to reduce plant stress, regular monitoring for early detection, and, if necessary, the application of fungicides. Maintaining a clean field by removing infected plant debris also helps in controlling the spread of this disease, ensuring the sustainability of banana production.',
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
        "Fusarium Wilt, also known as Panama disease, is a devastating soil-borne disease caused by the fungus Fusarium oxysporum f. sp. cubense (Foc), which affects banana plants globally. This lethal disease is characterized by the wilting and yellowing of leaves, starting from the lower older leaves and progressing to the upper younger ones, eventually leading to the entire plant's death. Fusarium Wilt attacks the plant's vascular system, blocking water and nutrient flow, causing the internal tissues of the banana plant to turn a reddish-brown color. The disease thrives in warm, moist soil conditions and can remain dormant in the soil for decades, making it incredibly challenging to eradicate once it has established in a plantation. The spread of Panama disease is primarily through infected planting materials, soil, and water, and it has been responsible for significant economic losses in the banana industry. Controlling the disease focuses on preventive measures, including the use of disease-free planting material, crop rotation, and the development and use of resistant banana varieties. Due to its severe impact on banana production and limited effective treatment options, Fusarium Wilt remains one of the most feared diseases in the banana cultivation sector.",
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
        'Pestalotiopsis disease, caused by the fungal species belonging to the genus Pestalotiopsis, is an emerging threat to banana cultivation, manifesting as leaf spot and blight. This disease is marked by the appearance of small, water-soaked spots on banana leaves that gradually enlarge and become necrotic with gray centers and dark brown margins, often leading to leaf tissue death. In severe infections, these lesions coalesce, causing significant defoliation and weakening of the plant. Pestalotiopsis thrives in warm, humid conditions, favoring its proliferation and spread, especially in regions with dense planting and where moisture remains on leaf surfaces for extended periods. The fungus is known for its opportunistic behavior, often attacking plants that are already stressed by environmental factors, poor nutrition, or other diseases. Management of Pestalotiopsis disease in bananas includes the implementation of cultural practices such as ensuring good air circulation within plantations to reduce leaf wetness, removing and destroying infected plant debris to reduce the source of inoculum, and, when necessary, applying fungicides. Early detection and prompt action are crucial in minimizing the impact of this disease on banana production.',
        isSelected: false),
  ];
}