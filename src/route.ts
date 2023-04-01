import { Router } from "express";
import { prisma } from "./prisma";

export const router = Router()

router.post('/ocorrencia', async (req, res) => {

    const { descricaoDaOcorrencia, latitude, longitude, nome, email, fotoPerfil } = req.body

    const resultado = await prisma.ocorrencia.create({
        data: {
            descricaoDaOcorrencia,
            latitude,
            longitude,
            autor: {
                connectOrCreate: {
                    where: {
                        email,
                    },
                    create: {
                        email,
                        fotoPerfil,
                        nome,
                    }
                }
            }
        }
    })
    res.json(resultado)
})