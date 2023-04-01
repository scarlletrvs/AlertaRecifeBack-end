/*
  Warnings:

  - The primary key for the `Usuario` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The required column `id` was added to the `Usuario` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

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
INSERT INTO "new_Ocorrencia" ("autorId", "dataHora", "descricaoDaOcorrencia", "id", "latitude", "longitude") SELECT "autorId", "dataHora", "descricaoDaOcorrencia", "id", "latitude", "longitude" FROM "Ocorrencia";
DROP TABLE "Ocorrencia";
ALTER TABLE "new_Ocorrencia" RENAME TO "Ocorrencia";
CREATE TABLE "new_Usuario" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "email" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "fotoPerfil" TEXT NOT NULL
);
INSERT INTO "new_Usuario" ("email", "fotoPerfil", "nome") SELECT "email", "fotoPerfil", "nome" FROM "Usuario";
DROP TABLE "Usuario";
ALTER TABLE "new_Usuario" RENAME TO "Usuario";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
