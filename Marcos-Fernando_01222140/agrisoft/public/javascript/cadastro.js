function verificacao_senha() {
    var senha = in_senha.value;
    var conf_senha = in_confirmacao_senha.value;
    
    if (conf_senha != senha) {
        alerta.innerHTML = `
            <p style="color: red;">
            As senhas devem ser iguais!
            </p>    
        `
    } else {
        alerta.innerHTML = ``
    }
}

function senhaValida() {
    var senha = in_senha.value;
    var frase_alerta = "Não foi possível realizar o cadastro!<br> A senha deve ter 8 digitos!"
        
    if (senha.length == 8) {

        if (senha.indexOf("!" == -1 || "@" == -1 || "#" == -1 || "$" == -1 || 
                          "%" == -1 || "&" == -1 || "*" == -1)) {
            alerta.innerHTML = `
            <p style="color: red;">
                A senha deve ter no mínimo um caractere especial<br> 
                ex: !, @, #, $, %, &, *
            </p>
            `
        } else {
            alerta.innerHTML = `
                Cadastro realizado com sucesso!
            `
        }

    } else {
        alerta.innerHTML = `
            <p style="color: red;">
            ${frase_alerta}
            </p>
        `
    }
}

function cadastrar() {
    var nome = in_nome.value;
    var email = in_email.value;
    var senha = in_senha.value;
    var conf_senha = in_confirmacao_senha.value;
    var cnpj = in_cnpj.value;
    var frase_alerta = "Não foi possível realizar o cadastro!<br> Verifique se os campos foram preenchidos corretamente."


    if (nome == '' || 
        email == '' || 
        senha == '' || 
        conf_senha != senha || 
        cnpj == '') {

        alerta.innerHTML = `
            <p style="color: red;">
            ${frase_alerta}
            </p>
        `
    
    } else if (email.endsWith("@gmail.com") == false) {
        alerta.innerHTML = `
            <p style="color: red;">
            ${frase_alerta}
            </p>
        `

    } else if (cnpj.length != 14) {
        alerta.innerHTML = `
            <p style="color: red;">
            ${frase_alerta}
            </p>
        `

    } else {

        senhaValida()
    
    }

}