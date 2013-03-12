Import "native/payment.ouya.java"
Extern

Class PaymentWrapper
    Method Init:Void(developerId$, applicationKeyPath$, productIds$[])
    Method Purchase:Void(productId$)
    Method IsBought?(id$)
    Method IsPurchaseInProgress?()
    Method ProductQuantity%(productId$)
    Method ConsumeProduct?(productId$)
    Method RestorePurchases:Void()
    Method SetTestMode:Void()
End

Public