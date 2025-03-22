package com.pie.util;

import com.fasterxml.jackson.dataformat.csv.CsvSchema;

public class CsvWriter {

	public static CsvSchema getSchema(String type) {
		CsvSchema schema = CsvSchema.builder().addColumn("dateGeneration").addColumn("uniqueId")
				.addColumn("companyName").addColumn("totalAmount").addColumn("isgtTax").addColumn("cgstTax")
				.addColumn("sgstTax").addColumn("typeName").build().withHeader();

		if (type==null || type.equalsIgnoreCase("Receipt") ) {
			schema = CsvSchema.builder().addColumn("dateGeneration").addColumn("uniqueId").addColumn("companyName")
					.addColumn("totalAmount").addColumn("isgtTax").addColumn("cgstTax").addColumn("sgstTax").addColumn("typeName")
					.addColumn("paymentMode").addColumn("paymentInvoiceId").addColumn("paidBy")
					.build().withHeader();
		}
		
		return schema;
	}

}
