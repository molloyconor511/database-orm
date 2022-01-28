-- DropForeignKey
ALTER TABLE "Ticket" DROP CONSTRAINT "Ticket_screeningId_fkey";

-- AlterTable
ALTER TABLE "Ticket" ALTER COLUMN "screeningId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Ticket" ADD CONSTRAINT "Ticket_screeningId_fkey" FOREIGN KEY ("screeningId") REFERENCES "Screening"("id") ON DELETE SET NULL ON UPDATE CASCADE;
