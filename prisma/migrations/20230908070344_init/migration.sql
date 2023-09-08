-- CreateTable
CREATE TABLE `course_units` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `course_id` INTEGER NOT NULL,
    `unit_type` ENUM('skill', 'project', 'residency') NOT NULL,
    `skill_id` INTEGER NULL,
    `project_id` INTEGER NULL,
    `residency_id` INTEGER NULL,
    `sequence` INTEGER NULL,

    INDEX `fk_project_id`(`project_id`),
    INDEX `fk_residency_id`(`residency_id`),
    INDEX `fk_skill_id`(`skill_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `live_sessions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `session_name` VARCHAR(255) NOT NULL,
    `session_duration` INTEGER NOT NULL,
    `base_points` DECIMAL(10, 2) NULL,
    `allocated_points` DECIMAL(10, 2) NULL,
    `isMandatory` BOOLEAN NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `projects` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `instructuion` VARCHAR(255) NULL,
    `base_points` DECIMAL(10, 2) NULL,
    `allocated_points` DECIMAL(10, 2) NULL,
    `isMandatory` BOOLEAN NOT NULL,
    `projectFor` ENUM('skill', 'course') NOT NULL,
    `allocation_time_period` INTEGER NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `residencies` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `residency_name` VARCHAR(255) NOT NULL,
    `duration` INTEGER NOT NULL,
    `instructions` TEXT NULL,
    `base_points` DECIMAL(10, 2) NULL,
    `allocated_points` DECIMAL(10, 2) NULL,
    `isMandatory` BOOLEAN NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `video_recorded_sessions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `session_name` INTEGER NOT NULL,
    `recording_date` DATETIME(0) NOT NULL,
    `video_url` TEXT NULL,
    `base_points` DECIMAL(10, 2) NULL,
    `allocated_points` DECIMAL(10, 2) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `course_units` ADD CONSTRAINT `fk_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `course_units` ADD CONSTRAINT `fk_residency_id` FOREIGN KEY (`residency_id`) REFERENCES `residencies`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `course_units` ADD CONSTRAINT `fk_skill_id` FOREIGN KEY (`skill_id`) REFERENCES `skills`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
