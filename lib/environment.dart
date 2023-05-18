bool _isProduction = true;
Map environment = _isProduction ? prodEnvironment : devEnvironment;

final devEnvironment = {
  "BASE_URL": "http://139.59.35.127/apex-dmit/public/api",
};

final prodEnvironment = {
  "BASE_URL": "http://139.59.35.127/apex-dmit/public/api",
};
