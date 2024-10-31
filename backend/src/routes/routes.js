import { Router } from "express";

import { petsRoutes } from "./petsRoutes.js";
import { userRoutes } from "./userRoutes.js";
import { adoptRoutes } from "./adoptRoutes.js";

const routes = Router();

routes.use("/", petsRoutes);
routes.use("/", adoptRoutes);
routes.use("/", userRoutes);

export default routes;
