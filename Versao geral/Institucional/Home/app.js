// FUNÇÃO DE CÁLCULO DA SOLUÇÃO
function calc() {
    var porcentagem = Number(ipt_porcentagem.value) + 20
    var hectares = Number(ipt_hectares.value)
    var faturamento = Number(ipt_faturamento.value)
    var faturamentoAntigo = hectares * faturamento
    var faturamento20 = faturamento * 1.20
    var faturamenTototal = hectares * faturamento20
    var perdas = faturamenTototal - faturamentoAntigo

    if (ipt_porcentagem.value >= 80) {
        more80.style.display = 'block'
        simulator.style.display = 'none'
    }
    else if (ipt_porcentagem.value <= 0) {
        alert(`O campo de porcentagem não pode ser menor ou igual a 0`)
    } else if (faturamento <= 0) {
        alert(`O campo de faturamento não pode ser menor ou igual a 0`)
    } else if (hectares <= 0) {
        alert(`O campo de hectare não pode ser menor ou igual a 0`)
    } else {
        percent.innerHTML = `${porcentagem}%`
        yield.innerHTML = `R$${faturamento20.toFixed(2)}`
        yieldTotal.innerHTML = `R$${faturamenTototal.toFixed(2)}`
        loss.innerHTML = `R$${perdas.toFixed(2)}!`
        simulator.style.display = 'block'
        more80.style.display = 'none'
    }
}
// FUNÇÃO PARA MUDAR O CSS DO HEADER
window.addEventListener('scroll', function () {
    var menu = document.querySelector('header');
    menu.classList.toggle('flex', window.scrollY > 450);
})