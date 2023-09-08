/*
  Warnings:

  - You are about to drop the column `instructuion` on the `projects` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `projects` DROP COLUMN `instructuion`,
    ADD COLUMN `instructions` VARCHAR(255) NULL;
