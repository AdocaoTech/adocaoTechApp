import { PetController } from "../controllers/petController.js"

const petController = new PetController();

export function petsRoutes(router) {
    
    router.get('/pets/', petController.getAllPets);
    router.get('/pet/:id', petController.getById);
    router.post('/pet/:id', petController.insertPet);
    // router.get('/pet/:id', petController.getById);

}