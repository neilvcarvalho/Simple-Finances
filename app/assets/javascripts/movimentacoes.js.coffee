jQuery ->
	$("#incluir_movimentacao").button()
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
