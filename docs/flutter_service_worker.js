'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "d1140a05b92aaa7647f4c82f15a5281d",
"index.html": "3e2119305e050a0984e791913a08e6f0",
"/": "3e2119305e050a0984e791913a08e6f0",
"main.dart.js": "d8542e6858f312b109f1b3194ec17e83",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "5421152c8e7068d13a079925566e9436",
"assets/AssetManifest.json": "b6621365170834709fcede14fbea2170",
"assets/NOTICES": "d9a838cca7bf89c7071ee70a7a500e5e",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/shaders/ink_sparkle.frag": "0efb440a2a54370a60603964e9645c4e",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/assets/image/oil.png": "b91bef8f057c2f52a38d5e17fa2a53e4",
"assets/assets/image/berliner.png": "8d8984d37f89c95acdfebaf761127da9",
"assets/assets/image/pigs.png": "2e78a26f165ef29b8f98488676f4895b",
"assets/assets/image/sled.png": "82b7352339673c18a3e551398ce72c76",
"assets/assets/image/candles.png": "e516965de7f530ed5cf9d2e76f84d6b0",
"assets/assets/image/beeswax.png": "d5e11c3e50de65a7b5584c3b2a4ae3dc",
"assets/assets/image/lanterns.png": "13af29befb4b87bf535fc285b8420924",
"assets/assets/image/wat_stew.png": "c9f369933f7e3aa4c245a81b8d3835ca",
"assets/assets/image/Technicians.png": "a3f3e2a899269dd7479fa150ac22cf2e",
"assets/assets/image/leather_shoes.png": "883dacd2a4ebd21090064ce0aea8763e",
"assets/assets/image/Artisans.png": "ebbd3fb5078b60f10efc8ad5c7f627e2",
"assets/assets/image/ranger_station.png": "08c7fb0dab35125371d20105c2c3e856",
"assets/assets/image/work-clothes.webp": "6f77664aa5b78e8c76b3e1f1d8207f9a",
"assets/assets/image/paper.png": "129196ccaa357d7333c4da8452ddd2a3",
"assets/assets/image/weapons.png": "594e1bfb8d0dffd45ac4602db317fb4e",
"assets/assets/image/community_lodge.png": "46871c4b023b94c6d5b2ca71f811b7d4",
"assets/assets/image/linen_farm.png": "c478ad68bba576a86dcc0d42f30c814f",
"assets/assets/image/wood_log.png": "21fa54bb5a331cafd0639d9b9b5a0527",
"assets/assets/image/brioche_royale.png": "3d681ee62830eb16befa6dc46498f4d7",
"assets/assets/image/black_muscovy.png": "aa1c46900d06e07db7bb8c237d1fd628",
"assets/assets/image/bear_fur.png": "0a7835db752f1d0d1d1a778936230d7e",
"assets/assets/image/alpaca_wool.png": "54b86402608590850f38841f7527a33f",
"assets/assets/image/variety-theatre..webp": "1fa694170002188863346a1d0c1fc806",
"assets/assets/image/bazaar.png": "119cc2d533c5d7b61070f26659226cd1",
"assets/assets/image/jewelry.webp": "7b34a451c21ccedecff124294ce68c1b",
"assets/assets/image/clay.png": "2709006e6972696dbc3e11de30965ec0",
"assets/assets/image/bread.webp": "2cb6a5043bdca685e11209339f5abfde",
"assets/assets/image/beer.webp": "5a68108162b6677c68dd6ac2ffa9fa10",
"assets/assets/image/watusi.png": "4a37875f26ec7213eb3ae4c66840f86c",
"assets/assets/image/cigars.webp": "39cdcc782a79c14d2e2065a878e90430",
"assets/assets/image/school.png": "601c947d87a7139ca964e6651b9773b0",
"assets/assets/image/niter.png": "04d3d07480bdb128278d26d7f90bed91",
"assets/assets/image/dried_meat.png": "fe34d5006089251f3cca9e7e98617ac1",
"assets/assets/image/monastery.png": "5737a5794adec4500d7b73641388373d",
"assets/assets/image/goulash.png": "542f3ec0a0839a6efd9d111644eacbfd",
"assets/assets/image/canteen.png": "99f7a01bccde82209c32cd7458748f7e",
"assets/assets/image/cocoa.png": "744f3ff726f8bf155d4defddebed7dd4",
"assets/assets/image/bricks.png": "457ad612a4ca62545a7a34d9c0494012",
"assets/assets/image/quartz_sand.png": "a0885b7a33cc34349a58af0d070dd993",
"assets/assets/image/school.webp": "d964d8821cd14491d962ff8dd0a3d35f",
"assets/assets/image/sugar.png": "f5c6e1d4f3d6716a98931b6cacbf43a0",
"assets/assets/image/corn.png": "091eb980b32ee739990430ee8abad65c",
"assets/assets/image/glasses.webp": "21a5e588bc2d578d7d7d66229a3f0196",
"assets/assets/image/Icon_resident_sheperd_0.png": "bcb1352d8222b19b6979b508c7a1bc10",
"assets/assets/image/gas_red.png": "857decd5961af2e2d13ab90dbc166f55",
"assets/assets/image/Engineers.png": "1668e21a7f75f92785c367e480df4b9a",
"assets/assets/image/ceramics.png": "478a5d155c053c951443842a909f6b37",
"assets/assets/image/salt.png": "08f49acd2135dcb270c167e600699eba",
"assets/assets/image/gasoline.png": "2a6cb2599449f84111b01b0c8b75b607",
"assets/assets/image/wansa_wood.png": "3c5785a7b409a9cbb94f50a93ad3b223",
"assets/assets/image/caoutchouc.png": "9b4fed006c40d42c7726b54c6ef2815a",
"assets/assets/image/chocolate.webp": "7a3d79ee99e8328e094722e8effdf965",
"assets/assets/image/hibiscus_tea.png": "566466f5e62fc13162229f588f6af3d8",
"assets/assets/image/coffee_beans.png": "871acffd0b4994ad8ffa1abe48a9d131",
"assets/assets/image/fur-coats.webp": "a5cefb8890c2db915320524b228e9d1b",
"assets/assets/image/steam_machine.png": "0caa79969eff900f6e982933b7c22427",
"assets/assets/image/traditional_clothing.png": "de4a987c65f406ebe4e558f06c344076",
"assets/assets/image/soap.webp": "9fcaced0cedf4f0b63a9614680dd7a9a",
"assets/assets/image/fried-plantains.webp": "c45b088069d72e338b9165376f2dda0d",
"assets/assets/image/cotton.png": "f15d977ac00d6f44c8739d4174c46448",
"assets/assets/image/Obreros.png": "ba3eecef575c6ad0be409effa29573a9",
"assets/assets/image/coconut.png": "c269811232f10d7552a06d2fef204f5a",
"assets/assets/image/members-club.webp": "198ef97f79313a404824ced4c4294b10",
"assets/assets/image/meat_raw.png": "28dce9732c28d67adedfd982dc8769a0",
"assets/assets/image/clothes.webp": "a4990977418bca5d26f52031387ccbdf",
"assets/assets/image/flour.png": "cc9d5fc0acfcc66c087f503bf0fa9104",
"assets/assets/image/mud_bricks.png": "b88b02cf98bce5a89e8b1e96b7243bae",
"assets/assets/image/music_plaza.png": "ece7f89a6fdfd91211e5dc9508d11744",
"assets/assets/image/pemmican.png": "371eab8f87c841cdb85f10d837aace61",
"assets/assets/image/Farmers.png": "0c88c57cb607bde4f2f5292529a46251",
"assets/assets/image/high-wheeler.webp": "ebbc4e74a1835b7e66526573c7270b1e",
"assets/assets/image/spices.png": "90a77576406b3ba15e5bd2cd2f4dca89",
"assets/assets/image/pub.png": "69ed5596bec22a7f1ca2af4eea6dd02a",
"assets/assets/image/malt.png": "66b289a27e9bdf38f02e4225aa494e61",
"assets/assets/image/fur_parka.png": "4979fefcdebbefa6367d62e2ef45290d",
"assets/assets/image/boxing-arena.webp": "3a12d38a2ea7a04acdaeae4ddeac48a2",
"assets/assets/image/Workers.png": "bde9bf421d9832dd90673431b1769ecc",
"assets/assets/image/tobacco.png": "053238fd7b85c2f636eb927fe6f3a243",
"assets/assets/image/tapestries.png": "4e054e08fac830c5e32c3cfc0c459953",
"assets/assets/image/church.webp": "305edff4ebf3b8f13c08dff1633af22f",
"assets/assets/image/club_house.png": "b79461014b34c1008af183bedc099c83",
"assets/assets/image/teff_flour.png": "4fefad35ec5d3fd1945675738035a7dd",
"assets/assets/image/coal.png": "d6c73162dd03332d52965a2fa0444d13",
"assets/assets/image/tin_ore.png": "7435c4a90c6dde2e6eb27ea4280a08f4",
"assets/assets/image/brass.png": "b41dd65e7121e41360b39c8ea3812cfd",
"assets/assets/image/telephone.webp": "c482c3666233ff704595951ec83c2bf7",
"assets/assets/image/sail.png": "2b0d5f90eceacebab7fd05ce0f6cc43f",
"assets/assets/image/whale_oil.png": "7537a0acb2d6ce1234a6bdf4aed342cd",
"assets/assets/image/inlay.png": "4076cc962056f703f9ba8a32a62c066a",
"assets/assets/image/gold_ore.png": "7160a1a161468ae6fa9f0473efa5d734",
"assets/assets/image/oil-power-plant.webp": "101612971295345814cb552c3a363ced",
"assets/assets/image/bus_stop.png": "9b12d424dc2fe18a74cb39195871bfaa",
"assets/assets/image/sewing-machines.webp": "fc4b03b75063ad8f1db29e46c8074254",
"assets/assets/image/grapes.png": "0bd745af37d1f9bf9f4012faf880e42e",
"assets/assets/image/trifle_tower.png": "c3261a7195b31cbc6e1c8a4c594fadff",
"assets/assets/image/copper.png": "bdb277346de4d758dbf66e84343f12db",
"assets/assets/image/caffee.png": "f6a42fcc6ca08fffeff9b94762e3c5d0",
"assets/assets/image/husky.png": "063e7ea6a878af52915018b306273f1b",
"assets/assets/image/sled_frame.png": "d02b86c00559f5661e8e4e6e27faa9db",
"assets/assets/image/marketplace.webp": "90d5f5c2202a30ea2ad9e6ffcbcfd6ec",
"assets/assets/image/schnitzel.png": "406c089f5a269e33329c30f5d0f3f275",
"assets/assets/image/chassis.png": "58f761b8ead26ca70773e55078bf45a2",
"assets/assets/image/electric_works_oil.png": "7e5e466887aa1b70fc2bc822bd59f811",
"assets/assets/image/tartare.png": "1b1534d7cf51b7d8df4f461e3f27a801",
"assets/assets/image/cinamon.png": "ce61835d85b86d7876265c9319a534d2",
"assets/assets/image/wool.png": "fae5f16bf6293ab390a915178441ebef",
"assets/assets/image/indigo.png": "5dcec35c112df5733260170b2f06e461",
"assets/assets/image/canned-food.webp": "ca4a6c551475a36afd75fa9b4c8274a3",
"assets/assets/image/beams.png": "23235442a6747890433f5072f97dd15a",
"assets/assets/image/steam_carriage.png": "45098e34c219a4ce38560e521344dc77",
"assets/assets/image/university.png": "b804048ef81c8483b623f0458253b3e4",
"assets/assets/image/marmelade_review.png": "c5eaf298ddd7153340c8c27338bcfdbb",
"assets/assets/image/eclair.png": "66b85d73cff2948bd54111ecc702c2a6",
"assets/assets/image/fish.webp": "ed8dfa9dd4e060e159bc48b1c2c40540",
"assets/assets/image/poncho.png": "098be28a8d1967b8c2a85218dd921c71",
"assets/assets/image/teff_grass.png": "fcdf55eeb374ddd1643899b573237a70",
"assets/assets/image/Jornaleros.png": "10b4e0968ea62acf93bb8f273ce677d4",
"assets/assets/image/cane_sugar_1.png": "27128f13aa885a004576e84cf2cc6ee2",
"assets/assets/image/seafood.png": "2cb364bc7f82ac2fb198e528cd11887d",
"assets/assets/image/grain.png": "aa72de216a9f226fb0af676c0bbdd65a",
"assets/assets/image/salt_africa.png": "4adb17763093e1abaecd2fc261ccfa4e",
"assets/assets/image/sausages.webp": "1f467d4158fd1b99730da1522215e1fc",
"assets/assets/image/gramophone.webp": "d84e3e2d06f1b6c8a5f021bf2054d60f",
"assets/assets/image/coffee.webp": "4c95fc49bd52c1e8e5a70cb8dab84dab",
"assets/assets/image/daiquiri_tropic.png": "fd6121b51f978299d3301b4a7cab2537",
"assets/assets/image/red_pepper.png": "b6368d9a479efccea7eda18ab66cc768",
"assets/assets/image/dynamite.png": "e3a4c9a78aaf8623f12f4d3d5db52111",
"assets/assets/image/hibiscus_farm.png": "6f9d87053a0df557f038351a54a1e0af",
"assets/assets/image/bank.png": "adbdd58f3794629e296d6106c533d937",
"assets/assets/image/scriptures.png": "4df832c9046c71e80726526078e0ce36",
"assets/assets/image/goose_feathers.png": "39bfdceb32b8b317619b446f13516103",
"assets/assets/image/shoes.webp": "85b2d86656d6e936a2733413ed89760d",
"assets/assets/image/Investors.png": "9567f47707720aa0b6b1483f9a20694c",
"assets/assets/image/oil_lamps.png": "aedd0cf1d3514c2706fa977205ce2562",
"assets/assets/image/goat_milk.png": "1580778eabcb5fff8039429ae720c0d5",
"assets/assets/image/reindeer_meat.png": "c50e98035e48c2c2e33f8426b2d2ea4c",
"assets/assets/image/windows.png": "87d8a03f8f94a420e1ee6567c912bc9a",
"assets/assets/image/pocket-watch.webp": "9531d9b0080a1ffd3663484f30447973",
"assets/assets/image/post_office.png": "1721339abc7d055478fdbdf4c39ec423",
"assets/assets/image/iron.png": "f36bd278bd8f873bfd218bc57e7e5666",
"assets/assets/image/schnapps.webp": "805d6685de9b6f970fd35c0daeb5d014",
"assets/assets/image/plantains.png": "ed447907deb36c4ad5b6cb36e43f35f5",
"assets/assets/image/Explorers.png": "09a7a4e963c0b27ec89f60a8ead21b1c",
"assets/assets/image/wooden_planks.png": "b093050d798abb6bed1aef7740b09060",
"assets/assets/image/Icon_resident_scholars_0.png": "4156b3767f718a1964dd6e3e783c3be0",
"assets/assets/image/lemonade.png": "a43a1b31872152b0c6723a5336fcf698",
"assets/assets/image/reinforced_concrete.png": "1cb1151ec964c5d9641d573e790d8984",
"assets/assets/image/rope.png": "caa43aa7303ba042212091d7ffd580b5",
"assets/assets/image/potatoes.png": "373c6c91c144e4f250e04c738ee67f09",
"assets/assets/image/heating_center.png": "aa5d2f8fb1bbe4a64f958918c0bfaa12",
"assets/assets/image/pearls.png": "abbe87fffc164276124f1b11aa59a1fc",
"assets/assets/image/bowler-hats..webp": "f2c617a49edf342d7bc29f0c8fd7931c",
"assets/assets/image/souvenir.png": "9f1b6741b8ef15572782cb934eec6479",
"assets/assets/image/shampoo.png": "8693942aedb9b56a055e5daf76589652",
"assets/assets/image/champagne.png": "3bf7644f266645c33435328321073de8",
"assets/assets/image/bar.png": "fd10d4e2fe9049b7520e7404b608628e",
"assets/assets/image/tortillia.png": "b8045f56a5e407a9701e35c480becc34",
"assets/assets/image/ragout.png": "cd63347dba4552e02b89b2a6f2af65c3",
"assets/assets/image/steel.png": "bbd051401c9710e901a3a4eb5b0d5a3b",
"assets/assets/image/plantain_surprise.png": "5106fe708ea22b763ccf20e8c91c17de",
"assets/assets/image/Icon_resident_elder_0.png": "4572bb38473f76ece1bed618ba226119",
"assets/assets/image/linen_fabric.png": "68d0e8be4a4c4d62027cab34932b6dff",
"assets/assets/image/hops.png": "fb835fce3f4b613e89caadedd838ef04",
"assets/assets/image/jam.png": "dfb883154e21eb0f39d8bccd019eed05",
"assets/assets/image/fur.png": "6bdd343ffa66a0c5fbbbd99be4d4b0d1",
"assets/assets/image/sleeping_bags.png": "dbafa5632d2ac2915c35c8f757b51b85",
"assets/assets/image/citrus.png": "e5d91e16c426dddb2b31dd557f4e638f",
"assets/assets/image/tobacco_pipes.png": "2f20358250aa5e1bf34b8f9e74d1bc29",
"assets/assets/image/rum.webp": "2b22fc35e6da66dfd5e836bc8c313eb6",
"assets/assets/image/steam-carriages.webp": "03c8247286cc62f78c693342d59e9f63",
"assets/assets/image/light-bulb.webp": "f65a2d87d6ddadca4befb53bd0674fd9",
"assets/assets/image/fishoil.png": "d317e7a93ac80ebdf43d043f71b4b525",
"assets/assets/image/gold.png": "1e423601d6e319253dd95d162476f287",
"assets/assets/image/tallow.png": "da58b11cd64355e216a7acd4e8144014",
"assets/assets/image/cotton_fur.png": "80030f0cb7a7e93592c172ca905fee12",
"assets/assets/image/seal_skin.png": "64bfd0027c15f02e5a45dbc1fe73ec3e",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
