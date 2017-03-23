package com.base.test.views;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.base.test.model.Bill;

public class ReportView extends AbstractExcelView{
	Logger logger = LogManager.getLogger(ReportView.class);
	
	 protected void buildExcelDocument(Map model, HSSFWorkbook workbook,
	   HttpServletRequest request, HttpServletResponse response)
	   throws Exception {
		 System.out.println("fourth");
	  List<Bill> bills = (List) model.get("bills");
	  HSSFSheet sheet = workbook.createSheet("Bill Report");

	  HSSFRow header = sheet.createRow(0);
	  //header.createCell(0).setCellValue("Id");
	  header.createCell(0).setCellValue("Table Number");
	  header.createCell(1).setCellValue("Amount");
	  header.createCell(2).setCellValue("Tax Amount");
	  header.createCell(3).setCellValue("Total Amount");
	  header.createCell(4).setCellValue("Payment Mode");
	  header.createCell(5).setCellValue("Card Number");
	  
	  int counter = 1;
	  for (Bill e : bills) {
	   logger.info(e);
	   HSSFRow row = sheet.createRow(counter++);
	   row.createCell(0).setCellValue(e.getTableNumber());
	   row.createCell(1).setCellValue(e.getAmount());
	   row.createCell(2).setCellValue(e.getTaxAmount());
	   row.createCell(3).setCellValue(e.getTotalAmount());
	   row.createCell(4).setCellValue(e.getPaymentMode());
	   row.createCell(5).setCellValue(e.getCardNumber());
	  }

	}
}
