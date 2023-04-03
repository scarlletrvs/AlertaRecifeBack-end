-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Ocorrencia" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "descricaoDaOcorrencia" TEXT NOT NULL,
    "latitude" DECIMAL NOT NULL,
    "longitude" DECIMAL NOT NULL,
    "dataHora" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "autorId" TEXT NOT NULL,
    CONSTRAINT "Ocorrencia_autorId_fkey" FOREIGN KEY ("autorId") REFERENCES "Usuario" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Ocorrencia" ("autorId", "dataHora", "descricaoDaOcorrencia", "id", "latitude", "longitude") SELECT "autorId", "dataHora", "descricaoDaOcorrencia", "id", "latitude", "longitude" FROM "Ocorrencia";
DROP TABLE "Ocorrencia";
ALTER TABLE "new_Ocorrencia" RENAME TO "Ocorrencia";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
