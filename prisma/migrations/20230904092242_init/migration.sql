/*
  Warnings:

  - Made the column `status` on table `students` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE `students` MODIFY `qualification` ENUM('secondary_school', 'higher_secondary', 'junior_college', 'under_graduate', 'graduate', 'post_graduate', 'other') NOT NULL,
    MODIFY `status` ENUM('active', 'inactive') NOT NULL;
