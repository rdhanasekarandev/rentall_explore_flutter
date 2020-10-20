String query=""" 
query getExploreListings{
  getMostViewedListing {
   results {
    id
    title
    personCapacity
    beds
    bookingType
    coverPhoto
    reviewsCount,
    reviewsStarRating,
    listPhotos {
      id
      name
      type
      status
    }
    listingData {
      basePrice
      currency
    }
    settingsData {
      listsettings {
        id
        itemName
      }
    }
    wishListStatus
    wishListGroupCount
    isListOwner
    listPhotoName
    roomType
    }
   status
  }
  getRecommend {
    results {
       id
       title
       personCapacity
       beds
       bookingType
       coverPhoto
       reviewsCount,
       reviewsStarRating,
       listPhotos {
         id
         name
         type
         status
       }
       listingData {
         basePrice
         currency
       }
       settingsData {
         listsettings {
           id
           itemName
         }
       }
       wishListStatus
       wishListGroupCount
       isListOwner
       listPhotoName
       roomType
    }
    status
  }
}
""";