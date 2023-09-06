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
    `qualification` ENUM('secondary_school', 'higher_secondary', 'junior_college', 'under_graduate', 'post_graduate') NULL,
    `education` VARCHAR(255) NULL,
    `institute_name` VARCHAR(255) NULL,
    `status` ENUM('active', 'inactive') NULL,
    `profile_photo` TEXT NULL,
    `password` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `email_address`(`email_address`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
