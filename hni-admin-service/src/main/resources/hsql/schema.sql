SET MODE MySQL;
-- MySQL Workbench Forward Engineering


-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NULL,
  `last_name` VARCHAR(255) NULL,
  `gender_code` VARCHAR(1) NULL,
  `mobile_phone` VARCHAR(45) NULL,
  `email` VARCHAR(255) NULL,
  `deleted` INT NULL,
  `password` VARCHAR(255) NULL,
  `salt` VARCHAR(255) NULL,
  `created` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `organizations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `organizations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `phone` VARCHAR(32) NULL,
  `website` VARCHAR(255) NULL,
  `logo` VARCHAR(255) NULL,  
  `created` DATETIME NULL,
  `created_by` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_organization_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user_organization_role` (
  `user_id` INT NOT NULL,
  `organization_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `organization_id`, `role_id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `role_permission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `role_permissions` (
  `role_id` INT NOT NULL,
  `permission_id` INT NOT NULL,
  PRIMARY KEY (`role_id`, `permission_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_token`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user_token` (
  `user_id` INT NOT NULL,
  `token` VARCHAR(255) NULL,
  `created` DATETIME NULL,
  PRIMARY KEY (`token`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `providers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `providers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `created` DATETIME NOT NULL,
  `created_by` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `provider_locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `provider_locations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `provider_id` INT NOT NULL,
  `created` VARCHAR(45) NOT NULL,
  `created_by` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `client_id` INT NOT NULL,
  `provider_location_id` INT NOT NULL,
  `order_date` DATETIME NOT NULL,
  `ready_date` DATETIME NULL,
  `pickup_date` DATETIME NULL,
  `subtotal` DECIMAL(10,2) NULL,
  `tax` DECIMAL(10,2) NULL,
  `created_by` INT NULL COMMENT 'surrogate to users',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menus` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `provider_id` INT NOT NULL,
  `start_hour` INT NULL COMMENT 'starting hour item is available in 24hr',
  `end_hour` INT NULL COMMENT 'ending hour item is available in 24hr',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `menu_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `menu_id` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  `description` TEXT NULL,
  `price` DECIMAL(10,2) NULL,
  `expires` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `order_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `menu_item_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `amount` DECIMAL(10,2) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `address_line1` VARCHAR(255) NULL,
  `address_line2` VARCHAR(255) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(2) NULL,
  `zip` VARCHAR(15) NULL,
  `longitude` VARCHAR(45) NULL,
  `latitude` VARCHAR(45) NULL,
  `timezone` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `activation_codes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `activation_codes` (
  `activation_code` VARCHAR(255) NOT NULL,
  `organization_id` INT NOT NULL,
  `created` VARCHAR(45) NULL,
  PRIMARY KEY (`activation_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_provider_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user_provider_role` (
  `user_id` INT NOT NULL,
  `provider_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `provider_id`, `role_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `provider_addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `provider_addresses` (
  `provider_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`provider_id`, `address_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `provider_location_addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `provider_location_addresses` (
  `provider_location_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`provider_location_id`, `address_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `organization_addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `organization_addresses` (
  `organization_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`organization_id`, `address_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `provider_location_hours`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `provider_location_hours` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `provider_location_id` INT NOT NULL,
  `dow` VARCHAR(3) NULL,
  `open_hour` INT NULL COMMENT 'open hour in 24hr',
  `close_hour` INT NULL COMMENT 'close hour in 24hr',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;
