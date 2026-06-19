import { Router } from "express";
import { loginUser,registerUser } from "../controllers/auths_controllers/auth_controller.ts";


 const router = Router()
 router.post('/login',loginUser)
 router.post('/register',registerUser)

export default router