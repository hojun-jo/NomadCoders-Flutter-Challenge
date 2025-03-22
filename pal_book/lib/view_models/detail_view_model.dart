class DetailViewModel {
  String getWorkSuitabilityImagePath(String value) {
    return "assets/images/work_suitability/$value.png";
  }

  String workSuitabilityToString(String value) {
    switch (value) {
      case "kindling":
        return "불 피우기";
      case "watering":
        return "관개";
      case "planting":
        return "파종";
      case "generatingElectricity":
        return "발전";
      case "handWork":
        return "수작업";
      case "gathening":
        return "채집";
      case "lumbering":
        return "벌목";
      case "mining":
        return "채굴";
      case "medicineProduction":
        return "제약";
      case "cooling":
        return "냉각";
      case "transporting":
        return "운반";
      case "farming":
        return "목장";
      default:
        return "";
    }
  }
}
