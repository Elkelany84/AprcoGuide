const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.myFunction = functions.firestore
    .document("aaamoney/{money}")
    .onCreate((snapshot, context) => {
    //   console.log(snapshot.data());
      return admin.messaging().sendToTopic("aaamoney",
          {notification: {title: "APonline",
            // body: snapshot.data().text,
            // eslint-disable-next-line max-len
            body: "\u{1F4B2}\u{1F4B2}\u{1F4B2}فى الخير\u{1F4B2}\u{1F4B2}\u{1F4B2}",
            // body: "\u{1F4B2}spend them well \uD83C\uDF84",
            // icon: "https://drive.google.com/file/d/1Dx2Iae4PO9Bh8Y_GtT3HEBxHEJAzq6-W/view?usp=sharing",
            // imageUrl: "https://drive.google.com/file/d/1kK9vtk6wJbjC5GuIapKJqZYvBAEvwS-_/view?usp=sharing",
            clickAction: "FLUTTER_NOTIFICATION_CLICK",
          }});
    });

exports.myFunction1 = functions.firestore
    .document("cccmoney/{money1}")
    .onCreate((snapshot, context) => {
    //   console.log(snapshot.data());
      return admin.messaging().sendToTopic("cccmoney",
          {notification: {title: "APonline",
            // body: snapshot.data().text,
            // eslint-disable-next-line max-len
            body: "\u{1F4B2}\u{1F4B2}\u{1F4B2}تم تحويل المعاش التكميلي على كارت ميزة بنك مصر...محمد على فرغلى\u{1F4B2}\u{1F4B2}\u{1F4B2}",
            // body: "\u{1F4B2}spend them well \uD83C\uDF84",
            // icon: "https://drive.google.com/file/d/1Dx2Iae4PO9Bh8Y_GtT3HEBxHEJAzq6-W/view?usp=sharing",
            // imageUrl: "https://drive.google.com/file/d/1kK9vtk6wJbjC5GuIapKJqZYvBAEvwS-_/view?usp=sharing",
            clickAction: "FLUTTER_NOTIFICATION_CLICK",
          }});
    });

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
