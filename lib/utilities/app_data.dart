import '../screens/onboarding/widgets/introduction_screens.dart';

class AppData {
  static const List<String> imagePathway = [
    'https://cdn.create.vista.com/downloads/e2444d67-5022-4d16-99f6-b043d58e5e4a_1024.jpeg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1yTgnj9RY3wQKedvoA6KnMnqiOFfYCEr2iQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQykpudVUJ_1cS5D5WLINtl88XWAaOEZEgGyw&s',
  ];
  static const List<String> popularImagesPath = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTja5KfxO1XDoVSbYlJJKxa-C46FHYemCD9Tw&s',
    'https://static01.nyt.com/images/2020/03/20/opinion/20Land/20Land-articleLarge.jpg?quality=75&auto=webp&disable=upscale',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2oalXc_RFT5e8kuHHcIxQ8HQGierWrbEpCA&s',
    'https://www.shutterstock.com/image-photo/portrait-happy-excited-smiling-young-600nw-2471642495.jpg',
  ];

  static const List<String> imagePathWelcome = [
    'https://cdn.prod.website-files.com/662a9a0b1860cf22db41bd69/662ff7377dec6027e008a4ac_Professional%20cleaning%20service%20(1).webp',
    'https://media.istockphoto.com/id/906777508/photo/portrait-of-diverse-janitors.jpg?s=612x612&w=0&k=20&c=egjW49zTzRtNqvq1tCVYzmxq8SJW4GK0dRGaJ7aet90=',
  ];
  static const List<String> serviceProviderName = [
    'Owovickky',
    'James',
    'Rodgriguez',
  ];
  static const List<String> serviceName = [
    'Home Cleaning',
    'Ac Repair',
    'Garden Clearing',
  ];
  static const List<double> price = [1700, 500, 960];
  static const List<IntroductionScreens> introScreens = [
    IntroductionScreens(
      bigText: 'Professional Home Help, Right when you need it',
      smallText:
          'Get trusted home services at your convenience. From cleaning to repairs, we connect you with skilled professionals who arrive right when you need them making home care simple, reliable, and stress free',
    ),
    IntroductionScreens(
      bigText: 'Pick a service , choose a time and we will render the rest ',
      smallText:
          'Easily schedule cleaning, repairs, or other home services at your convenience. Select what you need, set the time that works best for you, and let our professionals take care of everything while you relax',
    ),
  ];
}
