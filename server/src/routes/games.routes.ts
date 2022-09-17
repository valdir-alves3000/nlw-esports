import { Request, Response, Router } from "express";
import { prisma } from "../lib/prisma";

const gamesRoutes = Router();

gamesRoutes.get("/", async (req: Request, res: Response) => {
  const games = await prisma.game.findMany();

  return res.json(games);
});

gamesRoutes.get("/:id/ads", (req: Request, res: Response) => {
  return res.json([
    { id: 1, name: "Anúncio 1" },
    { id: 2, name: "Anúncio 2" },
    { id: 3, name: "Anúncio 3" },
    { id: 4, name: "Anúncio 4" },
    { id: 5, name: "Anúncio 5" },
    { id: 6, name: "Anúncio 6" },
  ]);
});

export { gamesRoutes };
