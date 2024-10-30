import { Router } from "express";

import { petsRoutes } from "./petsRoutes.js";
import { userRoutes } from "./userRoutes.js";
import { adoptRoutes } from "./adoptRoutes.js";

const routes = Router();

routes.use("/pets", petsRoutes);
routes.use("/adopt", adoptRoutes);
routes.use("/user", userRoutes);

export default routes;
