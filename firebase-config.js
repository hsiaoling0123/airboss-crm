// 引入 Firebase SDK
import { initializeApp } from "https://www.gstatic.com/firebasejs/10.8.0/firebase-app.js";
import { getFirestore, collection, addDoc, getDocs, onSnapshot, doc, updateDoc, deleteDoc } from "https://www.gstatic.com/firebasejs/10.8.0/firebase-firestore.js";

// 帶入你的專案 Firebase 設定
const firebaseConfig = {
  apiKey: "AIzaSyCfy9ARrE9wp-bCrABsFVb-qM8_sp9_wqs",
  authDomain: "airboss-4f084.firebaseapp.com",
  projectId: "airboss-4f084",
  storageBucket: "airboss-4f084.firebasestorage.app",
  messagingSenderId: "1067344741307",
  appId: "1:1067344741307:web:15a54741a5bdb26e897a9e",
  measurementId: "G-P9ZGJH366L"
};

// 初始化 Firebase & Firestore
const app = initializeApp(firebaseConfig);
export const db = getFirestore(app);

// 🌸 1. 即時監聽雲端「客戶資料」
export function subscribeCustomers(callback) {
    return onSnapshot(collection(db, "customers"), (snapshot) => {
        const customers = snapshot.docs.map(doc => ({ id: doc.id, ...doc.data() }));
        callback(customers);
    });
}

// 🌸 2. 即時監聽雲端「派工單/行程」
export function subscribeOrders(callback) {
    return onSnapshot(collection(db, "orders"), (snapshot) => {
        const orders = snapshot.docs.map(doc => ({ id: doc.id, ...doc.data() }));
        callback(orders);
    });
}

// 🌸 3. 新增客戶到雲端
export async function addCustomerToCloud(customerData) {
    return await addDoc(collection(db, "customers"), customerData);
}

// 🌸 4. 新增工單到雲端
export async function addOrderToCloud(orderData) {
    return await addDoc(collection(db, "orders"), orderData);
}

// 🌸 5. 更新工單狀態
export async function updateOrderStatusInCloud(orderId, newStatus) {
    const orderRef = doc(db, "orders", orderId);
    return await updateDoc(orderRef, { status: newStatus });
}
