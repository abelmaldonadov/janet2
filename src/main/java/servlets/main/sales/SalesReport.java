/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.main.sales;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfWriter;
import java.awt.Color;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author abelm
 */
public class SalesReport extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/pdf");
        
        try (OutputStream out = response.getOutputStream()) {
            Document pdf = new Document();
            PdfWriter.getInstance(pdf, out);
            pdf.open();
            
            // Generar header del reporte
            Paragraph header = new Paragraph();
            Font fontHeader = new Font(Font.HELVETICA, 10, Font.NORMAL, Color.GRAY);
            header.add(new Phrase("2021/09/24\n\n", fontHeader));
            header.setAlignment(Element.ALIGN_RIGHT);
            pdf.add(header);
            
            // Generar titulo del reporte
            Paragraph title = new Paragraph();
            Font fontTitle = new Font(Font.HELVETICA, 18, Font.BOLD, Color.ORANGE);
            title.add(new Phrase("Reporte de ventas\n\n\n", fontTitle));
            title.setAlignment(Element.ALIGN_CENTER);
            pdf.add(title);
            
            // Generar footer del reporte
            
            
            pdf.close();
        } catch (DocumentException ex) {
            System.out.println(ex.getMessage());
            response.sendError(405);
        }
    }
}
