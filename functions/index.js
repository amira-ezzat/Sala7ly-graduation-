/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");
const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.sendOrderNotification = functions.firestore
    .document('orders/{orderId}')
    .onCreate((snap, context) => {
      const orderData = snap.data();
      const payload = {
        notification: {
          title: 'Order Received',
          body: `Order from ${orderData.phoneNumber} is received.`,
        },
      };

      return admin.messaging().sendToTopic('orders', payload)
        .then(response => {
          console.log('Notification sent successfully:', response);
        })
        .catch(error => {
          console.log('Error sending notification:', error);
        });
    });

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
