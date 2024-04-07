class Disease {
  final int diseaseId;
  final String cause;
  final String culturalPractices;
  final String chemicalControl;
  final String nutrientManagement;
  final String diseaseName;
  final String imageURL;
  final String decription;

  Disease({
    required this.diseaseId,
    required this.diseaseName,
    required this.cause,
    required this.culturalPractices,
    required this.chemicalControl,
    required this.nutrientManagement,
    required this.imageURL,
    required this.decription,
  });

  //List of Plants data
  static List<Disease> diseaseList = [
    Disease(
      diseaseId: 1,
      diseaseName: 'Black Sigatoka',
      cause:
          "Black Sigatoka is a foliar disease of banana caused by the fungus Pseudocercospora fijiensis.",
      chemicalControl:
          "Apply protective fungicides like mancozeb and systemic fungicides such as propiconazole, azoxystrobin, and difenoconazole according to recommended guidelines. It's crucial to rotate fungicides with different modes of action to prevent the development of resistance.\n\n- Fungicide applications are more effective when done at the early stages of disease development. A regular spraying schedule, based on the lifecycle of the disease and local weather conditions, is essential.",
      culturalPractices:
          "- Regularly remove infected leaves from the plant and farm. This reduces the amount of infectious material that can spread the disease. Ensure that the removed leaves are properly disposed of, preferably by burning or burying.\n\n- Plant banana plants at a proper distance to ensure good air circulation. This helps in reducing humidity around the leaves, making conditions less favorable for the disease.\n\n- Keep the plantation area clean from plant debris and weeds that can harbor the fungus.\n\n- Avoid overhead irrigation that wets the leaves and instead use drip or furrow irrigation to minimize leaf wetness.",
      nutrientManagement:
          "- A balanced application of NPK (Nitrogen, Phosphorus, Potassium) fertilizers can improve plant health and resistance to diseases. The exact formulation should be based on soil fertility tests.\n\n- Application of micronutrients like zinc, magnesium, and calcium can also enhance the plant's resistance to diseases. Foliar sprays of these nutrients can be beneficial.\n\n- Incorporating organic matter into the soil improves soil structure and fertility, supporting overall plant health and disease resistance.",
      imageURL: 'assets/images/blacksigatoka.png',
      decription:
          "Black Sigatoka, caused by the fungus Mycosphaerella fijiensis, is a highly destructive leaf spot disease that significantly impacts banana cultivation worldwide. This disease is notorious for its ability to cause severe defoliation, which dramatically reduces the plant's photosynthetic capacity, thereby hindering growth and fruit development. Black Sigatoka manifests as small, streak-like lesions on the leaves, which evolve into larger necrotic areas with a characteristic black color. The disease cycle is accelerated by high humidity and warm temperatures, conditions prevalent in many of the world's banana-producing regions. Effective management of Black Sigatoka involves an integrated approach, including the use of resistant banana varieties, timely application of fungicides, and the adoption of cultural practices that reduce humidity around the foliage, such as proper spacing and pruning. Additionally, regular monitoring and removal of infected leaves can help in controlling the spread of the disease. Given its rapid spread and resistance to treatment, Black Sigatoka poses a significant challenge to sustainable banana production, necessitating ongoing research and adaptation of control measures.",
    ),
    Disease(
      diseaseId: 2,
      diseaseName: 'Cordana Leaf Spot',
      cause:
          "Cordana leaf spot is primarily caused by the fungi Cordana musae (Zimm.) Höhn. and Kirramyces epicoccoides (Corda) Petr., which thrive in warm, humid environments.",
      chemicalControl:
          "- Copper-based fungicides can provide a protective barrier on the leaf surface, preventing fungal spores from infecting the plant.\n\n- For established infections, systemic fungicides (those that are absorbed and moved throughout the plant) can be effective. However, always follow label directions and local regulations regarding fungicide use.",
      culturalPractices:
          "- Regularly remove and destroy infected plant material to reduce the spread of the fungus. Clean tools and equipment to prevent transmission to healthy plants.\n\n- Avoid overhead irrigation to minimize leaf wetness, which can promote fungal growth. Use drip irrigation or water at the base of the plant.\n\n- Ensure adequate spacing between plants to improve air circulation, which can help reduce humidity around the leaves.\n\n- Manage weeds around the banana plants, as they can harbor pests and diseases, including Cordana leaf spot.",
      nutrientManagement:
          "- Ensure a balanced application of essential nutrients, particularly nitrogen (N), phosphorus (P), and potassium (K), based on soil test results.\n\n- Application of micronutrients, such as zinc, manganese, and boron, can also support plant health and may enhance disease resistance.\n\n- Maintain soil pH within the optimal range for banana cultivation (5.5 to 6.5) to ensure nutrient availability and uptake.",
      imageURL: 'assets/images/cordana.png',
      decription:
          'Cordana leaf spot disease, caused by the fungus Cordana musae, is a notable fungal disease that affects banana leaves, posing a threat to banana cultivation worldwide. This disease is characterized by the appearance of small, dark brown to black spots on the leaves, which can coalesce into larger necrotic areas, ultimately leading to reduced photosynthesis capability and overall vitality of the plant. The spots often have a yellow halo around them, making them easily distinguishable from other leaf spot diseases. Cordana leaf spot primarily targets weakened or stressed plants, gaining entry through wounds or natural openings, and is exacerbated by high humidity and wet conditions. The disease cycle is rapid, and if left unchecked, can lead to significant yield losses. Effective management strategies include the use of resistant banana varieties, implementation of good agricultural practices to reduce plant stress, regular monitoring for early detection, and, if necessary, the application of fungicides. Maintaining a clean field by removing infected plant debris also helps in controlling the spread of this disease, ensuring the sustainability of banana production.',
    ),
    Disease(
      diseaseId: 3,
      diseaseName: 'Healthy',
      cause: "",
      chemicalControl: "",
      culturalPractices: "",
      nutrientManagement: "",
      imageURL: 'assets/images/cordana.png',
      decription: "",
    ),
    Disease(
      diseaseId: 4,
      diseaseName: 'Unrecognized Disease',
      cause: "",
      chemicalControl: "",
      culturalPractices: "",
      nutrientManagement: "",
      imageURL: 'assets/images/cordana.png',
      decription: "",
    ),
    Disease(
      diseaseId: 5,
      diseaseName: 'Fusarium Wilt',
      cause:
          "Fusarium wilt is caused by the soil-borne fungus Fusarium oxysporum f. sp. cubense.",
      chemicalControl:
          "- Currently, there are no fungicides proven to be effective against Fusarium wilt once the plant is infected. Soil fumigation with chemicals has been tested, but it is not a sustainable or environmentally friendly solution, especially for large-scale banana production.",
      culturalPractices:
          "- Planting resistant banana cultivars is the most effective way to manage Fusarium wilt. Research and consult with agricultural experts to select suitable resistant varieties for your area.\n\n- Avoid planting bananas in soils that have previously hosted Fusarium wilt-infected plants. Crop rotation with non-host crops can help reduce soil inoculum levels.\n\n- Clean tools and equipment to prevent the spread of the fungus. Implement quarantine measures to prevent the introduction of the disease into uninfected areas.\n\n- Improve soil drainage and avoid waterlogging, which can exacerbate the conditions for Fusarium wilt.",
      nutrientManagement:
          "- Apply fertilizers based on soil nutrient analyses to ensure plants receive adequate but not excessive nutrients. Over-fertilization, particularly with nitrogen, can increase disease severity.\n\n- Adequate potassium nutrition is crucial for improving plant resistance to biotic and abiotic stresses. Potassium helps in strengthening plant tissues and improving water regulation.\n\n- Adequate levels of calcium and magnesium are also important for maintaining plant health and potentially reducing vulnerability to Fusarium wilt.\n\n- Incorporating organic matter into the soil can improve soil structure, water retention, and beneficial microbial activity, which may help suppress soil-borne pathogens.",
      imageURL: 'assets/images/fusariumwilt.png',
      decription:
          "Fusarium Wilt, also known as Panama disease, is a devastating soil-borne disease caused by the fungus Fusarium oxysporum f. sp. cubense (Foc), which affects banana plants globally. This lethal disease is characterized by the wilting and yellowing of leaves, starting from the lower older leaves and progressing to the upper younger ones, eventually leading to the entire plant's death. Fusarium Wilt attacks the plant's vascular system, blocking water and nutrient flow, causing the internal tissues of the banana plant to turn a reddish-brown color. The disease thrives in warm, moist soil conditions and can remain dormant in the soil for decades, making it incredibly challenging to eradicate once it has established in a plantation. The spread of Panama disease is primarily through infected planting materials, soil, and water, and it has been responsible for significant economic losses in the banana industry. Controlling the disease focuses on preventive measures, including the use of disease-free planting material, crop rotation, and the development and use of resistant banana varieties. Due to its severe impact on banana production and limited effective treatment options, Fusarium Wilt remains one of the most feared diseases in the banana cultivation sector.",
    ),
    Disease(
      diseaseId: 6,
      diseaseName: 'Pestalotiopsis',
      cause: "Pestalotiopsis leaf spot is caused by fungi in the genus Pestalotiopsis.",
      chemicalControl: "- Broad-spectrum fungicides containing active ingredients such as copper formulations, mancozeb, or chlorothalonil can be effective in managing Pestalotiopsis leaf spot. Apply according to label instructions and local regulations.\n\n- To prevent the development of resistance, rotate fungicides with different modes of action during the growing season.",
      culturalPractices: "- Regular removal and destruction of infected leaves and plant debris can reduce the spread of spores. It's important to clean tools and equipment after use to avoid spreading the disease to healthy plants.\n\n- Avoid overhead irrigation that wets the foliage, as wet leaves can promote fungal growth. Use drip irrigation or water at the base of the plant to keep leaves dry.\n\n- Ensure bananas are planted at an appropriate spacing to enhance air circulation around the plants, which can help reduce leaf wetness and humidity.\n\n- Prune excess leaves to improve air flow within the canopy, which can help reduce humidity and leaf wetness.",
      nutrientManagement: "- Use a balanced NPK (Nitrogen, Phosphorus, Potassium) fertilizer regimen based on soil tests to avoid nutrient imbalances that can stress plants and make them more susceptible to infection.\n\n- Ensure adequate levels of essential micronutrients such as zinc, manganese, and boron, which can support overall plant health and immune response.\n\n- Incorporating organic matter into the soil can improve its structure and fertility, fostering a healthier root system and more resilient plants.",
      imageURL: 'assets/images/pestalotiopsis.png',
      decription:
          'Pestalotiopsis disease, caused by the fungal species belonging to the genus Pestalotiopsis, is an emerging threat to banana cultivation, manifesting as leaf spot and blight. This disease is marked by the appearance of small, water-soaked spots on banana leaves that gradually enlarge and become necrotic with gray centers and dark brown margins, often leading to leaf tissue death. In severe infections, these lesions coalesce, causing significant defoliation and weakening of the plant. Pestalotiopsis thrives in warm, humid conditions, favoring its proliferation and spread, especially in regions with dense planting and where moisture remains on leaf surfaces for extended periods. The fungus is known for its opportunistic behavior, often attacking plants that are already stressed by environmental factors, poor nutrition, or other diseases. Management of Pestalotiopsis disease in bananas includes the implementation of cultural practices such as ensuring good air circulation within plantations to reduce leaf wetness, removing and destroying infected plant debris to reduce the source of inoculum, and, when necessary, applying fungicides. Early detection and prompt action are crucial in minimizing the impact of this disease on banana production.',
    ),
  ];
}
