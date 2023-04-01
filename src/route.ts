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

router.get('/ocorrencias', async (req, res) => {
    const todasOcorrencias = await prisma.ocorrencia.findMany({
        select: {
            descricaoDaOcorrencia: true,
            latitude: true,
            longitude: true,
            dataHora: true,
            autorId: true,
            autor: true,
        }
    })
    res.json(todasOcorrencias)
})

router.get('/ocorrencias/:email', async (req, res) => {

    const { email } = req.params

    const ocorrenciasPorUsuario = await prisma.usuario.findUnique({
        where: {
            email,
        },
        select: {
            id: true,
            _count: true,
            nome: true,
            email: true,
            fotoPerfil: true,
            Ocorrencias: true
        }
    })

    res.json(ocorrenciasPorUsuario)
})