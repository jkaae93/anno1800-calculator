class Citizen {
  String name = '';
  String img = '';
  int count = 0;

  Citizen({
    this.name = '',
    this.img = '',
    this.count = 0,
  });

  get getName => this.name;
  set setName(name) => this.name = name;

  get getImg => this.img;
  set setImg(img) => this.img = img;

  get getCount => this.count;
  set setCount(count) => this.count = count;
}
