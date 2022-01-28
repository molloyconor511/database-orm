/*
  Warnings:

  - A unique constraint covering the columns `[number]` on the table `Screen` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "Screening_screenId_key";

-- CreateIndex
CREATE UNIQUE INDEX "Screen_number_key" ON "Screen"("number");
