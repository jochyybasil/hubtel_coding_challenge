# hubtel_coding_challenge
The Flutter code defines a mobile app where the `HistoryPage` plays a central role. This page utilizes a `DefaultTabController` to manage tabs for `History` and `Transaction Summary`. When loaded, the page displays a loading indicator until data is fetched. The `History` tab presents transaction details using `TransactionCard` widgets within a `ListView`, showcasing transaction times, recipients, amounts, and statuses (successful or failed). Each transaction card includes icons indicating success or failure and additional details like transaction notes. Users can search transactions using a `SearchBar` and apply filters via an adjacent icon. This setup enables efficient browsing and management of transaction history within the app.