jQuery ->
	$("#movimentacao_categoria_id").append("<option value='<%=@categoria.id%>'><%=@categoria.descricao%></option>").val("<%=@categoria.id%>")
	<%= render :partial => "movimentacoes/update_information" %>