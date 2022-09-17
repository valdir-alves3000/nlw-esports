import { Request, Response, Router } from "express";
import { prisma } from "../lib/prisma";

const adsRoutes = Router();

adsRoutes.get("/", async (req: Request, res: Response) => {
  const ads = await prisma.ad.findMany();

  return res.status(201).json([]);
});

export { adsRoutes };
