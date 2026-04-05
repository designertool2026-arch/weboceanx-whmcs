// Firebase Logic for WebOceanX WHMCS Theme
import { initializeApp } from "https://www.gstatic.com/firebasejs/10.8.0/firebase-app.js";
import { getAuth, onAuthStateChanged } from "https://www.gstatic.com/firebasejs/10.8.0/firebase-auth.js";
import { getFirestore, doc, getDoc, setDoc, updateDoc, increment, collection, addDoc, serverTimestamp, onSnapshot } from "https://www.gstatic.com/firebasejs/10.8.0/firebase-firestore.js";

// Fetch config
const firebaseConfig = {
  apiKey: "AIzaSyDF_o4LG4nxQjuzoMtlU6z0W7cIfltR8zk",
  authDomain: "gen-lang-client-0849415166.firebaseapp.com",
  projectId: "gen-lang-client-0849415166",
  storageBucket: "gen-lang-client-0849415166.firebasestorage.app",
  messagingSenderId: "657455996593",
  appId: "1:657455996593:web:58396714af7c037aa8cc90"
};

const app = initializeApp(firebaseConfig);
const db = getFirestore(app, "ai-studio-e1febb26-2254-4bcb-9bfa-898cc1825e46");
const auth = getAuth(app);

window.woFirebase = {
    db,
    auth,
    getUserCredits: async (uid) => {
        const ref = doc(db, 'users_credits', uid);
        const snap = await getDoc(ref);
        if (!snap.exists()) {
            await setDoc(ref, { uid, credits: 100, updatedAt: serverTimestamp() });
            return 100;
        }
        return snap.data().credits;
    },
    deductCredits: async (uid, amount, toolId) => {
        const ref = doc(db, 'users_credits', uid);
        const snap = await getDoc(ref);
        if (!snap.exists()) {
            await setDoc(ref, { uid, credits: 100 - amount, updatedAt: serverTimestamp() });
        } else {
            const current = snap.data().credits;
            if (current < amount) throw new Error('Insufficient credits');
            await updateDoc(ref, { credits: increment(-amount), updatedAt: serverTimestamp() });
        }
        await addDoc(collection(db, 'tool_usage'), { uid, toolId, cost: amount, timestamp: serverTimestamp() });
    },
    subscribeToCredits: (uid, callback) => {
        return onSnapshot(doc(db, 'users_credits', uid), (doc) => {
            if (doc.exists()) {
                callback(doc.data().credits);
            } else {
                callback(100); // Default
            }
        });
    }
};

console.log("WebOceanX Firebase Logic Loaded");
