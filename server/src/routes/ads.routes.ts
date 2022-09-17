import { Request, Response, Router } from "express";
import { prisma } from "../lib/prisma";

const adsRoutes = Router();

adsRoutes.get("/:id/discord", async (req: Request, res: Response) => {
  const adId = req.params.id;

  const ad = await prisma.ad.findUniqueOrThrow({
    select: {
      discord: true,
    },
    where: {
      id: adId,
    },
  });

  return res.json({
    discord: ad.discord,
  });
});

export { adsRoutes };
