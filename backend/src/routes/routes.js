import { Router } from "express";
import { userRoutes } from "./userRoutes.js";
import { petsRoutes } from "./petsRoutes.js";
//import { adoptionRoutes } from "./adoptionRoutes.js";

const router = Router();

userRoutes(router);
petsRoutes(router);
//adoptionRoutes(router);

export { router };
