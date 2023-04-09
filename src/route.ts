import { Router } from "express";
import { prisma } from "./prisma";

export const router = Router()

router.get("/", async (req, res) => {
    res.json("dale mommi")
})

router.post('/ocorrencia', async (req, res) => {

    const { descricaoDaOcorrencia, fotoOcorrencia, latitude, longitude, nome, email, fotoPerfil, tipoDaOcorrencia } = req.body

    const resultado = await prisma.ocorrencia.create({
        data: {
            fotoOcorrencia,
            descricaoDaOcorrencia,
            tipoDaOcorrencia,
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
            id: true,
            fotoOcorrencia: true,
            descricaoDaOcorrencia: true,
            tipoDaOcorrencia: true,
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