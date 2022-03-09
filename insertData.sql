Use MovieApp;

SET
    FOREIGN_KEY_CHECKS = 0;

-- AnnualGross
LOAD DATA INFILE "/home/kyle/Desktop/5200/data/gross.csv" INTO TABLE AnnualGross CHARACTER SET utf8mb4 FIELDS TERMINATED BY "," ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 LINES (
    @year,
    @name,
    @gross,
    @theaters,
    @totalGross,
    @relDate,
    @distributor
)
set
    Year = @year,
    FilmName = @name,
    Gross = @gross,
    TotalGross = @totalGross,
    Theaters = if(@theaters = '-', 0, @theaters),
    DistributorName = @distributor;

-- Distributor
insert into
    Distributor
select
    DistributorName,
    count(*)
from
    AnnualGross
where
    DistributorName IS NOT NULL
group by
    DistributorName;

-- Rating
LOAD DATA INFILE "/home/kyle/Desktop/5200/data/ratings/newData.tsv" INTO TABLE Rating CHARACTER SET utf8mb4 FIELDS TERMINATED BY '\t' ENCLOSED BY '"' LINES TERMINATED BY "\n" IGNORE 1 LINES;

-- Person
LOAD DATA INFILE "/home/kyle/Desktop/5200/data/person/data.tsv" INTO TABLE Person CHARACTER SET utf8mb4 FIELDS TERMINATED BY '\t' LINES TERMINATED BY "\n" IGNORE 1 LINES (
    @nconst,
    @primaryName,
    @birthYear,
    @deathYear,
    @primaryProfession,
    @knownForTitles
)
set
    Nconst = @nconst,
    PrimaryName = @primaryName,
    BirthYear = @birthYear,
    DeathYear = @deathYear,
    PrimaryProfession = @primaryProfession;

-- PrinciplesCast
LOAD DATA INFILE "/home/kyle/Desktop/5200/data/principals/newData.tsv" INTO TABLE PrincipalsCast CHARACTER SET utf8mb4 FIELDS TERMINATED BY '\t' LINES TERMINATED BY "\n" (
    @tconst,
    @ordering,
    @nconst,
    @category,
    @job,
    @characters
)
set
    Nconst = @nconst,
    Tconst = @tconst,
    Category = @category,
    JobTitle = @job;

-- Director
LOAD DATA INFILE "/home/kyle/Desktop/5200/data/crew/directors.tsv" INTO TABLE Director CHARACTER SET utf8mb4 FIELDS TERMINATED BY '\t' LINES TERMINATED BY "\n" (@tconst, @nconst)
set
    Nconst = @nconst,
    Tconst = @tconst;

-- Writer
LOAD DATA INFILE "/home/kyle/Desktop/5200/data/crew/writers.tsv" INTO TABLE Writer CHARACTER SET utf8mb4 FIELDS TERMINATED BY '\t' LINES TERMINATED BY "\n" (@tconst, @nconst)
set
    Nconst = @nconst,
    Tconst = @tconst;

-- Film
LOAD DATA INFILE "/home/kyle/Desktop/5200/data/basics/newa.tsv" INTO TABLE Film CHARACTER SET utf8mb4 FIELDS TERMINATED BY '\t' LINES TERMINATED BY "\n" (
    @tconst,
    @titleType,
    @primaryTitle,
    @originalTitle,
    @isAdult,
    @startYear,
    @endYear,
    @runtimeMinutes,
    @genres
)
set
    Tconst = @tconst,
    FilmName = @primaryTitle,
    ReleaseDate = @startYear,
    isAdult = if(@isAdult = '1', true, false),
    Title = @originalTitle;

-- Genre
LOAD DATA INFILE "/home/kyle/Desktop/5200/data/basics/genre.tsv" INTO TABLE Genre CHARACTER SET utf8mb4 FIELDS TERMINATED BY '\t' LINES TERMINATED BY "\n" (@tconst, @genre)
set
    Tconst = @tconst,
    GenreType = @genre;

-- KnownForTitles
LOAD DATA INFILE "/home/kyle/Desktop/5200/data/person/knownForTitles.tsv" INTO TABLE KnownForTitles CHARACTER SET utf8mb4 FIELDS TERMINATED BY '\t' LINES TERMINATED BY "\n";

SET
    FOREIGN_KEY_CHECKS = 1;