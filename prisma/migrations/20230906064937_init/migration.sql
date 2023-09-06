/*
  Warnings:

  - You are about to drop the column `gender` on the `students` table. All the data in the column will be lost.
  - You are about to alter the column `qualification` on the `students` table. The data in that column could be lost. The data in that column will be cast from `Enum(EnumId(6))` to `Enum(EnumId(0))`.
  - You are about to drop the `booking` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `course_units` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `enrollment` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `material` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `mentors_skills` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `mentors_slot` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `options` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `projects` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `questions_results` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `quize_results` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `skill_units` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `slot` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `student_skill_units` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `video_recorded_sessions` table. If the table is not empty, all the data it contains will be lost.
  - Made the column `lastname` on table `students` required. This step will fail if there are existing NULL values in that column.
  - Made the column `address` on table `students` required. This step will fail if there are existing NULL values in that column.
  - Made the column `parent_mobile_no` on table `students` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE `booking` DROP FOREIGN KEY `booking_ibfk_1`;

-- DropForeignKey
ALTER TABLE `booking` DROP FOREIGN KEY `booking_ibfk_2`;

-- DropForeignKey
ALTER TABLE `booking` DROP FOREIGN KEY `booking_ibfk_3`;

-- DropForeignKey
ALTER TABLE `booking` DROP FOREIGN KEY `booking_ibfk_4`;

-- DropForeignKey
ALTER TABLE `course_units` DROP FOREIGN KEY `course_units_ibfk_1`;

-- DropForeignKey
ALTER TABLE `course_units` DROP FOREIGN KEY `course_units_ibfk_2`;

-- DropForeignKey
ALTER TABLE `course_units` DROP FOREIGN KEY `course_units_ibfk_3`;

-- DropForeignKey
ALTER TABLE `enrollment` DROP FOREIGN KEY `enrollment_ibfk_1`;

-- DropForeignKey
ALTER TABLE `enrollment` DROP FOREIGN KEY `enrollment_ibfk_2`;

-- DropForeignKey
ALTER TABLE `material` DROP FOREIGN KEY `material_ibfk_1`;

-- DropForeignKey
ALTER TABLE `material` DROP FOREIGN KEY `material_ibfk_2`;

-- DropForeignKey
ALTER TABLE `material` DROP FOREIGN KEY `material_ibfk_3`;

-- DropForeignKey
ALTER TABLE `material` DROP FOREIGN KEY `material_ibfk_4`;

-- DropForeignKey
ALTER TABLE `material` DROP FOREIGN KEY `material_ibfk_5`;

-- DropForeignKey
ALTER TABLE `material` DROP FOREIGN KEY `material_ibfk_6`;

-- DropForeignKey
ALTER TABLE `mentors_skills` DROP FOREIGN KEY `mentors_skills_ibfk_1`;

-- DropForeignKey
ALTER TABLE `mentors_skills` DROP FOREIGN KEY `mentors_skills_ibfk_2`;

-- DropForeignKey
ALTER TABLE `mentors_slot` DROP FOREIGN KEY `mentors_slot_ibfk_1`;

-- DropForeignKey
ALTER TABLE `mentors_slot` DROP FOREIGN KEY `mentors_slot_ibfk_2`;

-- DropForeignKey
ALTER TABLE `options` DROP FOREIGN KEY `options_ibfk_1`;

-- DropForeignKey
ALTER TABLE `questions_results` DROP FOREIGN KEY `questions_results_ibfk_1`;

-- DropForeignKey
ALTER TABLE `questions_results` DROP FOREIGN KEY `questions_results_ibfk_2`;

-- DropForeignKey
ALTER TABLE `questions_results` DROP FOREIGN KEY `questions_results_ibfk_3`;

-- DropForeignKey
ALTER TABLE `questions_results` DROP FOREIGN KEY `questions_results_ibfk_4`;

-- DropForeignKey
ALTER TABLE `questions_results` DROP FOREIGN KEY `questions_results_ibfk_5`;

-- DropForeignKey
ALTER TABLE `quize_results` DROP FOREIGN KEY `quize_results_ibfk_1`;

-- DropForeignKey
ALTER TABLE `quize_results` DROP FOREIGN KEY `quize_results_ibfk_2`;

-- DropForeignKey
ALTER TABLE `quize_results` DROP FOREIGN KEY `quize_results_ibfk_3`;

-- DropForeignKey
ALTER TABLE `quize_results` DROP FOREIGN KEY `quize_results_ibfk_4`;

-- DropForeignKey
ALTER TABLE `skill_units` DROP FOREIGN KEY `skill_units_ibfk_1`;

-- DropForeignKey
ALTER TABLE `skill_units` DROP FOREIGN KEY `skill_units_ibfk_2`;

-- DropForeignKey
ALTER TABLE `skill_units` DROP FOREIGN KEY `skill_units_ibfk_3`;

-- DropForeignKey
ALTER TABLE `skill_units` DROP FOREIGN KEY `skill_units_ibfk_4`;

-- DropForeignKey
ALTER TABLE `skill_units` DROP FOREIGN KEY `skill_units_ibfk_5`;

-- DropForeignKey
ALTER TABLE `student_skill_units` DROP FOREIGN KEY `student_skill_units_ibfk_1`;

-- DropForeignKey
ALTER TABLE `student_skill_units` DROP FOREIGN KEY `student_skill_units_ibfk_2`;

-- DropForeignKey
ALTER TABLE `student_skill_units` DROP FOREIGN KEY `student_skill_units_ibfk_3`;

-- AlterTable
ALTER TABLE `students` DROP COLUMN `gender`,
    MODIFY `lastname` VARCHAR(255) NOT NULL,
    MODIFY `address` TEXT NOT NULL,
    MODIFY `parent_mobile_no` VARCHAR(20) NOT NULL,
    MODIFY `qualification` ENUM('secondary_school', 'higher_secondary', 'junior_college', 'under_graduate', 'post_graduate') NULL,
    MODIFY `education` VARCHAR(255) NULL,
    MODIFY `institute_name` VARCHAR(255) NULL,
    MODIFY `status` ENUM('active', 'inactive') NULL,
    MODIFY `profile_photo` TEXT NULL;

-- DropTable
DROP TABLE `booking`;

-- DropTable
DROP TABLE `course_units`;

-- DropTable
DROP TABLE `enrollment`;

-- DropTable
DROP TABLE `material`;

-- DropTable
DROP TABLE `mentors_skills`;

-- DropTable
DROP TABLE `mentors_slot`;

-- DropTable
DROP TABLE `options`;

-- DropTable
DROP TABLE `projects`;

-- DropTable
DROP TABLE `questions_results`;

-- DropTable
DROP TABLE `quize_results`;

-- DropTable
DROP TABLE `skill_units`;

-- DropTable
DROP TABLE `slot`;

-- DropTable
DROP TABLE `student_skill_units`;

-- DropTable
DROP TABLE `video_recorded_sessions`;

-- CreateTable
CREATE TABLE `admin_account` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `admin_name` VARCHAR(255) NOT NULL,
    `email_address` VARCHAR(50) NOT NULL,
    `password` VARCHAR(8) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- RenameIndex
ALTER TABLE `questions` RENAME INDEX `quiz_id` TO `fk_question_id`;

-- RenameIndex
ALTER TABLE `quizzes` RENAME INDEX `courseid_fk` TO `fk_courseid`;

-- RenameIndex
ALTER TABLE `quizzes` RENAME INDEX `skilid_fk` TO `fk_skilid`;
