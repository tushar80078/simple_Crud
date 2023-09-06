-- CreateTable
CREATE TABLE `booking` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `mentor_slot_id` INTEGER NOT NULL,
    `student_id` INTEGER NOT NULL,
    `course_id` INTEGER NOT NULL,
    `session_id` INTEGER NOT NULL,
    `meeting_link` VARCHAR(255) NOT NULL,
    `iscomplete` BOOLEAN NULL DEFAULT false,

    INDEX `course_id`(`course_id`),
    INDEX `mentor_slot_id`(`mentor_slot_id`),
    INDEX `session_id`(`session_id`),
    INDEX `student_id`(`student_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `course_units` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `course_id` INTEGER NOT NULL,
    `unit_type` ENUM('skill', 'project', 'residency') NOT NULL,
    `skill_id` INTEGER NULL,
    `project_id` INTEGER NULL,
    `residency_id` INTEGER NULL,
    `sequence` INTEGER NULL,

    INDEX `project_id`(`project_id`),
    INDEX `residency_id`(`residency_id`),
    INDEX `skill_id`(`skill_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `courses` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `fees` DECIMAL(10, 2) NOT NULL,
    `course_description` TEXT NULL,
    `exprected_completion_time` VARCHAR(10) NULL,
    `allocated_grace_period` VARCHAR(10) NULL,
    `course_score` DECIMAL(10, 2) NULL,
    `has_project` BOOLEAN NULL,
    `has_residency` BOOLEAN NULL,
    `couse_image_link` TEXT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enrollment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `student_id` INTEGER NOT NULL,
    `course_id` INTEGER NOT NULL,
    `enrollment_date` DATE NOT NULL,

    INDEX `course_id`(`course_id`),
    INDEX `student_id`(`student_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `live_sessions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `session_name` VARCHAR(255) NOT NULL,
    `session_duration` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `material` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `material_for` ENUM('project', 'live_assignment', 'recorded_assignment', 'live_reading_material', 'video_reading_maetrial', 'residencies') NULL,
    `project_id` INTEGER NULL,
    `live_assignment` INTEGER NULL,
    `recorded_assignment` INTEGER NULL,
    `live_reading_material` INTEGER NULL,
    `video_reading_maetrial` INTEGER NULL,
    `residencies` INTEGER NULL,

    INDEX `live_assignment`(`live_assignment`),
    INDEX `live_reading_material`(`live_reading_material`),
    INDEX `project_id`(`project_id`),
    INDEX `recorded_assignment`(`recorded_assignment`),
    INDEX `residencies`(`residencies`),
    INDEX `video_reading_maetrial`(`video_reading_maetrial`),
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

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `mentors_skills` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `mentor_id` INTEGER NOT NULL,
    `skill_id` INTEGER NOT NULL,

    INDEX `mentor_id`(`mentor_id`),
    INDEX `skill_id`(`skill_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `mentors_slot` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `mentor_id` INTEGER NOT NULL,
    `slot_id` INTEGER NOT NULL,

    INDEX `mentor_id`(`mentor_id`),
    INDEX `slot_id`(`slot_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `options` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `question_id` INTEGER NOT NULL,
    `option_text` VARCHAR(255) NOT NULL,
    `is_correct` BOOLEAN NOT NULL,

    INDEX `question_id`(`question_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `projects` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `instructuion` VARCHAR(255) NULL,
    `expected_completion_time` VARCHAR(255) NULL,
    `allocated_grace_period` VARCHAR(255) NULL,
    `projectFor` ENUM('skill', 'course') NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `questions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `quiz_id` INTEGER NOT NULL,
    `question_text` TEXT NOT NULL,
    `question_type` ENUM('multiple_choice', 'true_false', 'open_ended') NOT NULL,
    `allocated_marks` INTEGER NULL,

    INDEX `quiz_id`(`quiz_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `questions_results` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `student_id` INTEGER NOT NULL,
    `question_id` INTEGER NOT NULL,
    `quiz_id` INTEGER NOT NULL,
    `skill_id` INTEGER NOT NULL,
    `course_id` INTEGER NOT NULL,
    `score` ENUM('zero', 'one', 'two') NOT NULL,

    INDEX `course_id`(`course_id`),
    INDEX `question_id`(`question_id`),
    INDEX `quiz_id`(`quiz_id`),
    INDEX `skill_id`(`skill_id`),
    INDEX `student_id`(`student_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `quize_results` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `student_id` INTEGER NOT NULL,
    `quiz_id` INTEGER NOT NULL,
    `score` INTEGER NOT NULL,
    `skill_id` INTEGER NOT NULL,
    `course_id` INTEGER NOT NULL,

    INDEX `course_id`(`course_id`),
    INDEX `quiz_id`(`quiz_id`),
    INDEX `skill_id`(`skill_id`),
    INDEX `student_id`(`student_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `quizzes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `description` TEXT NULL,
    `is_mandatory` BOOLEAN NULL,
    `skill_id` INTEGER NULL,
    `course_id` INTEGER NULL,
    `created_at` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `courseid_fk`(`course_id`),
    INDEX `skilid_fk`(`skill_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `residencies` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `duration` INTEGER NOT NULL,
    `instructions` TEXT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `skill_units` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `skill_id` INTEGER NOT NULL,
    `unit_type` ENUM('live_session', 'video_session', 'quiz', 'project') NOT NULL,
    `live_session_id` INTEGER NULL,
    `video_session_id` INTEGER NULL,
    `quiz_id` INTEGER NULL,
    `project_id` INTEGER NULL,
    `sequence` INTEGER NULL,

    INDEX `live_session_id`(`live_session_id`),
    INDEX `project_id`(`project_id`),
    INDEX `quiz_id`(`quiz_id`),
    INDEX `skill_id`(`skill_id`),
    INDEX `video_session_id`(`video_session_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `skills` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `skill_description` TEXT NULL,
    `expected_completion_time` VARCHAR(20) NULL,
    `aloocated_grace_period` VARCHAR(20) NULL,
    `skill_score` DECIMAL(10, 2) NULL,
    `has_project` BOOLEAN NULL,
    `has_residency` BOOLEAN NULL,
    `skill_image_link` TEXT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `slot` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `start_time` TIME(0) NOT NULL,
    `end_time` TIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `student_skill_units` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `student_id` INTEGER NOT NULL,
    `skill_units_id` INTEGER NOT NULL,
    `iscomplete` BOOLEAN NULL DEFAULT false,
    `course_id` INTEGER NULL,

    INDEX `course_id`(`course_id`),
    INDEX `skill_units_id`(`skill_units_id`),
    INDEX `student_id`(`student_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `video_recorded_sessions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `session_name` INTEGER NOT NULL,
    `recording_date` DATETIME(0) NOT NULL,
    `video_url` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `booking` ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`mentor_slot_id`) REFERENCES `mentors_slot`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `booking` ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `booking` ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`course_id`) REFERENCES `courses`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `booking` ADD CONSTRAINT `booking_ibfk_4` FOREIGN KEY (`session_id`) REFERENCES `live_sessions`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `course_units` ADD CONSTRAINT `course_units_ibfk_1` FOREIGN KEY (`skill_id`) REFERENCES `skills`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `course_units` ADD CONSTRAINT `course_units_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `course_units` ADD CONSTRAINT `course_units_ibfk_3` FOREIGN KEY (`residency_id`) REFERENCES `residencies`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `enrollment` ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `enrollment` ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `material` ADD CONSTRAINT `material_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `material` ADD CONSTRAINT `material_ibfk_2` FOREIGN KEY (`live_assignment`) REFERENCES `live_sessions`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `material` ADD CONSTRAINT `material_ibfk_3` FOREIGN KEY (`recorded_assignment`) REFERENCES `video_recorded_sessions`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `material` ADD CONSTRAINT `material_ibfk_4` FOREIGN KEY (`live_reading_material`) REFERENCES `live_sessions`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `material` ADD CONSTRAINT `material_ibfk_5` FOREIGN KEY (`video_reading_maetrial`) REFERENCES `video_recorded_sessions`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `material` ADD CONSTRAINT `material_ibfk_6` FOREIGN KEY (`residencies`) REFERENCES `residencies`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `mentors_skills` ADD CONSTRAINT `mentors_skills_ibfk_1` FOREIGN KEY (`mentor_id`) REFERENCES `mentors`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `mentors_skills` ADD CONSTRAINT `mentors_skills_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skills`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `mentors_slot` ADD CONSTRAINT `mentors_slot_ibfk_1` FOREIGN KEY (`mentor_id`) REFERENCES `mentors`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `mentors_slot` ADD CONSTRAINT `mentors_slot_ibfk_2` FOREIGN KEY (`slot_id`) REFERENCES `slot`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `options` ADD CONSTRAINT `options_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `questions` ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `questions_results` ADD CONSTRAINT `questions_results_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `questions_results` ADD CONSTRAINT `questions_results_ibfk_2` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `questions_results` ADD CONSTRAINT `questions_results_ibfk_3` FOREIGN KEY (`question_id`) REFERENCES `questions`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `questions_results` ADD CONSTRAINT `questions_results_ibfk_4` FOREIGN KEY (`skill_id`) REFERENCES `skills`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `questions_results` ADD CONSTRAINT `questions_results_ibfk_5` FOREIGN KEY (`course_id`) REFERENCES `courses`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `quize_results` ADD CONSTRAINT `quize_results_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `quize_results` ADD CONSTRAINT `quize_results_ibfk_2` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `quize_results` ADD CONSTRAINT `quize_results_ibfk_3` FOREIGN KEY (`skill_id`) REFERENCES `skills`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `quize_results` ADD CONSTRAINT `quize_results_ibfk_4` FOREIGN KEY (`course_id`) REFERENCES `courses`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `quizzes` ADD CONSTRAINT `courseid_fk` FOREIGN KEY (`course_id`) REFERENCES `courses`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `quizzes` ADD CONSTRAINT `skilid_fk` FOREIGN KEY (`skill_id`) REFERENCES `skills`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `skill_units` ADD CONSTRAINT `skill_units_ibfk_1` FOREIGN KEY (`skill_id`) REFERENCES `skills`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `skill_units` ADD CONSTRAINT `skill_units_ibfk_2` FOREIGN KEY (`live_session_id`) REFERENCES `live_sessions`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `skill_units` ADD CONSTRAINT `skill_units_ibfk_3` FOREIGN KEY (`video_session_id`) REFERENCES `video_recorded_sessions`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `skill_units` ADD CONSTRAINT `skill_units_ibfk_4` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `skill_units` ADD CONSTRAINT `skill_units_ibfk_5` FOREIGN KEY (`project_id`) REFERENCES `projects`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `student_skill_units` ADD CONSTRAINT `student_skill_units_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `student_skill_units` ADD CONSTRAINT `student_skill_units_ibfk_2` FOREIGN KEY (`skill_units_id`) REFERENCES `skills`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `student_skill_units` ADD CONSTRAINT `student_skill_units_ibfk_3` FOREIGN KEY (`course_id`) REFERENCES `courses`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
