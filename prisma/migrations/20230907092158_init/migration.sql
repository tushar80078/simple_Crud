-- CreateTable
CREATE TABLE `admin_account` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `admin_name` VARCHAR(255) NOT NULL,
    `email_address` VARCHAR(50) NOT NULL,
    `password` TEXT NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `courses` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `fees` DECIMAL(10, 2) NOT NULL,
    `course_description` TEXT NULL,
    `course_score` DECIMAL(10, 2) NULL,
    `has_project` BOOLEAN NULL,
    `has_residency` BOOLEAN NULL,
    `couse_image_link` TEXT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `mentors` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `experience_level` VARCHAR(50) NOT NULL,
    `email_address` VARCHAR(50) NOT NULL,
    `mobile_no` VARCHAR(50) NOT NULL,
    `dob` DATE NULL,
    `password` VARCHAR(20) NOT NULL,
    `skills_specialization` VARCHAR(255) NULL,
    `education` VARCHAR(255) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `skills` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `skill_description` TEXT NULL,
    `skill_score` DECIMAL(10, 2) NULL,
    `has_project` BOOLEAN NULL,
    `skill_image_link` TEXT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `students` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `firstname` VARCHAR(255) NOT NULL,
    `lastname` VARCHAR(255) NOT NULL,
    `address` TEXT NOT NULL,
    `student_mobile_no` VARCHAR(20) NOT NULL,
    `parent_mobile_no` VARCHAR(20) NOT NULL,
    `email_address` VARCHAR(255) NOT NULL,
    `dob` DATE NULL,
    `gender` ENUM('male', 'female', 'other') NULL,
    `qualification` ENUM('secondary_school', 'higher_secondary', 'junior_college', 'under_graduate', 'post_graduate') NULL,
    `education` VARCHAR(255) NULL,
    `institute_name` VARCHAR(255) NULL,
    `status` ENUM('active', 'inactive') NULL,
    `profile_photo` TEXT NULL,
    `password` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `email_address`(`email_address`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
