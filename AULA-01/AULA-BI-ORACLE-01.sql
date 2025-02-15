SELECT TPV.NRO_SEQ_PEDIDO 					   PEDIDO,
			TO_CHAR(TPV.DAT_PEDIDO, 'YYYY')     ANO,
			TO_CHAR(TPV.DAT_PEDIDO, 'MM')        MES,
			TO_CHAR(TPV.DAT_PEDIDO, 'DD')        DIA,
			TI.DES_ITEM									    PRODUTO,
			TP.RAZAO_SOCIAL							    CLIENTE,
			TE.DES_LOCALIDADE ||'-'|| TE.DES_UF LOCALIDADE,
			TPV.VLR_TOTAL								    VLR_VANDA
FROM TAB_PEDIDO_VENDA	TPV,
		 TAB_PV_ITEM			TPI,
		 TAB_ITEM					TI,
		 TAB_PESSOA				TP,
		 TAB_ENDERECO			TE
WHERE TPI.NRO_SEQ_PEDIDO  = TPV.NRO_SEQ_PEDIDO
	AND TI.COD_ITEM				= TPI.COD_ITEM
	AND TP.COD_PESSOA			= TPV.COD_PESSOA
	AND TE.COD_PESSOA			= TPV.COD_PESSOA
	AND TE.COD_ENDERECO		= TPV.COD_ENDERECO
ORDER BY 1 ASC;
			