enum OrderStatus {
  pending,    // The order has been created but not yet processed.
  processing, // The order is being processed by the seller.
  shipped,    // The order has been shipped to the buyer.
  delivered,  // The order has been delivered to the buyer.
}
