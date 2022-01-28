/*
  Warnings:

  - You are about to drop the column `screenNo` on the `Screening` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Screening" DROP CONSTRAINT "Screening_screenNo_fkey";

-- AlterTable
ALTER TABLE "Screening" DROP COLUMN "screenNo",
ADD COLUMN     "screenId" INTEGER;

-- AddForeignKey
ALTER TABLE "Screening" ADD CONSTRAINT "Screening_screenId_fkey" FOREIGN KEY ("screenId") REFERENCES "Screen"("number") ON DELETE SET NULL ON UPDATE CASCADE;
