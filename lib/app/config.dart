class Config {
  static final _instance = Config._internal();

  Config._internal();

  factory Config() => _instance;
  static const String env = String.fromEnvironment('ENV', defaultValue: "dev");
  String get apiBaseUrl {
    // print('ENV: $_env');
    switch (env){
      case "prod" : return 'https://smlp-pub.s3.ap-southeast-1.amazonaws.com/ite-store/prod/';
      case "uat": return 'https://smlp-pub.s3.ap-southeast-1.amazonaws.com/ite-store/uat/';
      case "demo": return 'https://smlp-pub.s3.ap-southeast-1.amazonaws.com/ite-store/demo/';
      default: return 'https://smlp-pub.s3.ap-southeast-1.amazonaws.com/ite-store/dev/';
    }
  }

} 