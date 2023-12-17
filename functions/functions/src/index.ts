import {onDocumentCreated} from "firebase-functions/v2/firestore";
import {TranslationServiceClient} from "@google-cloud/translate";
import type {
  DocumentData,
  QueryDocumentSnapshot,
} from "firebase-admin/firestore";

const projectId = "todo-list-2382b";

const keys: string[] = ["title", "description"];

exports.createTask = onDocumentCreated("tasks/{taskId}", async (event) => {
  const translationClient = new TranslationServiceClient();
  const snapshot: QueryDocumentSnapshot | undefined = event.data;
  if (!snapshot) {
    return;
  }
  const task: DocumentData = snapshot.data();

  const request = {
    parent: `projects/${projectId}`,
    contents: keys.map((key) => task[key]),
    sourceLanguageCode: "es",
    targetLanguageCode: "en",
  };

  const [response] = await translationClient.translateText(request);

  if (response?.translations?.length !== 0) {
    const translations = response.translations ?? [];
    const translatedTask = Object.fromEntries(
        keys.map((key, index) => [key, translations[index]?.translatedText])
    );

    await snapshot.ref.set({translation: translatedTask}, {merge: true});
  }
});
