# session based
You're right; using a usual variable to store the cart data means the cart's state will be lost if the server restarts or if multiple users access the application. To make it more robust, you can use session management to store the cart data.

Using sessions ensures that the cart data is preserved across multiple requests and is specific to each user session. This way, each user can have their own cart, and the data will persist until the session expires or is explicitly cleared.

# redis based
Using Redis to store session data, including cart data, can be beneficial for scalability and performance, especially in a distributed system where you have multiple instances of your application running. Redis is an in-memory data store that can handle large volumes of read and write operations with low latency.