enum Products {
  fish,
  workClothes,
  sausage,
  bread,
  soap,
  cannedFood,
  sewingMachines,
  furCoats,
  glasses,
  lightBulbs,
  champagne,
  cigars,
  steamCarriages,
  schnapps,
  beer,
  pennyFarthingss,
  pocketWatches,
  jewelry,
  gramophones,

  coffee,
  chocolate,
  rum,
  friedPlantains,
  ponchos,
  tortillas,
  bowlerHats,
  cigar,

  pemmican,
  oilLamp,
  huskySled,
  sleepingBag,
  furPaka,

  goatMilk,
  finery,
  driedMeat,
  ceramics,
  seafoodStew,
  illuminatedScript,
  lanterns,
  hibiscusTea,
  tapestries,
  clayPipe,

  leatherBoots,
  tailoredSuits,

  chewingGum,
  typerwrites,
  violins,
  biscuits,
  cognac,
  billiardTables,
  toys,
  atole,
  hotSauce,
}

enum Types {
  basic,
  luxury,
  material,
}

enum Region {
  oldWorld,
  newWorld,
  trelawney,
  arctic,
  enbesa,
}

enum CalcType {
  all,
  regions,
  peopleTypes,
  islands,
}

enum CitizenTypes {
  /// old
  farmers,
  workers,
  artisans,
  engineers,
  investors,
  scholars,

  /// new -
  jornaleros,
  obreros,

  /// arctic -
  explorers,
  technicians,

  /// enbesa -
  sheperds,
  elders;

  int get value {
    switch (this) {
      case CitizenTypes.farmers:
      case CitizenTypes.jornaleros:
      case CitizenTypes.explorers:
      case CitizenTypes.sheperds:
        return 0;
      case CitizenTypes.workers:
      case CitizenTypes.obreros:
      case CitizenTypes.technicians:
      case CitizenTypes.elders:
        return 1;
      case CitizenTypes.artisans:
        return 2;
      case CitizenTypes.engineers:
        return 3;

      case CitizenTypes.investors:
        return 4;
      case CitizenTypes.scholars:
        return 5;
      default:
        return 0;
    }
  }

  int get region {
    switch (this) {
      case CitizenTypes.farmers:
      case CitizenTypes.workers:
      case CitizenTypes.artisans:
      case CitizenTypes.engineers:
      case CitizenTypes.investors:
      case CitizenTypes.scholars:
        return 1;
      case CitizenTypes.jornaleros:
      case CitizenTypes.obreros:
        return 2;
      case CitizenTypes.explorers:
      case CitizenTypes.technicians:
        return 4;
      case CitizenTypes.sheperds:
      case CitizenTypes.elders:
        return 5;
      default:
        return 0;
    }
  }

  String get name {
    switch (this) {
      case CitizenTypes.farmers:
        return 'farmers';
      case CitizenTypes.workers:
        return 'workers';
      case CitizenTypes.artisans:
        return 'artisans';
      case CitizenTypes.engineers:
        return 'engineers';
      case CitizenTypes.investors:
        return 'investors';
      case CitizenTypes.scholars:
        return 'scholars';
      case CitizenTypes.jornaleros:
        return 'jornaleros';
      case CitizenTypes.obreros:
        return 'obreros';
      case CitizenTypes.explorers:
        return 'explorers';
      case CitizenTypes.technicians:
        return 'technicians';
      case CitizenTypes.sheperds:
        return 'sheperds';
      case CitizenTypes.elders:
        return 'elders';
      default:
        return '';
    }
  }
}

enum RawMaterials {
  /// ??????
  potatoes,

  /// ??????
  clay,

  /// ?????????
  iron,

  /// ??????
  coal,

  /// ?????????
  cement,

  /// ??????
  copper,

  /// ??????
  zinc,

  /// ??????
  saltpetre,

  /// ??????
  sands,

  /// ??????
  pearls,

  /// ?????????
  goldOre,

  /// ??????
  furs,

  /// ??????
  grain,

  /// ??????
  redPeppers,

  /// ???
  hops,

  /// ??????
  grapes,

  /// ????????????
  plantains,

  /// ????????????
  sugarCane,

  /// ??????
  cotton,

  /// ??????
  caoutchouc,

  /// ?????????
  corn,

  /// ?????????
  coffeeBeans,

  /// ?????????
  tobacco,

  /// ?????????
  cocoa,

  /// ?????? ??????
  whaleOil,

  /// ????????? ??????
  caribouMeat,

  /// ?????? ??????
  sealSkin,

  /// ??? ??????
  bearFur,

  /// ?????????
  linseed,

  /// ??????????????? ???
  hibiscusPetals,

  /// ??????
  teff,

  /// ?????????
  indigoDye,

  /// ?????????
  lobster,

  /// ?????????
  spices,

  /// ????????????
  beeswax,

  /// ??????
  oil,

  /// ??????
  gas,

  /// ??????
  wood;

  bool get fromOld {
    switch (this) {
      case RawMaterials.potatoes:
      case RawMaterials.clay:
      case RawMaterials.iron:
      case RawMaterials.coal:
      case RawMaterials.cement:
      case RawMaterials.copper:
      case RawMaterials.zinc:
      case RawMaterials.furs:
      case RawMaterials.grain:
      case RawMaterials.redPeppers:
      case RawMaterials.hops:
      case RawMaterials.grapes:
      case RawMaterials.oil:
        return true;
      default:
        return false;
    }
  }

  bool get fromNew {
    switch (this) {
      case RawMaterials.plantains:
      case RawMaterials.sugarCane:
      case RawMaterials.cotton:
      case RawMaterials.caoutchouc:
      case RawMaterials.corn:
      case RawMaterials.coffeeBeans:
      case RawMaterials.tobacco:
      case RawMaterials.cocoa:
      case RawMaterials.oil:
        return true;
      default:
        return false;
    }
  }

  bool get fromArctic {
    switch (this) {
      case RawMaterials.whaleOil:
      case RawMaterials.caribouMeat:
      case RawMaterials.sealSkin:
      case RawMaterials.bearFur:
      case RawMaterials.gas:
      case RawMaterials.wood:
        return true;
      default:
        return false;
    }
  }

  bool get fromEnbesa {
    switch (this) {
      case RawMaterials.linseed:
      case RawMaterials.hibiscusPetals:
      case RawMaterials.teff:
      case RawMaterials.indigoDye:
      case RawMaterials.lobster:
      case RawMaterials.spices:
      case RawMaterials.beeswax:
        return true;
      default:
        return false;
    }
  }

  String get name {
    switch (this) {
      case RawMaterials.potatoes:
        return 'potatoes';
      case RawMaterials.clay:
        return 'clay';
      case RawMaterials.iron:
        return 'iron';
      case RawMaterials.coal:
        return 'coal';
      case RawMaterials.cement:
        return 'cement';
      case RawMaterials.copper:
        return 'copper';
      case RawMaterials.zinc:
        return 'zinc';
      case RawMaterials.saltpetre:
        return 'saltpetre';
      case RawMaterials.sands:
        return 'sands';
      case RawMaterials.pearls:
        return 'pearls';
      case RawMaterials.goldOre:
        return 'goldOre';
      case RawMaterials.furs:
        return 'furs';
      case RawMaterials.grain:
        return 'grain';
      case RawMaterials.redPeppers:
        return 'redPeppers';
      case RawMaterials.hops:
        return 'hops';
      case RawMaterials.grapes:
        return 'grapes';
      case RawMaterials.plantains:
        return 'plantains';
      case RawMaterials.sugarCane:
        return 'sugarCane';
      case RawMaterials.cotton:
        return 'cotton';
      case RawMaterials.caoutchouc:
        return 'caoutchouc';
      case RawMaterials.corn:
        return 'corn';
      case RawMaterials.coffeeBeans:
        return 'coffeeBeans';
      case RawMaterials.tobacco:
        return 'tobacco';
      case RawMaterials.cocoa:
        return 'cocoa';
      case RawMaterials.whaleOil:
        return 'whaleOil';
      case RawMaterials.caribouMeat:
        return 'caribouMeat';
      case RawMaterials.sealSkin:
        return 'sealSkin';
      case RawMaterials.bearFur:
        return 'bearFur';
      case RawMaterials.linseed:
        return 'linseed';
      case RawMaterials.hibiscusPetals:
        return 'hibiscusPetals';
      case RawMaterials.teff:
        return 'teff';
      case RawMaterials.indigoDye:
        return 'indigoDye';
      case RawMaterials.lobster:
        return 'lobster';
      case RawMaterials.spices:
        return 'spices';
      case RawMaterials.beeswax:
        return 'beeswax';
      case RawMaterials.oil:
        return 'oil';
      case RawMaterials.gas:
        return 'gas';
      case RawMaterials.wood:
        return 'wood';
      default:
        return '';
    }
  }
}

enum IntermediateGoods {
  /// ?????????
  beef,

  /// ??????
  pigs,

  /// ??????
  cinnamon,

  /// ????????? ??????
  coconutOil,

  /// ????????????
  citrus,

  /// ??????
  camphorWax,

  /// ?????????
  cherryWood,

  /// ??????
  resin,

  /// ??????
  fishOil,

  /// ?????????
  gooseFeathers,

  /// ?????????
  huskies,

  /// ?????????
  sangaCow,

  /// ??????
  salt,

  /// ??????
  dung,

  /// ??????
  fertiliser,

  /// ???
  wool,

  /// ??????
  timber,

  /// ??????
  bricks,

  /// ???
  sails,

  /// ??????
  steelBeams,

  /// ??????
  weapons,

  /// ??????
  windows,

  /// ????????????
  reinforcedConcrete,

  /// ????????????
  steamMotors,

  /// ???????????????
  advancedWeapons,

  /// ??????
  scrap,

  /// ?????? ??????
  niceScrap,

  /// ????????? ??????
  specialScrap,

  /// ?????? ??????
  lostExpeditionScrap,

  /// ?????? ??????
  wanzaTimber,

  /// ?????? ??????
  mudBricks,

  /// ???????????????
  elevators,

  /// ?????????
  flour,

  /// ???
  steel,

  /// ??????
  tallow,

  /// ??????
  malt,

  /// ??????
  glass,

  /// ?????????
  goulash,

  /// ??????
  brass,

  /// ???
  gold,

  /// ????????????
  filaments,

  /// ??????????????????
  dynamite,

  /// ????????????
  woodVeneers,

  /// ??????
  chassis,

  /// ???
  cottonFabric,

  /// ??????
  felt,

  /// ??????
  sugar,

  /// ?????????
  ethanol,

  /// ???????????????
  celluloid,

  /// ??????
  lacquer,

  /// ??????
  sleds,

  /// ??????
  linen,

  /// ?????????
  spicedFlour,

  /// ??????
  paper,

  /// ???
  ornateCandles,

  /// ??????
  wood;

  bool get fromOld {
    switch (this) {
      case IntermediateGoods.pigs:
      case IntermediateGoods.wool:
      case IntermediateGoods.weapons:
      case IntermediateGoods.windows:
      case IntermediateGoods.flour:
      case IntermediateGoods.steel:
      case IntermediateGoods.glass:
      case IntermediateGoods.brass:
      case IntermediateGoods.elevators:
      case IntermediateGoods.goulash:
      case IntermediateGoods.steamMotors:
      case IntermediateGoods.malt:
      case IntermediateGoods.gold:
      case IntermediateGoods.dynamite:
      case IntermediateGoods.sails:
      case IntermediateGoods.steelBeams:
      case IntermediateGoods.reinforcedConcrete:
      case IntermediateGoods.advancedWeapons:
      case IntermediateGoods.bricks:
      case IntermediateGoods.timber:
      case IntermediateGoods.wood:
      case IntermediateGoods.tallow:
      case IntermediateGoods.chassis:
        return true;
      default:
        return false;
    }
  }

  bool get fromNew {
    switch (this) {
      case IntermediateGoods.timber:
      case IntermediateGoods.bricks:
      case IntermediateGoods.cinnamon:
      case IntermediateGoods.coconutOil:
      case IntermediateGoods.cottonFabric:
      case IntermediateGoods.wool:
      case IntermediateGoods.felt:
      case IntermediateGoods.sugar:
      case IntermediateGoods.beef:
      case IntermediateGoods.resin:
      case IntermediateGoods.woodVeneers:
      case IntermediateGoods.camphorWax:
      case IntermediateGoods.citrus:
      case IntermediateGoods.fishOil:
      case IntermediateGoods.wood:
        return true;
      default:
        return false;
    }
  }

  bool get fromArctic {
    switch (this) {
      case IntermediateGoods.fishOil:
      case IntermediateGoods.huskies:
      case IntermediateGoods.sleds:
      case IntermediateGoods.gooseFeathers:
      case IntermediateGoods.lostExpeditionScrap:
      case IntermediateGoods.wood:
        return true;
      default:
        return false;
    }
  }

  bool get fromEnbesa {
    switch (this) {
      case IntermediateGoods.wanzaTimber:
      case IntermediateGoods.salt:
      case IntermediateGoods.sangaCow:
      case IntermediateGoods.linen:
      case IntermediateGoods.spicedFlour:
        return true;
      default:
        return false;
    }
  }

  bool get fromTrelawney {
    switch (this) {
      case IntermediateGoods.scrap:
      case IntermediateGoods.niceScrap:
      case IntermediateGoods.specialScrap:
        return true;
      default:
        return fromOld;
    }
  }

  String get name {
    switch (this) {
      case IntermediateGoods.beef:
        return 'beef';
      case IntermediateGoods.pigs:
        return 'pigs';
      case IntermediateGoods.cinnamon:
        return 'cinnamon';
      case IntermediateGoods.coconutOil:
        return 'coconutOil';
      case IntermediateGoods.citrus:
        return 'citrus';
      case IntermediateGoods.camphorWax:
        return 'camphorWax';
      case IntermediateGoods.cherryWood:
        return 'cherryWood';
      case IntermediateGoods.resin:
        return 'resin';
      case IntermediateGoods.fishOil:
        return 'fishOil';
      case IntermediateGoods.gooseFeathers:
        return 'gooseFeathers';
      case IntermediateGoods.huskies:
        return 'huskies';
      case IntermediateGoods.sangaCow:
        return 'sangaCow';
      case IntermediateGoods.salt:
        return 'salt';
      case IntermediateGoods.dung:
        return 'dung';
      case IntermediateGoods.fertiliser:
        return 'fertiliser';
      case IntermediateGoods.wool:
        return 'wool';
      case IntermediateGoods.timber:
        return 'timber';
      case IntermediateGoods.bricks:
        return 'bricks';
      case IntermediateGoods.sails:
        return 'sails';
      case IntermediateGoods.steelBeams:
        return 'steelBeams';
      case IntermediateGoods.weapons:
        return 'weapons';
      case IntermediateGoods.windows:
        return 'windows';
      case IntermediateGoods.reinforcedConcrete:
        return 'reinforcedConcrete';
      case IntermediateGoods.steamMotors:
        return 'steamMotors';
      case IntermediateGoods.advancedWeapons:
        return 'advancedWeapons';
      case IntermediateGoods.scrap:
        return 'scrap';
      case IntermediateGoods.niceScrap:
        return 'niceScrap';
      case IntermediateGoods.specialScrap:
        return 'specialScrap';
      case IntermediateGoods.lostExpeditionScrap:
        return 'lostExpeditionScrap';
      case IntermediateGoods.wanzaTimber:
        return 'wanzaTimber';
      case IntermediateGoods.mudBricks:
        return 'mudBricks';
      case IntermediateGoods.elevators:
        return 'elevators';
      case IntermediateGoods.flour:
        return 'flour';
      case IntermediateGoods.steel:
        return 'steel';
      case IntermediateGoods.tallow:
        return 'tallow';
      case IntermediateGoods.malt:
        return 'malt';
      case IntermediateGoods.glass:
        return 'glass';
      case IntermediateGoods.goulash:
        return 'goulash';
      case IntermediateGoods.brass:
        return 'brass';
      case IntermediateGoods.gold:
        return 'gold';
      case IntermediateGoods.filaments:
        return 'filaments';
      case IntermediateGoods.dynamite:
        return 'dynamite';
      case IntermediateGoods.woodVeneers:
        return 'woodVeneers';
      case IntermediateGoods.chassis:
        return 'chassis';
      case IntermediateGoods.cottonFabric:
        return 'cottonFabric';
      case IntermediateGoods.felt:
        return 'felt';
      case IntermediateGoods.sugar:
        return 'sugar';
      case IntermediateGoods.ethanol:
        return 'ethanol';
      case IntermediateGoods.celluloid:
        return 'celluloid';
      case IntermediateGoods.lacquer:
        return 'lacquer';
      case IntermediateGoods.sleds:
        return 'sleds';
      case IntermediateGoods.linen:
        return 'linen';
      case IntermediateGoods.spicedFlour:
        return 'spicedFlour';
      case IntermediateGoods.paper:
        return 'paper';
      case IntermediateGoods.ornateCandles:
        return 'ornateCandles';
      default:
        return '';
    }
  }
}
