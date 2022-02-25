CREATE SCHEMA IF NOT EXISTS MovieApp;

USE MovieApp;

DROP TABLE IF EXISTS UserReview;

DROP TABLE IF EXISTS UserFavoriteMovie;

DROP TABLE IF EXISTS UserFavoritePrinciple;

DROP TABLE IF EXISTS Users;

DROP TABLE IF EXISTS PrincipalsCast;

DROP TABLE IF EXISTS Writer;

DROP TABLE IF EXISTS Director;

DROP TABLE IF EXISTS Person;

DROP TABLE IF EXISTS AnnualGross;

DROP TABLE IF EXISTS Distributor;

DROP TABLE IF EXISTS Rating;

DROP TABLE IF EXISTS Film;

DROP TABLE IF EXISTS Region;

-- to disable foreign key check when loading data
-- SET FOREIGN_KEY_CHECKS = 0;
-- SET FOREIGN_KEY_CHECKS = 1;
-- Tconst: filmid
-- Nconst: personid

CREATE TABLE Region (
  CountryCode varchar(2) not null,
  Country varchar(60),
  CONSTRAINT pk_Region_CountryCode PRIMARY KEY (CountryCode)
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE Film (
  Tconst VARCHAR(255),
  FilmName CHAR(255),
  Genre ENUM(
    'ADVENTURE',
    'ACTION',
    'DRAMA',
    'COMEDY',
    'THRILLER',
    'HORROR',
    'ROMANTIC COMEDY',
    'MUSICAL',
    'DOCUMENTARY',
    'BLACK COMEDY'
  ),
  ReleaseDate DATE,
  CountryCode VARCHAR(2),
  isAdult BOOLEAN,
  Title VARCHAR(255),
  CONSTRAINT pk_Film_Tconst PRIMARY KEY (Tconst),
  CONSTRAINT fk_Film_CountryCode FOREIGN KEY (CountryCode) REFERENCES Region(CountryCode) ON UPDATE CASCADE ON DELETE
  SET
    NULL
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE Distributor (
  DistributorName VARCHAR(255) NOT NULL,
  MoviesQuantity INT,
  CONSTRAINT pk_Distributor_DistributorName PRIMARY KEY (DistributorName)
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE AnnualGross (
  AnnualGrossId int auto_increment not null,
  Year int,
  FilmName varchar(255),
  Gross bigint,
  TotalGross bigint,
  Theaters int,
  DistributorName varchar(255),
  CONSTRAINT pk_AnnualGross_AnnualGrossId PRIMARY KEY (AnnualGrossId),
  CONSTRAINT fk_AnnualGross_DistributorName FOREIGN KEY (DistributorName) REFERENCES Distributor(DistributorName) ON UPDATE CASCADE ON DELETE
  SET
    NULL
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE Rating (
  Tconst VARCHAR(255),
  averageRating Decimal(2, 1),
  numVotes int,
  CONSTRAINT pk_Rating_Tconst PRIMARY KEY (Tconst),
  CONSTRAINT fk_Rating_Tconst FOREIGN KEY (Tconst) REFERENCES Film(Tconst) ON UPDATE CASCADE ON DELETE CASCADE
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE Person (
  Nconst VARCHAR(255) NOT NULL,
  PrimaryName VARCHAR(255),
  BirthYear VARCHAR(255),
  DeathYear VARCHAR(255),
  PrimaryProfession VARCHAR(255),
  KnownForTitles VARCHAR(255),
  CONSTRAINT pk_Person_Nconst PRIMARY KEY(Nconst)
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE Director(
  DirectorId INT NOT NULL,
  Nconst VARCHAR(255),
  Tconst VARCHAR(255),
  CONSTRAINT pk_Director_DirectorId PRIMARY KEY(DirectorId),
  CONSTRAINT fk_Director_Nconst FOREIGN KEY (Nconst) REFERENCES Person(Nconst) ON UPDATE CASCADE ON DELETE
  SET
    NULL,
    CONSTRAINT fk_Director_Tconst FOREIGN KEY (Tconst) REFERENCES Film(Tconst) ON UPDATE CASCADE ON DELETE CASCADE
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE Writer(
  WriterId INT NOT NULL,
  Nconst VARCHAR(255),
  Tconst VARCHAR(255),
  CONSTRAINT pk_Writer_WriterId PRIMARY KEY(WriterId),
  CONSTRAINT fk_Writer_Nconst FOREIGN KEY (Nconst) REFERENCES Person(Nconst) ON UPDATE CASCADE ON DELETE
  SET
    NULL,
    CONSTRAINT fk_Writer_Tconst FOREIGN KEY (Tconst) REFERENCES Film(Tconst) ON UPDATE CASCADE ON DELETE CASCADE
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE PrincipalsCast (
  PrincipalsCastId int auto_increment not null,
  Nconst VARCHAR(255),
  Tconst VARCHAR(255),
  Category VARCHAR(255),
  JobTitle VARCHAR(255),
  CONSTRAINT pk_PrincipasCast_PrincipalsCastId PRIMARY KEY(PrincipalsCastId),
  CONSTRAINT fk_PrincipasCast_Nconst FOREIGN KEY (Nconst) REFERENCES Person(Nconst) ON UPDATE CASCADE ON DELETE
  SET
    NULL,
    CONSTRAINT fk_PrincipalsCast_Tconst FOREIGN KEY (Tconst) REFERENCES Film(Tconst) ON UPDATE CASCADE ON DELETE CASCADE
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE Users (
  UserId INT AUTO_INCREMENT,
  UserName VARCHAR(255) NOT NULL,
  Password VARCHAR(255) NOT NULL,
  FirstName VARCHAR(255),
  LastName VARCHAR(255),
  Email VARCHAR(255),
  Phone VARCHAR(255),
  CONSTRAINT pk_Users_UserId PRIMARY KEY (UserId)
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE UserReview (
  ReviewId INT AUTO_INCREMENT,
  CreatedTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  Content VARCHAR(1024) NOT NULL,
  UserId INT,
  Tconst VARCHAR(255),
  CONSTRAINT pk_UserReview_ReviewId PRIMARY KEY (ReviewId),
  CONSTRAINT fk_UserReview_UserId FOREIGN KEY (UserId) REFERENCES Users(UserId) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_UserReview_Tconst FOREIGN KEY (Tconst) REFERENCES Film(Tconst) ON UPDATE CASCADE ON DELETE
  SET
    NULL
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE UserFavoriteMovie (
  UserFavId INT AUTO_INCREMENT,
  UserId INT NOT NULL,
  Tconst VARCHAR(255) NOT NULL,
  CONSTRAINT pk_UserFavoriteMovie_UserFavId PRIMARY KEY(UserFavId),
  CONSTRAINT fk_UserFavoriteMovie_UserId FOREIGN KEY (UserId) REFERENCES Users(UserId) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_UserFavoriteMovie_Tconst FOREIGN KEY (Tconst) REFERENCES Film(Tconst) ON UPDATE CASCADE ON DELETE CASCADE
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE UserFavoritePrinciple (
  UserFavPrincipleId INT AUTO_INCREMENT,
  UserId INT NOT NULL,
  Nconst VARCHAR(255) NOT NULL,
  CONSTRAINT pk_UserFavoritePrinciple_UserFavPrincipleId PRIMARY KEY(UserFavPrincipleId),
  CONSTRAINT fk_UserFavoritePrinciple_UserId FOREIGN KEY (UserId) REFERENCES Users(UserId) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_UserFavoritePrinciple_Nconst FOREIGN KEY (Nconst) REFERENCES Person(Nconst) ON UPDATE CASCADE ON DELETE CASCADE
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;