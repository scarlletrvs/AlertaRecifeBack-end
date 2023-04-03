/*
  Warnings:

  - You are about to drop the column `email` on the `Ocorrencia` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Ocorrencia" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "descricaoDaOcorrencia" TEXT NOT NULL,
    "latitude" DECIMAL NOT NULL,
    "longitude" DECIMAL NOT NULL,
    "dataHora" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "autorId" TEXT NOT NULL DEFAULT ' ',
    CONSTRAINT "Ocorrencia_autorId_fkey" FOREIGN KEY ("autorId") REFERENCES "Usuario" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Ocorrencia" ("dataHora", "descricaoDaOcorrencia", "id", "latitude", "longitude") SELECT "dataHora", "descricaoDaOcorrencia", "id", "latitude", "longitude" FROM "Ocorrencia";
DROP TABLE "Ocorrencia";
ALTER TABLE "new_Ocorrencia" RENAME TO "Ocorrencia";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
