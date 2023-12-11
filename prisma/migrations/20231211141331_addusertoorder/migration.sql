/*
  Warnings:

  - You are about to drop the column `created_at` on the `Category` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `Order` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `isFeature` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `isAdmn` on the `User` table. All the data in the column will be lost.
  - Added the required column `userEmail` to the `Order` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Category" DROP COLUMN "created_at",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "Order" DROP COLUMN "created_at",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "userEmail" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Product" DROP COLUMN "created_at",
DROP COLUMN "isFeature",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "isFeatured" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "isAdmn",
ADD COLUMN     "isAdmin" BOOLEAN NOT NULL DEFAULT false;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_userEmail_fkey" FOREIGN KEY ("userEmail") REFERENCES "User"("email") ON DELETE RESTRICT ON UPDATE CASCADE;
