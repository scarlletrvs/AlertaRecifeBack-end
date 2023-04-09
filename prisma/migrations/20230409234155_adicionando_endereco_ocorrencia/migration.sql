/*
  Warnings:

  - You are about to drop the column `latitude` on the `Ocorrencia` table. All the data in the column will be lost.
  - You are about to drop the column `longitude` on the `Ocorrencia` table. All the data in the column will be lost.
  - Added the required column `enderecoDaOcorrencia` to the `Ocorrencia` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Ocorrencia" DROP COLUMN "latitude",
DROP COLUMN "longitude",
ADD COLUMN     "enderecoDaOcorrencia" TEXT NOT NULL;
