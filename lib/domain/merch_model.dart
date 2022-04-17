class Merch {
  final String type;
  final String image;
  final String description;
  final String structure;
  final String name;
  final int price;

  Merch(
      {required this.type,
      required this.image,
      required this.description,
      required this.structure,
      required this.name,
      required this.price});

  static List<Merch> getAllTshirts() {
    return [
      Merch(
        type: 'Футболка',
        image: 'assets/images/shirt.png',
        name: 'Футболка',
        description:
            'Привнесите татарский язык в мир с нашей "Алтын кыз". Сделано из 100% хлопка с любовью к татарской культуре. Отличное приобретение для современной молодежи',
        structure: '-Унисекс\n-100% хлопок\n-Высокое качество',
        price: 790,
      ),
      Merch(
        type: 'Футболка',
        image: 'assets/images/shirt.png',
        name: 'Футболка',
        price: 790,
        description:
            'Привнесите татарский язык в мир с нашей "Алтын кыз". Сделано из 100% хлопка с любовью к татарской культуре. Отличное приобретение для современной молодежи',
        structure: '-Унисекс\n-100% хлопок\n-Высокое качество',
      ),
      Merch(
        type: 'Футболка',
        image: 'assets/images/shirt.png',
        name: 'Футболка',
        price: 790,
        description:
            'Привнесите татарский язык в мир с нашей "Алтын кыз". Сделано из 100% хлопка с любовью к татарской культуре. Отличное приобретение для современной молодежи',
        structure: '-Унисекс\n-100% хлопок\n-Высокое качество',
      ),
    ];
  }

  static List<Merch> getAllCups() {
    return [
      Merch(
        type: 'Кружка',
        image: 'assets/images/cup.png',
        name: 'Кружка',
        price: 490,
        description:
            'Привнесите в свой дом кусочек татарского счастья с нашей "Алтын кыз". Чай с молоком только из этой кружки! Отличное приобретение для современной молодежи',
        structure: 'Сделано из фарфора',
      ),
      Merch(
        type: 'Кружка',
        image: 'assets/images/cup.png',
        name: 'Кружка',
        price: 490,
        description:
            'Привнесите в свой дом кусочек татарского счастья с нашей "Алтын кыз". Чай с молоком только из этой кружки! Отличное приобретение для современной молодежи',
        structure: 'Сделано из фарфора',
      ),
      Merch(
        type: 'Кружка',
        image: 'assets/images/cup.png',
        name: 'Кружка',
        price: 490,
        description:
            'Привнесите в свой дом кусочек татарского счастья с нашей "Алтын кыз". Чай с молоком только из этой кружки! Отличное приобретение для современной молодежи',
        structure: 'Сделано из фарфора',
      ),
    ];
  }

  static List<Merch> getAllHoodies() {
    return [
      Merch(
        type: 'Толстовка',
        image: 'assets/images/kul_sharif.png',
        name: 'Толстовка',
        price: 1690,
        description:
            '"Алтын кыз" и ее любовь к татарской культуре согреет не только вас, но и ваших близких. Сделано из 100% хлопка с любовью к татарской культуре. Отличное приобретение для современной молодежи',
        structure: '-Унисекс\n-100% хлопок\n-Высокое качество',
      ),
      Merch(
        type: 'Толстовка',
        image: 'assets/images/kul_sharif.png',
        name: 'Толстовка',
        price: 1690,
        description:
            '"Алтын кыз" и ее любовь к татарской культуре согреет не только вас, но и ваших близких. Сделано из 100% хлопка с любовью к татарской культуре. Отличное приобретение для современной молодежи',
        structure: '-Унисекс\n-100% хлопок\n-Высокое качество',
      ),
      Merch(
        type: 'Толстовка',
        image: 'assets/images/kul_sharif.png',
        name: 'Толстовка',
        price: 1690,
        description:
            '"Алтын кыз" и ее любовь к татарской культуре согреет не только вас, но и ваших близких. Сделано из 100% хлопка с любовью к татарской культуре. Отличное приобретение для современной молодежи',
        structure: '-Унисекс\n-100% хлопок\n-Высокое качество',
      ),
    ];
  }
}
