jQuery ->
	$("#tabs").tabs()
	$("#incluir_movimentacao").button()
	$("#add_reserve").button()
	$("#data_movimentacao").datepicker({ gotoCurrent: true, showButtonPanel: true })
	$("#movimentacao_tipo").click ->
		if $(this).val() == "T"
			$("#transfer_fields").show()
			$("#category_field").hide()
			$("#account_from_in").text("da conta")
		else
			$("#transfer_fields").hide()
			$("#category_field").show()
			$("#account_from_in").text("na conta")
			$("#movimentacao_conta_destino_id").val('')
	$("#toggle_comment").click ->
		$("#comment").toggle(200)
	$("#tabela_movimentacoes tr:even").addClass("line_even")
	$("#tabela_movimentacoes tr:odd").addClass("line_odd")
	$("#month_bar").progressbar()
	$("#expenses_bar").progressbar()
	$("#movimentacao_categoria_id").prepend("<option value='new_cat' id='create_new_category'>Nova categoria</option>")
	$("#movimentacao_categoria_id").change ->
		opt_id = $(this).children(":selected").attr("id")
		if opt_id == "create_new_category"
			cat_name = prompt "Qual é o nome da categoria que você deseja inserir?"
			if cat_name != ""
				$.post("categorias", { categoria: { descricao: cat_name } }, null, "script")
			else
				$(this).val('');
