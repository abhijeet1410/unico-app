importScripts('https://www.gstatic.com/firebasejs/8.4.1/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.4.1/firebase-messaging.js');

   /*Update with yours config*/
  const firebaseConfig = {
    apiKey: "AIzaSyDj3_7xIctivJJu91WesRdvWwXHYB6av_k",
    authDomain: "flutter-template-369aa.firebaseapp.com",
    projectId: "flutter-template-369aa",
    storageBucket: "flutter-template-369aa.appspot.com",
    messagingSenderId: "24272398369",
    appId: "1:24272398369:web:1ef41d06b165f6ba1cdb60",
    measurementId: "G-YLLB1GZ6D8"
 };
  firebase.initializeApp(firebaseConfig);
  const messaging = firebase.messaging();

  /*messaging.onMessage((payload) => {
  console.log('Message received. ', payload);*/
  messaging.onBackgroundMessage(function(payload) {
    console.log('Received background message ', payload);

    const notificationTitle = payload.notification.title;
    const notificationOptions = {
      body: payload.notification.body,
    };

    self.registration.showNotification(notificationTitle,
      notificationOptions);
  });