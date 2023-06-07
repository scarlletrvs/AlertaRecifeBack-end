import { app } from "./server"

app.listen(process.env.PORT || 3000, () => {
    console.log("rodando na porta 3000")
})