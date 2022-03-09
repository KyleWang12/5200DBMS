CREATE SCHEMA IF NOT EXISTS MovieApp;

USE MovieApp;

DROP TABLE IF EXISTS UserReview;

DROP TABLE IF EXISTS UserFavoriteMovie;

DROP TABLE IF EXISTS UserFavoritePrinciple;

DROP TABLE IF EXISTS Users;

DROP TABLE IF EXISTS PrincipalsCast;

DROP TABLE IF EXISTS Writer;

DROP TABLE IF EXISTS Director;

DROP TABLE IF EXISTS KnownForTitles;

DROP TABLE IF EXISTS Person;

DROP TABLE IF EXISTS AnnualGross;

DROP TABLE IF EXISTS Distributor;

DROP TABLE IF EXISTS Rating;

DROP TABLE IF EXISTS Genre;

DROP TABLE IF EXISTS Film;

-- Tconst: filmid
-- Nconst: personid
CREATE TABLE Film (
  Tconst VARCHAR(15),
  FilmName VARCHAR(512),
  ReleaseDate SMALLINT,
  isAdult BOOLEAN,
  Title VARCHAR(512),
  CONSTRAINT pk_Film_Tconst PRIMARY KEY (Tconst)
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER table
  Film
ADD
  INDEX TconstIndex(Tconst);

ALTER table
  Film
ADD
  INDEX NameIndex(FilmName);

CREATE TABLE Genre (
  GenreId int auto_increment not null,
  Tconst VARCHAR(15),
  GenreType ENUM(
    'News',
    'Reality-TV',
    'History',
    'Romance',
    'Horror',
    'Music',
    'War',
    'Short',
    'Musical',
    'Drama',
    'Fantasy',
    'Adult',
    'Film-Noir',
    'Animation',
    'Comedy',
    'Sci-Fi',
    'Mystery',
    'Thriller',
    'Documentary',
    'Game-Show',
    'Western',
    'Biography',
    'Talk-Show',
    'Sport',
    'Adventure',
    'Family',
    'Action',
    'Crime'
  ),
  CONSTRAINT pk_Genre_GenreId PRIMARY KEY (GenreId),
  CONSTRAINT fk_Genre_Tconst FOREIGN KEY (Tconst) REFERENCES Film(Tconst) ON UPDATE CASCADE ON DELETE CASCADE
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER table
  Genre
ADD
  INDEX TconstIndex(Tconst);

CREATE TABLE Distributor (
  DistributorName VARCHAR(255) NOT NULL,
  MoviesQuantity INT,
  CONSTRAINT pk_Distributor_DistributorName PRIMARY KEY (DistributorName)
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE AnnualGross (
  AnnualGrossId int auto_increment not null,
  Year smallint,
  FilmName varchar(512),
  Gross bigint,
  TotalGross bigint,
  Theaters int,
  DistributorName varchar(255),
  CONSTRAINT pk_AnnualGross_AnnualGrossId PRIMARY KEY (AnnualGrossId),
  CONSTRAINT fk_AnnualGross_DistributorName FOREIGN KEY (DistributorName) REFERENCES Distributor(DistributorName) ON UPDATE CASCADE ON DELETE
  SET
    NULL
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER table
  AnnualGross
ADD
  INDEX FilmNameIndex(FilmName);

CREATE TABLE Rating (
  Tconst VARCHAR(15),
  averageRating Decimal(3, 1),
  numVotes int,
  CONSTRAINT pk_Rating_Tconst PRIMARY KEY (Tconst),
  CONSTRAINT fk_Rating_Tconst FOREIGN KEY (Tconst) REFERENCES Film(Tconst) ON UPDATE CASCADE ON DELETE CASCADE
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER table
  Rating
ADD
  INDEX TconstIndex(Tconst);

CREATE TABLE Person (
  Nconst VARCHAR(15) NOT NULL,
  PrimaryName VARCHAR(255),
  BirthYear SMALLINT,
  DeathYear SMALLINT,
  PrimaryProfession VARCHAR(255),
  CONSTRAINT pk_Person_Nconst PRIMARY KEY(Nconst)
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER table
  Person
ADD
  INDEX NconstIndex(Nconst);

CREATE TABLE KnownForTitles (
  Nconst VARCHAR(15) NOT NULL,
  Tconst VARCHAR(15) NOT NULL,
  CONSTRAINT pk_KnownForTitles_Nconst_Tconst PRIMARY KEY(Nconst, Tconst),
  CONSTRAINT fk_KnownForTitles_Tconst FOREIGN KEY (Tconst) REFERENCES Film(Tconst) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_KnownForTitles_Nconst FOREIGN KEY (Nconst) REFERENCES Person(Nconst) ON UPDATE CASCADE ON DELETE CASCADE
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER table
  KnownForTitles
ADD
  INDEX NconstIndex(Nconst);

ALTER table
  KnownForTitles
ADD
  INDEX TconstIndex(Tconst);

CREATE TABLE Director(
  DirectorId INT auto_increment NOT NULL,
  Nconst VARCHAR(15),
  Tconst VARCHAR(15),
  CONSTRAINT pk_Director_DirectorId PRIMARY KEY(DirectorId),
  CONSTRAINT fk_Director_Nconst FOREIGN KEY (Nconst) REFERENCES Person(Nconst) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_Director_Tconst FOREIGN KEY (Tconst) REFERENCES Film(Tconst) ON UPDATE CASCADE ON DELETE CASCADE
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER table
  Director
ADD
  INDEX NconstIndex(Nconst);

ALTER table
  Director
ADD
  INDEX TconstIndex(Tconst);

CREATE TABLE Writer(
  WriterId INT auto_increment NOT NULL,
  Nconst VARCHAR(15),
  Tconst VARCHAR(15),
  CONSTRAINT pk_Writer_WriterId PRIMARY KEY(WriterId),
  CONSTRAINT fk_Writer_Nconst FOREIGN KEY (Nconst) REFERENCES Person(Nconst) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_Writer_Tconst FOREIGN KEY (Tconst) REFERENCES Film(Tconst) ON UPDATE CASCADE ON DELETE CASCADE
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER table
  Writer
ADD
  INDEX NconstIndex(Nconst);

ALTER table
  Writer
ADD
  INDEX TconstIndex(Tconst);

CREATE TABLE PrincipalsCast (
  PrincipalsCastId int auto_increment not null,
  Nconst VARCHAR(15),
  Tconst VARCHAR(15),
  Category VARCHAR(255),
  JobTitle VARCHAR(512),
  CONSTRAINT pk_PrincipasCast_PrincipalsCastId PRIMARY KEY(PrincipalsCastId),
  CONSTRAINT fk_PrincipasCast_Nconst FOREIGN KEY (Nconst) REFERENCES Person(Nconst) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_PrincipalsCast_Tconst FOREIGN KEY (Tconst) REFERENCES Film(Tconst) ON UPDATE CASCADE ON DELETE CASCADE
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER table
  PrincipalsCast
ADD
  INDEX NconstIndex(Nconst);

ALTER table
  PrincipalsCast
ADD
  INDEX TconstIndex(Tconst);

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
  Tconst VARCHAR(15),
  CONSTRAINT pk_UserReview_ReviewId PRIMARY KEY (ReviewId),
  CONSTRAINT fk_UserReview_UserId FOREIGN KEY (UserId) REFERENCES Users(UserId) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_UserReview_Tconst FOREIGN KEY (Tconst) REFERENCES Film(Tconst) ON UPDATE CASCADE ON DELETE
  SET
    NULL
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE UserFavoriteMovie (
  UserFavId INT AUTO_INCREMENT,
  UserId INT NOT NULL,
  Tconst VARCHAR(15) NOT NULL,
  CONSTRAINT pk_UserFavoriteMovie_UserFavId PRIMARY KEY(UserFavId),
  CONSTRAINT fk_UserFavoriteMovie_UserId FOREIGN KEY (UserId) REFERENCES Users(UserId) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_UserFavoriteMovie_Tconst FOREIGN KEY (Tconst) REFERENCES Film(Tconst) ON UPDATE CASCADE ON DELETE CASCADE
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE UserFavoritePrinciple (
  UserFavPrincipleId INT AUTO_INCREMENT,
  UserId INT NOT NULL,
  Nconst VARCHAR(15) NOT NULL,
  CONSTRAINT pk_UserFavoritePrinciple_UserFavPrincipleId PRIMARY KEY(UserFavPrincipleId),
  CONSTRAINT fk_UserFavoritePrinciple_UserId FOREIGN KEY (UserId) REFERENCES Users(UserId) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_UserFavoritePrinciple_Nconst FOREIGN KEY (Nconst) REFERENCES Person(Nconst) ON UPDATE CASCADE ON DELETE CASCADE
) CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;