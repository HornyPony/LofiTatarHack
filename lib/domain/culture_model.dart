class CultureModel {
  final String realImage;
  final String animationImage;
  final String name;
  final String description;
  final String longDescription;

  CultureModel(
      {required this.realImage,
      required this.animationImage,
      required this.name,
      required this.description,
      required this.longDescription});

  static List<CultureModel> getAllCulture() {
    return [
      CultureModel(
          realImage: 'assets/images/triangle.jpg',
          animationImage: 'assets/images/treugolnik.png',
          name: 'Эчпочмак',
          description:
              'Татарское и башкирское национальное блюдо, печёное изделие из пресного, реже дрожжевого теста, с начинкой из картофеля, мяса (как правило, говядины, баранины, гуся или утки) и лука.',
          longDescription:
              'Наряду с «чак-чаком» треугольник — одна из визитных карточек республики и наиболее распространённая «кулинарная» ассоциация с Татарстаном среди жителей России. '
              'История эчпочмака уходит своими корнями в глубь веков, когда кочевые народы тюркских племен передвигались с одной территории на другую на лошадях. '
              'Лошади нередко становились едой кочевников. Из конины готовились различные блюда, её добавляли и в эчпочмаки, но чаще для их приготовления использовали баранину.С изобретением рецепта эчпочмака жизнь кочевников значительно упростилась. Пропала необходимость делать длительные остановки для приготовления пищи, потому что традиционно эчпочмак готовился с небольшим отверстием посередине, в которое заливали горячий бульон, и получалось полноценное горячее блюдо. Со временем рецепт приготовления несколько изменился. Сегодня все реже можно встретить треугольник с отверстием посередине, но в соответствии с традицией эчпочмак всё ещё подается вместе с бульоном.'),
      CultureModel(
          realImage: 'assets/images/kystyburger.png',
          animationImage: 'assets/images/kystyby.png',
          name: 'Кыстыбургер',
          description:
              'Соединение многовековой культуры татарского народа с современными тенденциями',
          longDescription:
              'Идея, придуманная и воплощенная компанией "Тюбетей", нацеленной так же как и мы на популяризацию татарской культуры.'
              'Задача данной компании - возродить и популяризировать татарскую культуру, ценности и добрые традиции. Одним из таким возродителей выступает Кыстыбургер: соединение традиционного татарского блюда с современными бургерами'),
      CultureModel(
          realImage: 'assets/images/gubadiy.jpeg',
          animationImage: 'assets/images/gubadya.png',
          name: 'Губадия',
          description:
              'Блюдо татарской, а также чувашской и башкирской национальной кухни, закрытый круглый многослойный пирог. Традиционный вариант сладкий и подается к чаю, однако, существуют вариации рецепта, включающие мясо',
          longDescription:
              'Блюдо распространено в кухне татар и в кухне чувашей, башкир, проживающих преимущественно в западных и северных районах Башкортостана, то есть в местах их компактного проживания с татарами. Губадия готовится по праздникам, обязательна на свадебном столе, при торжестве в честь имянаречения, при встрече дорогих гостей. По обрядовому значению близок к русской кулебяке.У казанских татар традиционно подается к чаю или как второе блюдо на праздничный стол. У пермских татар по свадебному ритуалу губадией угощают кумовьёв, приглашая их погостить столько дней, сколько слоев начинки в пироге. Для традиционной кухни татар Казахстана характерно подавать губадию вместо второго блюда или с бульоном.'),
      CultureModel(
          realImage: 'assets/images/ornament.jpg',
          animationImage: 'assets/images/uzorchiki.png',
          name: 'Татарские орнаменты',
          description:
              'Татарский орнамент складывался тысячелетиями, начиная с эпохи древнетюркских каганатов и даже раньше – с первобытной эпохи. Он прошел очень долгий путь развития. В нем всегда отражались природа и символически значимые для человека предметы, образы.',
          longDescription:
              'Если взять древний орнамент, то мы сможем увидеть в нём окружающий мир, природные явления, характерные для далеких предков татар, проживавших на Алтае, в Центральной и Южной Азии. Так, к узорам, имеющим древнее происхождение надо отнести мотив лотоса, розетки, сердцеобразный, пальметты (стилизованное изображение листьев пальмы). В эпоху Золотой Орды в орнаменте отражается влияние монгольского и китайского искусств, например, появляются облаковидные мотивы, мотив плетенки, в новой трактовке можно увидеть изображение лотоса. Чаще встречаются мотивы, отображающие чужеземных животных – льва, павлина, косули и др., популярными становятся фантастические мотивы – драконы, сфинксы, двуглавые птицы.'
              'Орнамент украшает предметы интерьера: шамаили, ляухэ, настенные тарелки, декоративную керамику; обрядовые и бытовые предметы – намазлыки, полотенца, скатерти, подносы, шкатулки и др.; элементы костюма (платья, жилетки, головные уборы, обувь).'),
      CultureModel(
          realImage: 'assets/images/milk_tea.jpeg',
          animationImage: 'assets/images/chay.png',
          name: 'Чай с молоком',
          description:
              'Культурное явление, вызывающее интерес у других национальностей',
          longDescription:
              'Чаепития - неотъемлемая часть жизни татарского народа. "Чэйгэ чакыру" - "Пригласить на чай". Это словосочетание в обиходе казанских татар встречается с середины 18 века. Многие купеческие дома в Казани специально торговали только чаем. К 19 века чаепитие закрепилось в татарском быту, и уже ни один праздник не обходился без чашечки чая. У татар, принято пить чай с молоком, чтобы он был питательным. И еще как предположение, гостеприимные татары,  к чаю всегда подают выпечку и сладости. А как мы знаем на своём опыте, нужно ждать пока остынет чай, учтивые хозяева, добавляют молоко в чай, чтобы гостям было комфортно запивать большое количество еды и сладостей.'),
      CultureModel(
          realImage: 'assets/images/chak_chak.jpeg',
          animationImage: 'assets/images/chak_char.png',
          name: 'Чак-чак',
          description:
              'Мучное восточное печенье из обжаренных во фритюре кусочков теста, перемешанных с медовым сиропом. Национальное кулинарное изделие башкир и татар',
          longDescription:
              'Cамый большой в мире чак-чак был приготовлен в Казани к открытию чемпионата мира по футболу FIFA 2018 года в форме половины футбольного мяча. Диаметр полусферы мяча составил 2,6 м, высота — 2 метра, а вся композиция заняла площадку размером 3,5 м на 4,8 м. Зарегистрированный вес составил 4026 килограммов')
      /*CultureModel(
          realImage: 'assets/images/sabantui.jpg',
          name: 'Мул Шариф',
          description:
              'Ежегодный народный праздник окончания весенних полевых работ у татар и башкир',
          longDescription:
              'Сабантуй переводится с тюркских языков как «свадьба (торжество) плуга» — «сабан» (историческая разновидность плуга) и туй — «праздник, свадьба». Также среди татар было распространено название Сабан бәйрәме (бәйрәм также означает «праздник»). Истоки празднования сабантуя уходят в глубокую древность и связаны с аграрным культом. Первоначальная цель этого обряда, вероятно, заключалась в задабривании духов плодородия с тем, чтобы благоприятствовать хорошему урожаю в новом году'
              'До конца XIX века сабантуй праздновали в весенне-летний период до начала пахоты после каргатуя. Празднование сабантуя в общих чертах было одинаковым, но имел ряд особенностей у различных этнографических групп башкир, татар и чувашей. К примеру, если у западных и юго-западных башкир сабантуй устраивали на следующий день после праздника каргатуя, то у восточных проводился после.'),*/
    ];
  }
}
