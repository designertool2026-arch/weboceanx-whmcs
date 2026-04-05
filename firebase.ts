import { initializeApp } from 'firebase/app';
import { getAuth } from 'firebase/auth';
import { getFirestore, doc, getDoc, setDoc, updateDoc, increment, collection, addDoc, serverTimestamp } from 'firebase/firestore';

// Import the Firebase configuration
import firebaseConfig from './firebase-applet-config.json';

// Initialize Firebase SDK
const app = initializeApp(firebaseConfig);
export const db = getFirestore(app, firebaseConfig.firestoreDatabaseId);
export const auth = getAuth();

/**
 * Deduct credits from a user's account.
 * @param uid The user's unique ID.
 * @param amount The number of credits to deduct.
 * @param toolId The ID of the tool being used.
 * @returns A promise that resolves if the deduction was successful.
 */
export async function deductCredits(uid: string, amount: number, toolId: string) {
  const userCreditsRef = doc(db, 'users_credits', uid);
  const userCreditsSnap = await getDoc(userCreditsRef);

  if (!userCreditsSnap.exists()) {
    // If the user doesn't have a credits record, initialize it with 100 credits for the demo.
    await setDoc(userCreditsRef, {
      uid: uid,
      credits: 100 - amount,
      updatedAt: serverTimestamp()
    });
  } else {
    const currentCredits = userCreditsSnap.data().credits;
    if (currentCredits < amount) {
      throw new Error('Insufficient credits');
    }
    await updateDoc(userCreditsRef, {
      credits: increment(-amount),
      updatedAt: serverTimestamp()
    });
  }

  // Log the tool usage
  await addDoc(collection(db, 'tool_usage'), {
    uid: uid,
    toolId: toolId,
    cost: amount,
    timestamp: serverTimestamp()
  });
}

/**
 * Get the current user's credits.
 * @param uid The user's unique ID.
 * @returns A promise that resolves to the number of credits.
 */
export async function getUserCredits(uid: string): Promise<number> {
  const userCreditsRef = doc(db, 'users_credits', uid);
  const userCreditsSnap = await getDoc(userCreditsRef);

  if (!userCreditsSnap.exists()) {
    // Initialize with 100 credits for the demo.
    await setDoc(userCreditsRef, {
      uid: uid,
      credits: 100,
      updatedAt: serverTimestamp()
    });
    return 100;
  }
  return userCreditsSnap.data().credits;
}
