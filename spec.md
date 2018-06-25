# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
#this is accomplished
#my CLI allows a user to interact with the necessary aspects of the application
#a user can generate a list of movies available in a zip code they provide, based on imdb.com
#a user can prompt for more details on a movie in the list generated
#a user can exit the program when they are finished


- [X] Pull data from an external source
#my application pulls data from imdb.com based on the zip code provided by a user to accurately retrieve movies that are available near the user
#the application also pulls more specific data for each movie by accessing a sub website specific to that movie



- [X] Implement both list and detail views
#my application generates a list of movie titles that are available near the zip code provided by the user
#my application can also provide a detailed view of a specific movie in the list of movies at the user's whim
#this is accomplished by creating instances of a Movie class for each movie found on imdb for the zip code
#each instance of the object stores its own attributes, such as title, length, rating, review, etc,  to later return to the user
