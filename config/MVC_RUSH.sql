CREATE DATABASE IF NOT EXISTS `MVC_RUSH` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `MVC_RUSH`;

CREATE TABLE IF NOT EXISTS `users`(
    `userID` INT NOT NULL AUTO_INCREMENT,
    `username` varchar(255) NOT NULL,
    `email` varchar(255) NOT NULL,
    `password` varchar(255) NOT NULL,
    `usergroup` varchar(255) DEFAULT 'users',
    `is_signed_in` BOOLEAN DEFAULT false,
    `banned` BOOLEAN DEFAULT false,
    `activated` BOOLEAN DEFAULT false,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (userID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tags`(
    `tagID` INT NOT NULL AUTO_INCREMENT,
    `title` varchar(255),
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (tagID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `categories`(
    `categoryID` INT NOT NULL AUTO_INCREMENT,
    `title` varchar(255),
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (categoryID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `articles`(
    `articleID` INT NOT NULL AUTO_INCREMENT,
    `title` varchar(255),
    `content` text,
    `userID` INT,
    `categoryID` INT,
    `tagID` INT,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(articleID),
    FOREIGN KEY(userID) REFERENCES users(userID),
    FOREIGN KEY(categoryID) REFERENCES categories(categoryID),
    FOREIGN KEY(tagID) REFERENCES tags(tagID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `comments`(
    `commentID` INT NOT NULL AUTO_INCREMENT,
    `content` text,
    `userID` INT,
    `articleID` INT,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(commentID),
    FOREIGN KEY(userID) REFERENCES users(userID),
    FOREIGN KEY(articleID) REFERENCES articles(articleID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;