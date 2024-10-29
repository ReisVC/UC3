
const rl = require("readline-sync")


const jogoDaVelha = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]
]


function jogar() {
    while(true) {
        let jogadaDaMaquinaLinha = Math.floor(Math.random() * jogoDaVelha.length )
        let jogadaDaMaquinaColuna = Math.floor(Math.random() * jogoDaVelha[jogadaDaMaquinaLinha].length)
        
        if(jogoDaVelha[jogadaDaMaquinaLinha][jogadaDaMaquinaColuna] !== 'x') {
            jogoDaVelha[jogadaDaMaquinaLinha][jogadaDaMaquinaColuna] = 'o'
         } 

    

        console.log("a maquina jogou")
        console.table(jogoDaVelha)
        rl.question("Clique qualquer tecla")

        
        const jogadaDoUserColuna = rl.questionInt("Digite a coluna: ")
        const jogadaDoUserLinha = rl.questionInt("DIgite a linha: ")


        if(jogoDaVelha[jogadaDoUserColuna][jogadaDoUserLinha] !== 'o') {
            jogoDaVelha[jogadaDoUserColuna][jogadaDoUserLinha] = 'x'
        }

        console.table(jogoDaVelha)
        rl.question("Clique qualquer tecla")
    }

    

   
}

// for(let i = 0; i < jogoDaVelha.length; i++) {
//   for(let j = 0; j < jogoDaVelha[i].length; j ++) {
//     console.log(jogoDaVelha[i][j])
//   }
// }
jogar()
console.log(jogoDaVelha)