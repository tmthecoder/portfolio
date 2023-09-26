'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"resume.pdf": "520282ec159ec7a32d57142d69748343",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/chromium/canvaskit.wasm": "1165572f59d51e963a5bf9bdda61e39b",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/canvaskit.wasm": "19d8b35640d13140fe4e6f3b8d450f04",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"stripe_checkout.js": "4d6714352067243c04cf2859480cb12d",
"netlify.toml": "67b127f3bd881932bd844109947fcb48",
"version.json": "677c917a0a37bacc7297637c63ffd2ad",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/AssetManifest.json": "d21dae7e6d1128ba81bc5e1e0e0ad722",
"assets/assets/resume.pdf": "520282ec159ec7a32d57142d69748343",
"assets/assets/WebsiteLogo.png": "bb60f4e5fb2f8f4574b78fe0fd38a858",
"assets/assets/profilepic.jpg": "5eae4ba3a26dc531d576d1bb02745f49",
"assets/assets/third_party/github_logo_light.png": "ef7a02b69836dc8b6a732a54c4200dcb",
"assets/assets/third_party/cocoapods_logo.png": "01a646455e96d407146dbfa87fec2fa8",
"assets/assets/third_party/github_logo_dark.png": "472739dfb5857b1f659f4c4c6b4568d0",
"assets/assets/third_party/linkedin_logo.png": "1b18d461ce75c75fdb4d7b6ec08b3e65",
"assets/assets/third_party/cargo_logo.png": "c39abeb466d747f3be442698662c5260",
"assets/assets/third_party/dart_logo.png": "9271c5feaa7176d4bc87467c11eaa8c0",
"assets/assets/projects/ftcscoutscore/website_logo.png": "fa859282cf2f9b2056937b9bd89b734d",
"assets/assets/projects/crossclip/website_logo_dark.png": "6c2090ec91f7051c53dc88507d9f392f",
"assets/assets/projects/crossclip/website_logo_light.png": "1253453873e1d0467794c9c5085e3584",
"assets/assets/projects/blinkos/website_logo_dark.png": "1f3758a4ca02eccddf2b8f432cd45128",
"assets/assets/projects/blinkos/website_logo_light.png": "4ca5a0ebdbeb79e6ba3609e529594a3a",
"assets/assets/projects/weasel/website_logo.png": "be6a00dc0ed0c672c923500a97855988",
"assets/AssetManifest.bin": "3ce35e4924c45053b6f31d45990cdd76",
"assets/fonts/MaterialIcons-Regular.otf": "a1e843e9ae2ef53058cdba5ef3db8913",
"assets/NOTICES": "64f38b7f254447591a56c3505d0bce7a",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"setup.sh": "550095602d3e45030b5b4575c642f1a7",
"favicon.ico": "9d8de5d434fbc13a4bb094ed216c2f1f",
"icons/android-chrome-192x192.png": "6ac20159674e3916e66cba16b189b361",
"icons/favicon-32x32.png": "cd95f4c948a6f52642b3e9c0a59c29ea",
"icons/apple-touch-icon.png": "2e5bd6172a9365bc11e8f5bdb3614cb0",
"icons/Icon-512.png": "e193a0cc9a4feec1bfc4a7eac9ab661c",
"icons/favicon-16x16.png": "66b9c0ce6e011e9eecf8286ea315d0d9",
"icons/Icon-192.png": "6ac20159674e3916e66cba16b189b361",
"icons/site.webmanifest": "053100cb84a50d2ae7f5492f7dd7f25e",
"icons/android-chrome-512x512.png": "e193a0cc9a4feec1bfc4a7eac9ab661c",
"index.html": "2ab4cfc8a22fb986e86ce26e4b2fea98",
"/": "2ab4cfc8a22fb986e86ce26e4b2fea98",
"main.dart.js": "920b13964b9f49d66967bf5451c626d0",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"netlify-src/package.json": "0a38662fcd636dd90224edc3b20a4032",
"netlify-src/functions-src/apple_sign_in_ftcscoutscore.js": "6c3895b802880ea55b997ec8536df759",
"netlify-src/functions-src/subscription_checkout.js": "6ed0c6cd6877b076ed72a26861b342ec",
"netlify-src/functions-src/direct_transfer_notification_handler.js": "3e89d3edb675303a2c1cee6d9508dab7",
"netlify-src/functions-src/apple_sign_in_crossclip.js": "09333c385fd71d5165e4d8851505c8ef",
"netlify-src/functions-src/shared/apple_sign_in.js": "51b96532b96b1322d30887aeeefbf48b",
"netlify-src/package-lock.json": "f56c109b777e4248d9cf9a15d63ae019",
"manifest.json": "359ac0dfb8a8f0e3dc5ad97e454239b0",
"utils.js": "423e48e110357b9752ff6f35e08cce6f"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
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
