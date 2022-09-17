import { Router } from "express";
import { adsRoutes } from "./ads.routes";
import { gamesRoutes } from "./games.routes";

const routes = Router();

routes.use("/games", gamesRoutes);
routes.use("/ads", adsRoutes);

export { routes };
