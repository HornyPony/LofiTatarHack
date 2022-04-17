class FilterBtnModel {
  final String btnText;
  final bool isSelected;

  FilterBtnModel({required this.btnText, required this.isSelected});

  FilterBtnModel copy({
    String? btnText,
    required bool isSelected,
  }) =>
      FilterBtnModel(btnText: btnText ?? this.btnText, isSelected: isSelected
          //isSelected: isSelected ?? this.isSelected,
          );

  static List<FilterBtnModel> filterMerchBtns() {
    return [
      FilterBtnModel(
        btnText: 'Футболки',
        isSelected: false,
      ),
      FilterBtnModel(
        btnText: 'Кружки',
        isSelected: false,
        /* ),
      FilterBtnModel(
        btnText: 'Толстовки',
        isSelected: false,
      ),*/
      ),
    ];
  }
}
