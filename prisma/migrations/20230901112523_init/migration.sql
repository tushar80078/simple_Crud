/*
  Warnings:

  - Made the column `qualification` on table `students` required. This step will fail if there are existing NULL values in that column.
  - Made the column `education` on table `students` required. This step will fail if there are existing NULL values in that column.
  - Made the column `institute_name` on table `students` required. This step will fail if there are existing NULL values in that column.
  - Made the column `profile_photo` on table `students` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE `students` MODIFY `lastname` VARCHAR(255) NULL,
    MODIFY `address` TEXT NULL,
    MODIFY `parent_mobile_no` VARCHAR(20) NULL,
    MODIFY `qualification` ENUM('secondary_school', 'higher_secondary', 'junior_college', 'under_graduate', 'post_graduate') NOT NULL,
    MODIFY `education` VARCHAR(255) NOT NULL,
    MODIFY `institute_name` VARCHAR(255) NOT NULL,
    MODIFY `profile_photo` TEXT NOT NULL,
    MODIFY `password` VARCHAR(255) NULL;
