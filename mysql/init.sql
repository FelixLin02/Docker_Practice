SET SESSION sql_mode = 'NO_ENGINE_SUBSTITUTION';

CREATE TABLE passengers (
  PassengerId INT PRIMARY KEY,
  Survived    TINYINT,
  Pclass      TINYINT,
  Name        VARCHAR(100),
  Sex         VARCHAR(10),
  Age         FLOAT,
  SibSp       TINYINT,
  Parch       TINYINT,
  Ticket      VARCHAR(50),
  Fare        FLOAT,
  Cabin       VARCHAR(50),
  Embarked    VARCHAR(10)
);

LOAD DATA INFILE '/docker-entrypoint-initdb.d/titanic.csv'
INTO TABLE passengers
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
  (PassengerId, Survived, Pclass, Name, Sex, @age,
   SibSp, Parch, Ticket, Fare, Cabin, Embarked)
SET Age = NULLIF(@age, '');
