-- -----------------------------------------------------
-- Schema news_api
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema news_api
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `news_api` DEFAULT CHARACTER SET utf8 ;
USE `news_api` ;

-- -----------------------------------------------------
-- Table `news_api`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `news_api`.`users` (
  `id_user` VARCHAR(36) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `age` INT NOT NULL,
  `description` MEDIUMTEXT NULL,
  `created_at` DATE NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE INDEX `id_user_UNIQUE` (`id_user` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `news_api`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `news_api`.`categories` (
  `id_category` VARCHAR(36) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`id_category`),
  UNIQUE INDEX `id_category_UNIQUE` (`id_category` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `news_api`.`users_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `news_api`.`users_categories` (
  `users_id_user` VARCHAR(36) NOT NULL,
  `categories_id_category` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`users_id_user`, `categories_id_category`),
  INDEX `fk_users_has_categories_categories1_idx` (`categories_id_category` ASC) VISIBLE,
  INDEX `fk_users_has_categories_users_idx` (`users_id_user` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_categories_users`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `news_api`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_categories_categories1`
    FOREIGN KEY (`categories_id_category`)
    REFERENCES `news_api`.`categories` (`id_category`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `news_api`.`articles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `news_api`.`articles` (
  `id_article` VARCHAR(36) NOT NULL,
  `slug` VARCHAR(80) NOT NULL,
  `title` VARCHAR(80) NOT NULL,
  `body` LONGTEXT NOT NULL,
  `created_at` DATE NOT NULL,
  `users_id_user` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`id_article`, `users_id_user`),
  UNIQUE INDEX `id_article_UNIQUE` (`id_article` ASC) VISIBLE,
  INDEX `fk_articles_users1_idx` (`users_id_user` ASC) VISIBLE,
  CONSTRAINT `fk_articles_users1`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `news_api`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `news_api`.`categories_articles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `news_api`.`categories_articles` (
  `categories_id_category` VARCHAR(36) NOT NULL,
  `articles_id_article` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`categories_id_category`, `articles_id_article`),
  INDEX `fk_categories_has_articles_articles1_idx` (`articles_id_article` ASC) VISIBLE,
  INDEX `fk_categories_has_articles_categories1_idx` (`categories_id_category` ASC) VISIBLE,
  CONSTRAINT `fk_categories_has_articles_categories1`
    FOREIGN KEY (`categories_id_category`)
    REFERENCES `news_api`.`categories` (`id_category`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categories_has_articles_articles1`
    FOREIGN KEY (`articles_id_article`)
    REFERENCES `news_api`.`articles` (`id_article`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `news_api`.`likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `news_api`.`likes` (
  `id_like` VARCHAR(36) NOT NULL,
  `articles_id_article` VARCHAR(36) NOT NULL,
  `users_id_user` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`id_like`, `articles_id_article`, `users_id_user`),
  UNIQUE INDEX `id_like_UNIQUE` (`id_like` ASC) VISIBLE,
  INDEX `fk_likes_articles1_idx` (`articles_id_article` ASC) VISIBLE,
  INDEX `fk_likes_users1_idx` (`users_id_user` ASC) VISIBLE,
  CONSTRAINT `fk_likes_articles1`
    FOREIGN KEY (`articles_id_article`)
    REFERENCES `news_api`.`articles` (`id_article`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_users1`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `news_api`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `news_api`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `news_api`.`comments` (
  `id_comment` VARCHAR(36) NOT NULL,
  `comment` TINYTEXT NOT NULL,
  `articles_id_article` VARCHAR(36) NOT NULL,
  `users_id_user` VARCHAR(36) NOT NULL,
  `created_at` DATE NOT NULL,
  PRIMARY KEY (`id_comment`, `articles_id_article`, `users_id_user`),
  UNIQUE INDEX `id_comment_UNIQUE` (`id_comment` ASC) VISIBLE,
  INDEX `fk_comments_articles1_idx` (`articles_id_article` ASC) VISIBLE,
  INDEX `fk_comments_users1_idx` (`users_id_user` ASC) VISIBLE,
  CONSTRAINT `fk_comments_articles1`
    FOREIGN KEY (`articles_id_article`)
    REFERENCES `news_api`.`articles` (`id_article`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_users1`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `news_api`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


