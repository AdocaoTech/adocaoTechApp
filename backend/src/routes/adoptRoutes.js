import { Router } from "express";
import * as AdoptController from "../controllers/adoptController.js";

const routes = Router();

routes.get("adoption/", AdoptController.getAll);
routes.post("adoption/", AdoptController.create);
routes.get("adoption/:id", AdoptController.getById);
routes.put("adoption/:id", AdoptController.updateAdopt);
routes.delete("adoption/:id", AdoptController.deleteAdopt);

export { routes as adoptRoutes };
