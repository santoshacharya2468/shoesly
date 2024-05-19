const admin=require('firebase-admin');
admin.initializeApp();
const functions=require('firebase-functions');
const db=admin.firestore();

//function will be called everytime new review is added

exports.onReviewAdded = functions.firestore.document('productReviews/{docId}').onCreate(async(snapshot,context)=>{
    let review=snapshot.data();
    const allReviews=await db.collection('productReviews').where('productId','==',review.productId).get();
    let totalReviews=allReviews.docs.length;
    let totalRating=0;
    allReviews.forEach((doc)=>{
        totalRating+=doc.data().score;
    });
    let averageRating=totalRating/totalReviews;
    await db.collection('products').doc(review.productId).update({avgRating:+averageRating.toFixed(2),totalReviews:totalReviews});
    
});