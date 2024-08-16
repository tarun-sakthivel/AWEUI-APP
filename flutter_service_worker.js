'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "5142372695b2f2de6ce102655bdee1a4",
"assets/AssetManifest.bin.json": "43280db24b23785ea47efe1e846e4281",
"assets/AssetManifest.json": "fdf36cfcd682d83d4a27f4d708814007",
"assets/assets/background/Spline.png": "ff232f0cf3ebd732ca4383c381450714",
"assets/assets/Fonts/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/assets/icons/apple_box.svg": "3f634f4f80414d88ada3193069b4f961",
"assets/assets/icons/Close.png": "368391f6544fe59f25ee677728c49df6",
"assets/assets/icons/Close.svg": "b539294b1e0daaefe280f38d90c7b225",
"assets/assets/icons/code.svg": "516c08c5e685a49b79fa87d0cc2f7641",
"assets/assets/icons/Ellipse%252011.png": "828d340cc7a7996e15fd628986c03b8f",
"assets/assets/icons/email.svg": "1ae885eb1fdb247400ac0400112ddefb",
"assets/assets/icons/email_box.svg": "a09e0cb77621a100cfe8c98593b9f422",
"assets/assets/icons/google_box.svg": "9f643ad1c6e2731879c4eb501357d784",
"assets/assets/icons/ios.svg": "45b815957b353fc2c4b56e2e3779d6f3",
"assets/assets/icons/password.svg": "64a726ac604a3e6228987eeb9c10bc71",
"assets/assets/icons/profile_img.png": "bdd25e977a6858b7413f720188f721c3",
"assets/assets/icons/User.svg": "5eb1b43b454f1e763da0928d4841c138",
"assets/assets/Rainforest..jpg": "95037f1feb8ad0e86c77bb6c3a0cb5e4",
"assets/assets/Riveassets/button.riv": "c8ffe2900d31d8236247928cd7c2b5f3",
"assets/assets/Riveassets/check.riv": "14f9269423eabd7e2e10cafdc6ad4d41",
"assets/assets/Riveassets/confetti.riv": "ad0d13cbea799085305316f0e8118274",
"assets/assets/Riveassets/day_night_slider.riv": "6b4e35b3ec35a7d60be2c1617463ea49",
"assets/assets/Riveassets/house.riv": "3ac77437a4c56b5143d6ceca83dd61d9",
"assets/assets/Riveassets/icons.riv": "3d29f9acebef13f01f371b59e84e664b",
"assets/assets/Riveassets/menu_button.riv": "f8fdfd9fd8dc7873dfac6f005f3233c1",
"assets/assets/Riveassets/shapes.riv": "8839d67714d5e9c52b3e0dbb2b1e89c1",
"assets/assets/Riveassets/Theme.riv": "e93129db8182fb0d0e44d4c7c1b70ebb",
"assets/assets/shapes/Circle.svg": "27c4568daf6d16902fc3b45761882799",
"assets/assets/shapes/Hexagon.svg": "e5e146b3cf9e2ac19e32c94073eedbc3",
"assets/assets/shapes/Triangle.svg": "69dc6aa6ed087440a346d8b0ecc8dc60",
"assets/assets/Walpaper1.jpg": "7f46f509bfab2da335809436420adc64",
"assets/assets/Walpaper2.jpg": "438124583f009a7680b89cf0d22d0f37",
"assets/assets/Walpaper3.jpg": "8ea5e4fd4ec47e5514722b7b36398674",
"assets/assets/Walpaper4.jpg": "450aa357eb743ec34332aaa468e39546",
"assets/assets/Walpaper5.jpg": "020eb0f7c1ecacfa62b6e65b4ea9c237",
"assets/FontManifest.json": "1d3e65fa99960de47e5f7c50f5e17337",
"assets/fonts/MaterialIcons-Regular.otf": "fbb6d52c5b704112340618f9fd023464",
"assets/NOTICES": "b0323d690a71c9a57e0f5b65896bd8f1",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "a7cb93083df687f1c4e1dad95c84631f",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "678f74dc084e8acc67e07a2a1d98aa1a",
"/": "678f74dc084e8acc67e07a2a1d98aa1a",
"main.dart.js": "e882923930b8845785fa4ed83d7496a8",
"manifest.json": "38c1c5683e67fa5b57e4f378f783ae40",
"version.json": "dc71419279b5ac71c6a0602291ed3573"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
