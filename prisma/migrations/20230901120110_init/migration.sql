/*
  Warnings:

  - Made the column `password` on table `students` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE `students` ADD COLUMN `gender` ENUM('male', 'female', 'other') NULL,
    MODIFY `qualification` ENUM('secondary_school', 'higher_secondary', 'junior_college', 'under_graduate', 'graduate', 'post_graduate') NOT NULL,
    MODIFY `password` VARCHAR(255) NOT NULL;
