/*
  Warnings:

  - You are about to alter the column `fotoOcorrencia` on the `Ocorrencia` table. The data in that column could be lost. The data in that column will be cast from `String` to `Binary`.
  - Added the required column `tipoDaOcorrencia` to the `Ocorrencia` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Ocorrencia" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "tipoDaOcorrencia" TEXT NOT NULL,
    "descricaoDaOcorrencia" TEXT NOT NULL,
    "fotoOcorrencia" BLOB,
    "latitude" DECIMAL NOT NULL,
    "longitude" DECIMAL NOT NULL,
    "dataHora" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "autorId" TEXT NOT NULL,
    CONSTRAINT "Ocorrencia_autorId_fkey" FOREIGN KEY ("autorId") REFERENCES "Usuario" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Ocorrencia" ("autorId", "dataHora", "descricaoDaOcorrencia", "fotoOcorrencia", "id", "latitude", "longitude") SELECT "autorId", "dataHora", "descricaoDaOcorrencia", "fotoOcorrencia", "id", "latitude", "longitude" FROM "Ocorrencia";
DROP TABLE "Ocorrencia";
ALTER TABLE "new_Ocorrencia" RENAME TO "Ocorrencia";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
