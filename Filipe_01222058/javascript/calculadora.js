    function voltar(){
        location.reload()
    }
    function calcular() { 
        var faturamento = Number(input_faturamento.value) 
        var hectares = Number(input_hec.value)
        var prejuizo = Number(input_prejuizo.value)
        var receita_perda = (hectares * faturamento) - prejuizo
        var receita = (hectares * faturamento)
        var porcentagem_perda = (prejuizo * 100) / receita
        var help = prejuizo * 0.70
        var valor_final = receita - help


        calculadora.innerHTML = `
        <center class="centerJS">
        
        <div style="margin: 40px 0;">
        Sem SoyTech<br>
        Seu faturamento: ${receita} por safra<br>
        Sua Perda:${prejuizo} por safra<br>
        Sua Receita final: ${receita_perda}<br>
        Você perdeu aproximadamente ${porcentagem_perda} %.
        </div>
   
        <div style=" margin-bottom: 10px; "><br>
        Com SoyTech<br>
        Seu faturamento: ${receita} por safra<br>
        Sua Perda:${prejuizo} por safra<br>
        Sua Receita final: ${receita_perda}<br>
        Você perdeu aproximadamente ${porcentagem_perda} %.<br>
        A partir de resultados registrados com a utilização do produto HelpSoy, sua receita com prejuizo reduzido em 30% ficou ${valor_final} <br>
        
        <button class = "botao_funcao" onclick="voltar()">
        Novo calculo
        </button>
        </center>
        </div>`

        calculadora.style.margin = "100px 0"
        }