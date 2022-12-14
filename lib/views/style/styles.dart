import 'package:flutter/material.dart';

class Styles {
  static const Map<String, String> _products = {
    'bank': 'bank.png',
    'bar': 'bar.png',
    'bazaar': 'bazaar.png',
    'steelBeams': 'beams.png',
    'bearFur': 'bear_fur.png',
    'beer': 'beer.webp',
    'beeswax': 'beeswax.png',
    'berliner': 'berliner.png',
    'black_muscovy': 'black_muscovy.png',
    'bowlerHats': 'bowler-hats..webp',
    'boxing-arena': 'boxing-arena.webp',
    'brass': 'brass.png',
    'bread': 'bread.webp',
    'bricks': 'bricks.png',
    'briocheRoyale': 'brioche_royale.png',
    'bus_stop': 'bus_stop.png',
    'caffee': 'caffee.png',
    'ornateCandles': 'candles.png',
    'sugarCane': 'cane_sugar_1.png',
    'cannedFood': 'canned-food.webp',
    'canteen': 'canteen.png',
    'caoutchouc': 'caoutchouc.png',
    'ceramics': 'ceramics.png',
    'champagne': 'champagne.png',
    'chassis': 'chassis.png',
    'chocolate': 'chocolate.webp',
    'church': 'church.webp',
    'cigar': 'cigars.webp',
    'cinamon': 'cinamon.png',
    'citrus': 'citrus.png',
    'clay': 'clay.png',
    'tailoredSuits': 'clothes.webp',
    'club_house': 'club_house.png',
    'coal': 'coal.png',
    'cocoa': 'cocoa.png',
    'coconut': 'coconut.png',
    'coffeeBeans': 'coffee_beans.png',
    'coffee': 'coffee.webp',
    'community_lodge': 'community_lodge.png',
    'copper': 'copper.png',
    'corn': 'corn.png',
    'cottonFabric': 'cotton_fur.png',
    'cotton': 'cotton.png',
    'daiquiri_tropic': 'daiquiri_tropic.png',
    'driedMeat': 'dried_meat.png',
    'dynamite': 'dynamite.png',
    'eclair': 'eclair.png',
    'electric_works_oil': 'electric_works_oil.png',
    'fish': 'fish.webp',
    'fishoil': 'fishoil.png',
    'flour': 'flour.png',
    'friedPlantains': 'fried-plantains.webp',
    'furPaka': 'fur_parka.png',
    'furCoats': 'fur-coats.webp',
    'furs': 'fur.png',
    'gas': 'gas_red.png',
    'gasoline': 'gasoline.png',
    'glasses': 'glasses.webp',
    'goatMilk': 'goat_milk.png',
    'goldOre': 'gold_ore.png',
    'gold': 'gold.png',
    'gooseFeathers': 'goose_feathers.png',
    'goulash': 'goulash.png',
    'grain': 'grain.png',
    'gramophones': 'gramophone.webp',
    'grapes': 'grapes.png',
    'heating_center': 'heating_center.png',
    'hibiscus_farm': 'hibiscus_farm.png',
    'hibiscusTea': 'hibiscus_tea.png',
    'pennyFarthingss': 'high-wheeler.webp',
    'hops': 'hops.png',
    'husky': 'husky.png',
    'indigo': 'indigo.png',
    'woodVeneers': 'inlay.png',
    'iron': 'iron.png',
    'jam': 'jam.png',
    'jewelry': 'jewelry.webp',
    'lanterns': 'lanterns.png',
    'leatherBoots': 'leather_shoes.png',
    'lemonade': 'lemonade.png',
    'lightBulbs': 'light-bulb.webp',
    'linen': 'linen_fabric.png',
    'linseed': 'linen_farm.png',
    'malt': 'malt.png',
    'marketplace': 'marketplace.webp',
    'marmelade_review': 'marmelade_review.png',
    'meat': 'meat_raw.png',
    'members-club': 'members-club.webp',
    'monastery': 'monastery.png',
    'mudBricks': 'mud_bricks.png',
    'music_plaza': 'music_plaza.png',
    'niter': 'niter.png',
    'oilLamp': 'oil_lamps.png',
    'oil-power-plant': 'oil-power-plant.webp',
    'oil': 'oil.png',
    'paper': 'paper.png',
    'pearls': 'pearls.png',
    'pemmican': 'pemmican.png',
    'pigs': 'pigs.png',
    'plantainSurprise': 'plantain_surprise.png',
    'plantains': 'plantains.png',
    'pocketWatches': 'pocket-watch.webp',
    'ponchos': 'poncho.png',
    'post_office': 'post_office.png',
    'potatoes': 'potatoes.png',
    'pub': 'pub.png',
    'sands': 'quartz_sand.png',
    'ragout': 'ragout.png',
    'ranger_station': 'ranger_station.png',
    'redPeppers': 'red_pepper.png',
    'caribouMeat': 'reindeer_meat.png',
    'reinforcedConcrete': 'reinforced_concrete.png',
    'rope': 'rope.png',
    'rum': 'rum.webp',
    'sails': 'sail.png',
    'salt': 'salt_africa.png',
    'sausage': 'sausages.webp',
    'schnapps': 'schnapps.webp',
    'schnitzel': 'schnitzel.png',
    'school': 'school.png',
    'illuminatedScript': 'scriptures.png',
    'lobster': 'seafood.png',
    'sealSkin': 'seal_skin.png',
    'sewingMachines': 'sewing-machines.webp',
    'shampoo': 'shampoo.png',
    'sleds': 'sled_frame.png',
    'huskySled': 'sled.png',
    'sleepingBag': 'sleeping_bags.png',
    'soap': 'soap.webp',
    'souvenir': 'souvenir.png',
    'spices': 'spices.png',
    'steamCarriages': 'steam_carriage.png',
    'steamMotors': 'steam_machine.png',
    'steel': 'steel.png',
    'sugar': 'sugar.png',
    'tallow': 'tallow.png',
    'tapestries': 'tapestries.png',
    'tartare': 'tartare.png',
    'spicedFlour': 'teff_flour.png',
    'teff': 'teff_grass.png',
    'telephone': 'telephone.webp',
    'tin_ore': 'tin_ore.png',
    'clayPipe': 'tobacco_pipes.png',
    'tobacco': 'tobacco.png',
    'tortillas': 'tortillia.png',
    'finery': 'traditional_clothing.png',
    'trifle_tower': 'trifle_tower.png',
    'university': 'university.png',
    'variety-theatre': 'variety-theatre..webp',
    'wanzaTimber': 'wansa_wood.png',
    'seafoodStew': 'wat_stew.png',
    'sangaCow': 'watusi.png',
    'weapons': 'weapons.png',
    'whaleOil': 'whale_oil.png',
    'windows': 'windows.png',
    'wood': 'wood_log.png',
    'timber': 'wooden_planks.png',
    'wool': 'wool.png',
    'workClothes': 'work-clothes.webp',
    'glass': 'Glass.webp',
    'advancedWeapons': 'Advanced_weapons.webp',
    'zinc': 'Zinc.webp',
    'elevators': 'Elevators.webp',
    'cement': 'Cement.webp',
  };

  static String getProductImg(String key) => 'assets/image/${_products[key] ?? ''}';

  static const Map<String, String> _profile = {
    'artisans': 'Artisans.png',
    'engineers': 'Engineers.png',
    'explorers': 'Explorers.png',
    'farmers': 'Farmers.png',
    'elders': 'Icon_resident_elder_0.png',
    'scholars': 'Icon_resident_scholars_0.png',
    'sheperds': 'Icon_resident_sheperd_0.png',
    'investors': 'Investors.png',
    'jornaleros': 'Jornaleros.png',
    'obreros': 'Obreros.png',
    'technicians': 'Technicians.png',
    'workers': 'Workers.png',
  };

  static String getProfileImg(String key) => 'assets/image/${_profile[key] ?? ''}';
}
