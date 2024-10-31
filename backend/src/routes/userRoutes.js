import { Router } from "express";
import * as UserController from "../controllers/userController.js";

const routes = Router();

routes.get("/user/:id", UserController.getById);
routes.post("/singup", UserController.create);
routes.post("/login", UserController.validateLogin);


export { routes as userRoutes };