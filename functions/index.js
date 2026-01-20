/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {
  onDocumentCreated,
  onDocumentDeleted,
} = require("firebase-functions/v2/firestore");

const admin = require("firebase-admin");
admin.initializeApp();

const {setGlobalOptions} = require("firebase-functions/v2");
setGlobalOptions({region: "europe-west3"});

exports.onTopicCreated = onDocumentCreated(
    "topics/{topicId}",
    async (event) => {
      const newTopic = event.data.data();
      const topicTitle = newTopic.title;

      console.log("✅ Nouveau topic créé:", topicTitle);
      const tokensSnapshot = await admin
          .firestore()
          .collection("deviceTokens")
          .get();

      const tokens = tokensSnapshot.docs.map((doc) => doc.data().token);

      if (tokens.length === 0) {
        console.log("Aucun appareil enregistré");
        return;
      }

      const message = {
        notification: {
          title: "🛒 goodjob changed the shopping list",
          body: `${topicTitle} a été ajouté à la liste`,
        },
        tokens: tokens,
      };

      try {
        const response = await admin.messaging().sendEachForMulticast(message);
        console.log("✅ Envoyé:", response.successCount);
      } catch (error) {
        console.error("Erreur:", error);
      }
    },
);

exports.onTopicDeleted = onDocumentDeleted(
    "topics/{topicId}",
    async (event) => {
      const deletedTopic = event.data.data();
      const topicTitle = deletedTopic.title;

      console.log("Topic supprimé:", topicTitle);
      if (deletedTopic.silent === true) {
        console.log("Suppression silencieuse, pas de notification");
        return;
      }

      const tokensSnapshot = await admin
          .firestore()
          .collection("deviceTokens")
          .get();

      const tokens = tokensSnapshot.docs.map((doc) => doc.data().token);

      if (tokens.length === 0) return;

      const message = {
        notification: {
          title: "🛒 goodjob changed the shopping list",
          body: `${topicTitle} a été retiré de la liste`,
        },
        tokens: tokens,
      };

      try {
        const response = await admin.messaging().sendEachForMulticast(message);
        console.log("✅ Envoyé:", response.successCount);
      } catch (error) {
        console.error("Erreur:", error);
      }
    },
);
