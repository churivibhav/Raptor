package com.base.test.utility;

import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.awt.print.PageFormat;
import java.awt.print.Printable;
import java.awt.print.PrinterException;
import java.awt.print.PrinterJob;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.print.attribute.PrintRequestAttributeSet;
import javax.swing.JButton;
import javax.swing.JEditorPane;
import javax.swing.JFrame;
import javax.swing.UIManager;

/*import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDFont;
import org.apache.pdfbox.pdmodel.font.PDType1Font;*/
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.test.Services.ServiceInterface;
import com.base.test.model.Bill;
import com.base.test.model.Orders;
import com.base.test.model.TaxDetail;

@Service("printService")
public class Printer implements Printable, ActionListener{
	public static final String ITEM_TYPE_BAR = "BAR";
	public static final String ITEM_TYPE_FOOD = "FOOD";
	
	
	@Autowired
	private ServiceInterface<TaxDetail> taxDetailService; 
	
	public int print(Graphics g, PageFormat pf, int page) throws PrinterException {
	
		 if (page > 0) { /* We have only one page, and 'page' is zero-based */
		     return NO_SUCH_PAGE;
		 }
		
		 /* User (0,0) is typically outside the imageable area, so we must
		  * translate by the X and Y values in the PageFormat to avoid clipping
		  */
		 Graphics2D g2d = (Graphics2D)g;
		 g2d.translate(pf.getImageableX(), pf.getImageableY());
		
		 /* Now we perform our rendering */
		 g.drawString("Hello world!", 100, 100);
		 
	        
		 return PAGE_EXISTS;
		 
	}

	public void actionPerformed(ActionEvent e) {
		 /*PrinterJob job = PrinterJob.getPrinterJob();
		 job.setPrintable(this);
		 boolean ok = job.printDialog();
		 if (ok) {
		     try {
		         job.print();
		     } catch (PrinterException ex) {
		       /* The job did not successfully complete 
		     }
		 }*/
		
		try {
            String cn = UIManager.getSystemLookAndFeelClassName();
            UIManager.setLookAndFeel(cn); // Use the native L&F
        } catch (Exception cnf) {
        }
        PrinterJob job = PrinterJob.getPrinterJob();
        PrintRequestAttributeSet aset = new HashPrintRequestAttributeSet();
        PageFormat pf1 = job.pageDialog(aset);
        job.setPrintable(new Printer(), pf1);
        boolean ok = job.printDialog(aset);
        if (ok) {
            try {
                 job.print(aset);
            } catch (PrinterException ex) {
             /* The job did not successfully complete */
            }
        }
	}
	
	public void printBill(Bill bill){
		String bigLine = "--------------------------------------------------<br>";
		String smallLine = "-------------<br>";
		//String spaces = "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
		double totalTax = 0.0;
		double grandTotal = 0.0;
		
		
		UIManager.put("swing.boldMetal", Boolean.FALSE);
        JFrame f = new JFrame("Hello World Printer");
        f.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {System.exit(0);}
        });
        JButton printButton = new JButton("Print Hello World");
        printButton.addActionListener(new Printer());
        JEditorPane textarea = new JEditorPane("text/html", "");
        StringBuilder sb = new StringBuilder("");
        sb.append("BEYOND <br>");
        sb.append("OPP CITI MALL LINK ROAD ANDHERI WEST<br>");
        sb.append(" Tel : /<br>");
        sb.append("No : " + bill.getId() + "  Dt : " + bill.getCreationDate() + "<br>");
        sb.append("Tb : " + bill.getTableNumber()  + "<br>");
        sb.append(bigLine);
        sb.append("Description      &nbsp&nbsp     Qty    &nbsp&nbsp   Amount<br>");
        sb.append(bigLine);
        /*for(Orders order : bill.getOrders()){
        	if(order.getType().equals(ITEM_TYPE_BAR))
        		sb.append(order.getOrderItemID() + "    " + order.getQuantity() + "    " + order.getCost() + "<br>");
        }
        sb.append(smallLine);
        
        double amountFood = bill.getOrders().stream().filter(b -> b.getType().equals(ITEM_TYPE_FOOD))
				.mapToDouble(b -> b.getCost()).sum();
		double amountBar = bill.getOrders().stream().filter(b -> b.getType().equals(ITEM_TYPE_BAR))
				.mapToDouble(b -> b.getCost()).sum();
		System.out.println(amountBar + " " + amountFood);
		
		List<TaxDetail> taxList = taxDetailService.getAll();
		sb.append("Liquor Taxable Total : " + amountBar  + "<br>");
		for(TaxDetail taxDetail : taxList){
			if(taxDetail.getItemType().equals(ITEM_TYPE_BAR)){
				sb.append(taxDetail.getTaxType() + " " + taxDetail.getTaxValue() + " : " 
				+ taxDetail.getTaxValue() / 100 * amountBar + "<br>");
				totalTax += taxDetail.getTaxValue() / 100 * amountBar;
			}
		}
		for(Orders order : bill.getOrders()){
        	if(order.getType().equals(ITEM_TYPE_FOOD))
        		sb.append(order.getOrderItemID() + "    " + order.getQuantity() + "    " + order.getCost() + "<br>");
        }
        sb.append(smallLine);
        
		sb.append("Food Taxable Total : " + amountFood  + "<br>");
		for(TaxDetail taxDetail : taxList){
			if(taxDetail.getItemType().equals(ITEM_TYPE_FOOD)){
				sb.append(taxDetail.getTaxType() + " " + taxDetail.getTaxValue() 
				+ " : " + taxDetail.getTaxValue() / 100 * amountFood + "<br>");
				totalTax += taxDetail.getTaxValue() / 100 * amountFood;
			}
		}
		sb.append(bigLine);
		sb.append("<br>");
		grandTotal = totalTax + amountBar + amountFood;
		sb.append("Grand Total : " + grandTotal + "<br>");
		sb.append("Thank You !!<br>");*/
		
        textarea.setText(sb.toString());
        f.add( printButton);
        f.add( textarea);
        f.pack();
        //f.setVisible(true);
		
	}

	
	/*public void writeToPDF(String data) throws IOException{
		PDDocument document = new PDDocument();
		PDPage page = new PDPage();
		document.addPage( page );
		//PDFont font = PDType1Font.HELVETICA_BOLD;
		PDFont font = PDType1Font.TIMES_ROMAN;
		PDPageContentStream contentStream = new PDPageContentStream(document, page);
		contentStream.beginText();
		contentStream.setFont( font, 12 );
		contentStream.moveTextPositionByAmount( 100, 700 );
		contentStream.drawString( data );
		contentStream.endText();
		
		contentStream.close();

		// Save the results and ensure that the document is properly closed:
		document.save( "/home/ameya/Desktop/Bill.pdf");
		document.close();
	}*/
	
	private List<Orders> getConsolidatedOrders(List<Orders> orders) throws CloneNotSupportedException {
		HashMap<Long, Orders> consolidatedMap = new HashMap<>();
		for (Orders order : orders) {
		long key = order.getOrderItemID();
			if (consolidatedMap.containsKey(key)) {
				Orders l_order = consolidatedMap.get(key);
				l_order.setQuantity(l_order.getQuantity() + order.getQuantity());
				l_order.addAmounts(order);
			} 
			else {
				consolidatedMap.put(key, (Orders) order.clone());
			}
		}
		return consolidatedMap.values().stream().collect(Collectors.toList());
	}
}
