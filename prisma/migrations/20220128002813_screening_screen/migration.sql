/*
  Warnings:

  - You are about to drop the column `screenId` on the `Screening` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[number]` on the table `Screen` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `screenNo` to the `Screening` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Screening" DROP CONSTRAINT "Screening_screenId_fkey";

-- AlterTable
ALTER TABLE "Screening" DROP COLUMN "screenId",
ADD COLUMN     "screenNo" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Screen_number_key" ON "Screen"("number");

-- AddForeignKey
ALTER TABLE "Screening" ADD CONSTRAINT "Screening_screenNo_fkey" FOREIGN KEY ("screenNo") REFERENCES "Screen"("number") ON DELETE RESTRICT ON UPDATE CASCADE;
