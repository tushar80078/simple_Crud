/*
  Warnings:

  - Added the required column `publish` to the `courses` table without a default value. This is not possible if the table is not empty.
  - Added the required column `publish` to the `live_sessions` table without a default value. This is not possible if the table is not empty.
  - Added the required column `publish` to the `projects` table without a default value. This is not possible if the table is not empty.
  - Added the required column `publish` to the `residencies` table without a default value. This is not possible if the table is not empty.
  - Added the required column `publish` to the `skills` table without a default value. This is not possible if the table is not empty.
  - Added the required column `isMandatory` to the `video_recorded_sessions` table without a default value. This is not possible if the table is not empty.
  - Added the required column `publish` to the `video_recorded_sessions` table without a default value. This is not possible if the table is not empty.
  - Made the column `base_points` on table `video_recorded_sessions` required. This step will fail if there are existing NULL values in that column.
  - Made the column `allocated_points` on table `video_recorded_sessions` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE `courses` ADD COLUMN `publish` BOOLEAN NOT NULL;

-- AlterTable
ALTER TABLE `live_sessions` ADD COLUMN `publish` BOOLEAN NOT NULL;

-- AlterTable
ALTER TABLE `projects` ADD COLUMN `publish` BOOLEAN NOT NULL;

-- AlterTable
ALTER TABLE `residencies` ADD COLUMN `publish` BOOLEAN NOT NULL;

-- AlterTable
ALTER TABLE `skills` ADD COLUMN `publish` BOOLEAN NOT NULL;

-- AlterTable
ALTER TABLE `video_recorded_sessions` ADD COLUMN `isMandatory` BOOLEAN NOT NULL,
    ADD COLUMN `publish` BOOLEAN NOT NULL,
    MODIFY `base_points` DECIMAL(10, 2) NOT NULL,
    MODIFY `allocated_points` DECIMAL(10, 2) NOT NULL;
