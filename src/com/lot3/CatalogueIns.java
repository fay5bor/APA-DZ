package com.lot3;

import java.io.IOException;
import java.io.StringReader;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lot3.beans.Entreprise;
import com.lot3.beans.Institution;
import com.lot3.beans.Ressource;
import com.lot3.util.CompteManager;
import com.lot3.util.EntrepriseManager;
import com.lot3.util.InstitutionManager;

import java.io.StringWriter;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;
import javax.xml.transform.*;
import javax.xml.transform.dom.*;
import javax.xml.transform.stream.*;
@WebServlet("/CatalogueIns")
@MultipartConfig
public class CatalogueIns extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
    public CatalogueIns() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Institution> liste=new InstitutionManager().getIns();
		request.setAttribute("institutions", liste);
		List<Entreprise> liste1=new EntrepriseManager().getEnt();
		request.setAttribute("entreprises", liste1);
		List<Ressource> res=new InstitutionManager().getRes();
		request.setAttribute("ressources", res);
		this.getServletContext().getRequestDispatcher("/WEB-INF/catalogueIns.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		if(request.getHeader("Ins-Details") != null) {
			String id=request.getParameter("id");
			String idCmp=request.getParameter("idCmp");
			String type=request.getParameter("type");
			
			if(type.equals("ins")) {
				InstitutionManager insManager=new InstitutionManager();
				Institution ins=insManager.getIns(id);
				List<String> nomRes=insManager.getResIns(idCmp);
				String xmlContent="";
				try
		        {
		            JAXBContext jaxbContext = JAXBContext.newInstance(Institution.class);
		            Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
		            jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
		            StringWriter sw = new StringWriter();
		            jaxbMarshaller.marshal(ins, sw);
		            xmlContent = sw.toString();
		            
		            DocumentBuilderFactory dbf =DocumentBuilderFactory.newInstance();
	                DocumentBuilder db = dbf.newDocumentBuilder();
	                InputSource is=new InputSource();
	                is.setCharacterStream(new StringReader(xmlContent));
	                Document doc = db.parse(is);
	                
	                Element root = doc.getDocumentElement();
	                Element ressources = doc.createElement("ressources");
	                root.appendChild(ressources);
	                
	                for (String nomR: nomRes) {
	                	Element res = doc.createElement("ressource");
	                    res.appendChild(doc.createTextNode(nomR));
	                    ressources.appendChild(res);
	                }
	                DOMSource domSource = new DOMSource(doc);
	                StringWriter writer = new StringWriter();
	                StreamResult result = new StreamResult(writer);
	                TransformerFactory tf = TransformerFactory.newInstance();
	                Transformer transformer = tf.newTransformer();
	                transformer.transform(domSource, result);
	                xmlContent= writer.toString();
	                System.out.println(xmlContent);
		          
		        } catch (Exception e) {
		            e.printStackTrace();
		            response.setStatus(HttpServletResponse.SC_NO_CONTENT);
		        }
				response.setContentType("text/xml");
				response.getWriter().write(xmlContent);
			}
			else {
				EntrepriseManager insManager=new EntrepriseManager();
				Entreprise ent=insManager.getEnt(id);
				List<String> nomRes=insManager.getResEnt(idCmp);
				String xmlContent="";
				try
		        {
		            JAXBContext jaxbContext = JAXBContext.newInstance(Entreprise.class);
		            Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
		            jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
		            StringWriter sw = new StringWriter();
		            jaxbMarshaller.marshal(ent, sw);
		            xmlContent = sw.toString();
		            
		            DocumentBuilderFactory dbf =DocumentBuilderFactory.newInstance();
	                DocumentBuilder db = dbf.newDocumentBuilder();
	                InputSource is=new InputSource();
	                is.setCharacterStream(new StringReader(xmlContent));
	                Document doc = db.parse(is);
	                
	                Element root = doc.getDocumentElement();
	                Element ressources = doc.createElement("ressources");
	                root.appendChild(ressources);
	                
	                for (String nomR: nomRes) {
	                	Element res = doc.createElement("ressource");
	                    res.appendChild(doc.createTextNode(nomR));
	                    ressources.appendChild(res);
	                }
	                DOMSource domSource = new DOMSource(doc);
	                StringWriter writer = new StringWriter();
	                StreamResult result = new StreamResult(writer);
	                TransformerFactory tf = TransformerFactory.newInstance();
	                Transformer transformer = tf.newTransformer();
	                transformer.transform(domSource, result);
	                xmlContent= writer.toString();
	                System.out.println(xmlContent);
		          
		        } catch (Exception e) {
		            e.printStackTrace();
		            response.setStatus(HttpServletResponse.SC_NO_CONTENT);
		        }
				response.setContentType("text/xml");
				response.getWriter().write(xmlContent);
			}
		}else { /* search */
			String searchKey=request.getParameter("searchKey");
			String resUsed=request.getParameter("resUsed");
			String insPublique=request.getParameter("insPublique");
			String insPrive=request.getParameter("insPrive");
			String entreprise=request.getParameter("entreprise");
			String typeIns=null;
			List<Institution> listeIns=null;
			List<Entreprise> listeEnt=null;
			
			if(!(insPublique==null ^ insPrive==null)) typeIns="";
			else if (insPublique!=null) typeIns="publique";
			else typeIns="privée";
			
			if(entreprise==null && (insPublique!=null || insPrive!=null )) { //éliminer les ents
				listeIns=new InstitutionManager().getIns(searchKey, typeIns, resUsed);
			}
			else if(entreprise!=null && (insPublique==null || insPrive==null )) { //éliminer les ins
				listeEnt=new EntrepriseManager().getEnt(searchKey, resUsed);
			}else {
				listeIns=new InstitutionManager().getIns(searchKey, typeIns, resUsed);
				listeEnt=new EntrepriseManager().getEnt(searchKey, resUsed);
			}
			request.setAttribute("institutions", listeIns);
			request.setAttribute("entreprises", listeEnt);
			List<Ressource> res=new InstitutionManager().getRes();
			request.setAttribute("ressources", res);
			this.getServletContext().getRequestDispatcher("/WEB-INF/catalogueIns.jsp").forward(request, response);			
		}		
	}

}
