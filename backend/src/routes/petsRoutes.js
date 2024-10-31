import { Router } from "express";
import * as PetController from "../controllers/petController.js";

const routes = Router();

routes.get("/pets", PetController.getAll);
routes.post("/pets", PetController.create);


export { routes as petsRoutes };
