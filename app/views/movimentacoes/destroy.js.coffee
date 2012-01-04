$("#movimentacao-" + <%= @movimentacao.id %>).remove()
<% linha = linha_saldo_user %>
$("#linha_saldo").text("<%= escape_javascript(linha)%>")