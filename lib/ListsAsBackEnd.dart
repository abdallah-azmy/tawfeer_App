List productsInCart = [];
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
List FavoriteProducts = [];

//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

List products = [
  {
    'dept': 'قسم 1',
    'name': 'منتج 1',
    'price': '199',
    'oldPrice': '299',
    "fav": "false",
    'image': [
      'images/producti.png',
      'images/producti.png',
      'images/producti.png',
      'images/producti.png',
    ],
    "rate": "10",
    "id": "0",
    "availableNum": "10",
    "site": "https://www.google.com/"
  },
  {
    'dept': 'قسم 2',
    'name': 'منتج 2',
    'price': '199',
    'oldPrice': '299',
    "fav": "false",
    'image': [
      'images/productii.png',
      'images/productii.png',
      'images/productii.png',
      'images/productii.png',
    ],
    "rate": "10",
    "id": "1",
    "availableNum": "10",
    "site": "https://www.google.com/"
  },
  {
    'dept': 'قسم 3',
    'name': 'منتج 3',
    'price': '199',
    'oldPrice': '299',
    "fav": "false",
    'image': [
      'images/productviiii.png',
      'images/productviiii.png',
      'images/productviiii.png',
      'images/productviiii.png',
    ],
    "rate": "10",
    "id": "2",
    "availableNum": "10",
    "site": "https://www.google.com/"
  },
  {
    'dept': 'قسم 4',
    'name': 'منتج 4',
    'price': '199',
    'oldPrice': '299',
    "fav": "false",
    'image': [
      'images/producti.png',
      'images/producti.png',
      'images/producti.png',
      'images/producti.png',
    ],
    "rate": "10",
    "id": "3",
    "availableNum": "10",
    "site": "https://www.google.com/"
  },
  {
    'dept': 'قسم 5',
    'name': 'منتج 5',
    'price': '199',
    'oldPrice': '299',
    "fav": "false",
    'image': [
      'images/producti.png',
      'images/producti.png',
      'images/producti.png',
      'images/producti.png',
    ],
    "rate": "10",
    "id": "4",
    "availableNum": "10",
    "site": "https://www.google.com/"
  },
  {
    'dept': 'قسم 6',
    'name': 'منتج 6',
    'price': '199',
    'oldPrice': '299',
    "fav": "false",
    'image': [
      'images/productii.png',
      'images/productii.png',
      'images/productii.png',
      'images/productii.png',
    ],
    "rate": "10",
    "id": "5",
    "availableNum": "10",
    "site": "https://www.google.com/"
  },
  {
    'dept': 'قسم 7',
    'name': 'منتج 7',
    'price': '199',
    'oldPrice': '299',
    "fav": "false",
    'image': [
      'images/productviiii.png',
      'images/productviiii.png',
      'images/productviiii.png',
      'images/productviiii.png',
    ],
    "rate": "10",
    "id": "6",
    "availableNum": "10",
    "site": "https://www.google.com/"
  },
];

//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

List comments = [
  {
    "rate": "5",
    "name": "مستخدم 1",
    "comment":
        "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص",
  },
  {
    "rate": "4",
    "name": "مستخدم 2",
    "comment":
        "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص",
  },
  {
    "rate": "5",
    "name": "مستخدم 3",
    "comment":
        "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص",
  },
  {
    "rate": "4",
    "name": "مستخدم 4",
    "comment":
        "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص",
  }
];

//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

List notificatione = [
  {"notification": "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة"},
  {"notification": "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة"},
  {"notification": "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة"},
  {"notification": "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة"},
  {"notification": "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة"},
  {"notification": "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة"},
];

//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

List depts = [
  {
    "id": "0",
    "name": "مواد غذائية",
    "image": "images/product.png",
  },
  {
    "id": "1",
    "name": "العناية بالبشرة",
    "image": "images/product.png",
  },
  {
    "id": "2",
    "name": "أدوات تنظيف",
    "image": "images/product.png",
  },
  {
    "id": "3",
    "name": "الملابس",
    "image": "images/product.png",
  },
  {
    "id": "4",
    "name": "هواتف ذكية",
    "image": "images/product.png",
  },
  {
    "id": "5",
    "name": "أجهزة كهربائية",
    "image": "images/product.png",
  },
  {
    "id": "6",
    "name": "مواد غذائية",
    "image": "images/product.png",
  },
  {
    "id": "7",
    "name": "مواد غذائية",
    "image": "images/product.png",
  },
  {
    "id": "8",
    "name": "مواد غذائية",
    "image": "images/product.png",
  },
  {
    "id": "9",
    "name": "مواد غذائية",
    "image": "images/product.png",
  },
];

//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

List offers = [
  {
    "id": "0",
    "text": "التصميم الخاص بالعرض",
  },
  {
    "id": "1",
    "text": "التصميم الخاص بالعرض",
  },
  {
    "id": "2",
    "text": "التصميم الخاص بالعرض",
  },
  {
    "id": "3",
    "text": "التصميم الخاص بالعرض",
  },
  {
    "id": "4",
    "text": "التصميم الخاص بالعرض",
  },
  {
    "id": "5",
    "text": "التصميم الخاص بالعرض",
  },
  {
    "id": "6",
    "text": "التصميم الخاص بالعرض",
  },
  {
    "id": "7",
    "text": "التصميم الخاص بالعرض",
  },
  {
    "id": "8",
    "text": "التصميم الخاص بالعرض",
  },
  {
    "id": "9",
    "text": "التصميم الخاص بالعرض",
  },
];

//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

List branches = [
  {
    "id": "0",
    "branchName": "الرياض",
    "address": "25 شارع عبدالعزيز هذا النت من مولد النصوص العربية",
    "startTime": "10 صباحا",
    "endTime": "10 مسائا",
    "number": "020340543883",
  },
  {
    "id": "1",
    "branchName": "الدمام",
    "address": "25 شارع عبدالعزيز هذا النت من مولد النصوص العربية",
    "startTime": "10 صباحا",
    "endTime": "10 مسائا",
    "number": "020340543883",
  },
  {
    "id": "2",
    "branchName": "المدينة",
    "address": "25 شارع عبدالعزيز هذا النت من مولد النصوص العربية",
    "startTime": "10 صباحا",
    "endTime": "10 مسائا",
    "number": "020340543883",
  },
  {
    "id": "3",
    "branchName": "الرياض",
    "address": "25 شارع عبدالعزيز هذا النت من مولد النصوص العربية",
    "startTime": "10 صباحا",
    "endTime": "10 مسائا",
    "number": "020340543883",
  },
  {
    "id": "4",
    "branchName": "الرياض",
    "address": "25 شارع عبدالعزيز هذا النت من مولد النصوص العربية",
    "startTime": "10 صباحا",
    "endTime": "10 مسائا",
    "number": "020340543883",
  },
  {
    "id": "8",
    "branchName": "الرياض",
    "address": "25 شارع عبدالعزيز هذا النت من مولد النصوص العربية",
    "startTime": "10 صباحا",
    "endTime": "10 مسائا",
    "number": "020340543883",
  },
  {
    "id": "9",
    "branchName": "الرياض",
    "address": "25 شارع عبدالعزيز هذا النت من مولد النصوص العربية",
    "startTime": "10 صباحا",
    "endTime": "10 مسائا",
    "number": "020340543883",
  },
];

//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

List orders = [
  {
    "dateOfOrder": "25/5/2010",
    "numOfOrder": "2321",
    "userName": "محمود مرعي",
    "payingMethod": "مدي",
    "total": "00",
    "state": "1",
    'dept': 'قسم 7',
    'name': 'منتج 7',
    'price': '199',
    'image': 'images/productviiii.png',
  },
  {
    "dateOfOrder": "25/5/2010",
    "numOfOrder": "2321",
    "userName": "محمود مرعي",
    "payingMethod": "مدي",
    "total": "00",
    "state": "2",
    'dept': 'قسم 6',
    'name': 'منتج 6',
    'price': '199',
    'image': 'images/producti.png',
  },
  {
    "dateOfOrder": "25/5/2010",
    "numOfOrder": "2321",
    "userName": "محمود مرعي",
    "payingMethod": "مدي",
    "total": "00",
    "state": "3",
    'dept': 'قسم 1',
    'name': 'منتج 1',
    'price': '99',
    'image': 'images/productii.png',
  },
  {
    "dateOfOrder": "25/5/2010",
    "numOfOrder": "2321",
    "userName": "محمود مرعي",
    "payingMethod": "مدي",
    "total": "00",
    "state": "1",
    'dept': 'قسم 7',
    'name': 'منتج 7',
    'price': '199',
    'image': 'images/productviiii.png',
  },
  {
    "dateOfOrder": "25/5/2010",
    "numOfOrder": "2321",
    "userName": "محمود مرعي",
    "payingMethod": "مدي",
    "total": "00",
    "state": "2",
    'dept': 'قسم 7',
    'name': 'منتج 7',
    'price': '199',
    'image': 'images/productii.png',
  },
];

//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

List addresses = [

  {
    "addressName": "ش عبدالعزيز - الرياض",
    "country": "المملكة العربية السعودية",
  },
  {
    "addressName": "ش عبدالعزيز - الرياض",
    "country": "المملكة العربية السعودية",
  },
  {
    "addressName": "ش عبدالعزيز - الرياض",
    "country": "المملكة العربية السعودية",
  },
];