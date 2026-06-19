import type { Request, Response } from 'express';
import { prisma } from '../../prisma.ts';



export const registerUser = async(req:Request, resp:Response)=>{

    const {email,password,username,usertype} = req.body
    const user = await prisma.user.create({
        data:{
            email,
            password,
            username,
            usertype,
        }
    })
    resp.json(user)

}

// loginUser

export const loginUser = async(req:Request, resp:Response)=>{

    const {email,password} = req.body
    const user = await prisma.user.findUnique({
        where:{
            email:email
        }
    })
    if(!user){
        resp.status(404).json({error:"User not found"})
        return
    }
    if(user.password !== password){
        resp.status(401).json({error:"Invalid password"})
        return
    }
    resp.json(user)
}


