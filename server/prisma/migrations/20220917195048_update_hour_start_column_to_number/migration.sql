/*
  Warnings:

  - You are about to alter the column `hourEnd` on the `ads` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - You are about to alter the column `hourStart` on the `ads` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_ads" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "gameId" TEXT NOT NULL,
    "yearsPlaying" INTEGER NOT NULL,
    "discord" TEXT NOT NULL,
    "weekDays" TEXT NOT NULL,
    "hourStart" INTEGER NOT NULL,
    "hourEnd" INTEGER NOT NULL,
    "useVoiceChannel" BOOLEAN NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "ads_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "games" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_ads" ("created_at", "discord", "gameId", "hourEnd", "hourStart", "id", "name", "useVoiceChannel", "weekDays", "yearsPlaying") SELECT "created_at", "discord", "gameId", "hourEnd", "hourStart", "id", "name", "useVoiceChannel", "weekDays", "yearsPlaying" FROM "ads";
DROP TABLE "ads";
ALTER TABLE "new_ads" RENAME TO "ads";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
