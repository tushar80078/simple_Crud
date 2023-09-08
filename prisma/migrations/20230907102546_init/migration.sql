/*
  Warnings:

  - Made the column `last_name` on table `mentors` required. This step will fail if there are existing NULL values in that column.
  - Made the column `experience_level` on table `mentors` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE `mentors` MODIFY `last_name` VARCHAR(255) NOT NULL,
    MODIFY `experience_level` VARCHAR(50) NOT NULL,
    MODIFY `password` TEXT NOT NULL;
