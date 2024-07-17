'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/apple-touch-icon.png": "2e5bd6172a9365bc11e8f5bdb3614cb0",
"icons/site.webmanifest": "053100cb84a50d2ae7f5492f7dd7f25e",
"icons/favicon-16x16.png": "66b9c0ce6e011e9eecf8286ea315d0d9",
"icons/android-chrome-192x192.png": "6ac20159674e3916e66cba16b189b361",
"icons/favicon-32x32.png": "cd95f4c948a6f52642b3e9c0a59c29ea",
"icons/Icon-512.png": "e193a0cc9a4feec1bfc4a7eac9ab661c",
"icons/Icon-192.png": "6ac20159674e3916e66cba16b189b361",
"icons/android-chrome-512x512.png": "e193a0cc9a4feec1bfc4a7eac9ab661c",
"manifest.json": "359ac0dfb8a8f0e3dc5ad97e454239b0",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "2408ed16ad579c1a7b7380c6a8ce5960",
"netlify-src/functions-src/apple_sign_in_crossclip.js": "09333c385fd71d5165e4d8851505c8ef",
"netlify-src/functions-src/shared/apple_sign_in.js": "51b96532b96b1322d30887aeeefbf48b",
"netlify-src/functions-src/subscription_checkout.js": "6ed0c6cd6877b076ed72a26861b342ec",
"netlify-src/functions-src/apple_sign_in_ftcscoutscore.js": "6c3895b802880ea55b997ec8536df759",
"netlify-src/functions-src/direct_transfer_notification_handler.js": "3e89d3edb675303a2c1cee6d9508dab7",
"netlify-src/package.json": "0a38662fcd636dd90224edc3b20a4032",
"netlify-src/package-lock.json": "f56c109b777e4248d9cf9a15d63ae019",
"version.json": "677c917a0a37bacc7297637c63ffd2ad",
"utils.js": "423e48e110357b9752ff6f35e08cce6f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/NOTICES": "5128cfb1abd7b3bf10fc0bff3cae3742",
"assets/AssetManifest.bin": "3ce35e4924c45053b6f31d45990cdd76",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "143401f4e274f5b97f2f454d1cb8bdb9",
"assets/assets/WebsiteLogo.png": "bb60f4e5fb2f8f4574b78fe0fd38a858",
"assets/assets/profilepic.jpg": "7f258ae99556a1b393edc2fee8d0c1c8",
"assets/assets/third_party/github_logo_light.png": "ef7a02b69836dc8b6a732a54c4200dcb",
"assets/assets/third_party/cocoapods_logo.png": "01a646455e96d407146dbfa87fec2fa8",
"assets/assets/third_party/linkedin_logo.png": "1b18d461ce75c75fdb4d7b6ec08b3e65",
"assets/assets/third_party/cargo_logo.png": "c39abeb466d747f3be442698662c5260",
"assets/assets/third_party/github_logo_dark.png": "472739dfb5857b1f659f4c4c6b4568d0",
"assets/assets/third_party/dart_logo.png": "9271c5feaa7176d4bc87467c11eaa8c0",
"assets/assets/resume.pdf": "861432d786fb5b0cc42f3d04b35c6236",
"assets/assets/projects/weasel/website_logo.png": "be6a00dc0ed0c672c923500a97855988",
"assets/assets/projects/crossclip/website_logo_light.png": "1253453873e1d0467794c9c5085e3584",
"assets/assets/projects/crossclip/website_logo_dark.png": "6c2090ec91f7051c53dc88507d9f392f",
"assets/assets/projects/ftcscoutscore/website_logo.png": "fa859282cf2f9b2056937b9bd89b734d",
"assets/assets/projects/blinkos/website_logo_light.png": "4ca5a0ebdbeb79e6ba3609e529594a3a",
"assets/assets/projects/blinkos/website_logo_dark.png": "1f3758a4ca02eccddf2b8f432cd45128",
"assets/fonts/MaterialIcons-Regular.otf": "5572154aefa4c547a0313646977b2a20",
"assets/AssetManifest.json": "d21dae7e6d1128ba81bc5e1e0e0ad722",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"index.html": "05230641b945d183b3bc4481925b6cc5",
"/": "05230641b945d183b3bc4481925b6cc5",
"favicon.ico": "9d8de5d434fbc13a4bb094ed216c2f1f",
"stripe_checkout.js": "4d6714352067243c04cf2859480cb12d",
"setup.sh": "550095602d3e45030b5b4575c642f1a7",
"resume.pdf": "520282ec159ec7a32d57142d69748343",
"netlify.toml": "67b127f3bd881932bd844109947fcb48",
"main.dart.js": "26a808f568979321a766d634f9530d2d"};
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
