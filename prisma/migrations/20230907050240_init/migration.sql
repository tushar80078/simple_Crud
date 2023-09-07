/*
  Warnings:

  - You are about to drop the column `allocated_grace_period` on the `courses` table. All the data in the column will be lost.
  - You are about to drop the column `exprected_completion_time` on the `courses` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `quizzes` DROP FOREIGN KEY `courseid_fk`;

-- AlterTable
ALTER TABLE `courses` DROP COLUMN `allocated_grace_period`,
    DROP COLUMN `exprected_completion_time`;
