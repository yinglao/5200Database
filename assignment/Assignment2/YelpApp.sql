CREATE SCHEMA IF NOT EXISTS YelpApp;
USE YelpApp;
DROP TABLE IF EXISTS Reviews;
DROP TABLE IF EXISTS Recommendations;
DROP TABLE IF EXISTS Reservations;
DROP TABLE IF EXISTS SitDownRestaurant;
DROP TABLE IF EXISTS TakeOutRestaurant;
DROP TABLE IF EXISTS FoodCartRestaurant;
DROP TABLE IF EXISTS CreditCards;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Restaurants;
DROP TABLE IF EXISTS Companies;


CREATE TABLE Users(
  UserName VARCHAR(255),
  FirstName VARCHAR(255),
  LastName VARCHAR(255),
  Email VARCHAR(255),
  Phone INT,
  CONSTRAINT pk_Users_UserName PRIMARY KEY (UserName)
);


CREATE TABLE Companies(
  CompanyName VARCHAR(255),
  About TEXT,
  CONSTRAINT pk_Companies_CompanyName PRIMARY KEY (CompanyName)
);
 

create table Restaurants(
 RestaurantId int auto_increment,
 RestaurantName varchar(255),
 Description text,
 Menu text,
 Hours text,
 Active boolean,
 Cuisine enum('African', 'American', 'Asian', 'European', 'Hispanic'),
 Company varchar(255),
 constraint pk_Restaurants_RestaurantId 
  primary key (RestaurantId),
 constraint fk_Restaurants_Company
  foreign key (Company)
  references Companies(CompanyName)
  on update cascade
  on delete set null);

create table CreditCards(
 CardNumber bigint,
 Expiration date,
 UserName varchar(255),
 constraint pk_CreditCards_CardNumber 
  primary key (CardNumber),
 constraint fk_CreditCards_UserName
  foreign key (UserName)
  references Users (UserName)
  on update cascade
  on delete cascade
 );
 
create table TakeOutRestaurant(
 RestaurantId int,
 MaxWaitTime int,
 constraint pk_TakeOutRestaurant_RestaurantId
  primary key (RestaurantId),
 constraint fk_TakeOutRestaurant_RestaurantId
  foreign key (RestaurantId)
  references Restaurants (RestaurantId)
  on update cascade
  on delete cascade
);
  
create table FoodCartRestaurant(
 RestaurantId int,
 Licensed boolean,
 constraint pk_FoodCartRestaurant_RestaurantId
  primary key (RestaurantId),
 constraint fk_FoodCartRestaurant_RestaurantId
  foreign key (RestaurantId)
  references Restaurants (RestaurantId)
  on update cascade
  on delete cascade
); 
 
create table SitDownRestaurant(
 RestaurantId int,
 Capacity int,
 constraint pk_SitDownRestaurant_RestaurantId
  primary key (RestaurantId),
 constraint fk_SitDownRestaurant_RestaurantId
  foreign key (RestaurantId)
  references Restaurants (RestaurantId)
  on update cascade
  on delete cascade
);

create table Reservations(
 ReservationId int auto_increment,
 UserName varchar(255),
 RestaurantId int,
 StartTime timestamp,
 EndTime timestamp,
 Size int,
 constraint pk_Reservations_ReservationId
  primary key (ReservationId),
 constraint fk_Reservations_UserName
  foreign key (UserName)
  references Users (UserName)
  on update cascade
  on delete cascade,
 constraint fk_Reservations_RestaurantId
  foreign key (RestaurantId)
  references Restaurants (RestaurantId)
  on update cascade
  on delete cascade
);

create table Reviews(
 ReviewId int auto_increment,
 UserName varchar(255),
 RestaurantId int,
 CreateTime timestamp,
 Content text,
 Rating decimal,
 constraint pk_Reviews_ReviesId
  primary key (ReviewId),
 constraint fk_Reviews_UserName
  foreign key (UserName)
  references Users (UserName)
  on update cascade
  on delete set null,
 constraint fk_Reviews_RestaurantId
  foreign key (RestaurantId)
  references Restaurants (RestaurantId)
  on update cascade
  on delete set null
);

create table Recommendations(
 RecommendationId int auto_increment,
 UserName varchar(255),
 RestaurantId int,
 constraint pk_Recommendations_RecommendationId
  primary key (RecommendationId),
 constraint fk_Recommendations_UserName
  foreign key (UserName)
  references Users (UserName)
  on update cascade
  on delete set null,
 constraint fk_Recommendations_RestaurantId
  foreign key (RestaurantId)
  references Restaurants (RestaurantId)
  on update cascade
  on delete set null
);
  


 
