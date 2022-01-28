/*
  Warnings:

  - Made the column `movieId` on table `Screening` required. This step will fail if there are existing NULL values in that column.
  - Made the column `screenNo` on table `Screening` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "Screening" DROP CONSTRAINT "Screening_movieId_fkey";

-- DropForeignKey
ALTER TABLE "Screening" DROP CONSTRAINT "Screening_screenNo_fkey";

-- AlterTable
ALTER TABLE "Screening" ALTER COLUMN "movieId" SET NOT NULL,
ALTER COLUMN "screenNo" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "Screening" ADD CONSTRAINT "Screening_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES "Movie"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Screening" ADD CONSTRAINT "Screening_screenNo_fkey" FOREIGN KEY ("screenNo") REFERENCES "Screen"("number") ON DELETE RESTRICT ON UPDATE CASCADE;
