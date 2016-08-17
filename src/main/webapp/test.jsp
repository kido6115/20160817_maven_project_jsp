<%-- <%@ page import="java.io.*"%>
<%!private static final int BUFSIZE = 2048;

	/** * 
	 Sends a file to the ServletResponse output stream. Typically * you want the browser to receive a different name than the * 
	 name the file has been saved in your local database, since * your local names need to be unique. * * @param request The request * 
	 @param response The response * @param filename The name of the file you want to download. * @param original_filename The name the
	 browser should receive. */

	private void doDownload(HttpServletRequest request,
			HttpServletResponse response, String filename,
			String original_filename) throws IOException {

		File f = new File(filename);
		int length = 0;
		ServletOutputStream op = response.getOutputStream();
		ServletContext context = getServletConfig().getServletContext();
		String mimetype = context.getMimeType(filename);
		// // Set the response and go! // // 
		response.setContentType((mimetype != null) ? mimetype
				: "application/octet-stream");
		response.setContentLength((int) f.length());
		response.setHeader("Content-Disposition", "attachment; filename=\""
				+ original_filename + "\"");
		// // Stream to the requester. //
		byte[] bbuf = new byte[BUFSIZE];
		DataInputStream in = new DataInputStream(new FileInputStream(f));
		while ((in != null) && ((length = in.read(bbuf)) != -1)) {
			op.write(bbuf, 0, length);
		}
		in.close();
		op.flush();
		op.close();
	}%>
<%
	String original_filename = request.getParameter("file");

	// Security Isuue: User can type file=../WEB-INF/web.xml 
	//String filename = application.getRealPath(original_filename);
	boolean error = false;
	if (original_filename != null && !"".equals(original_filename)
			&& !original_filename.startsWith("../")) {
		String filename = "C:/" + original_filename;
	/*	String filename = application.getRealPath("/")
				+ "WEB-INF/export/" + original_filename;*/
		File file = new File(filename);
		if (file.exists()) {
			doDownload(request, response, filename, original_filename);
			// delete the file after download 
			boolean deleted = file.delete();
			System.out.println("File " + original_filename
					+ " deleted: " + deleted);
		} else {
			error = true;
		}
	} else {
		error = true;
	}
	if (error) {
		response.setContentType("text/html; charset=BIG-5");
		out.println("File not found: " + original_filename);
	}
%>

 --%>
 
 
 <%@ page import="java.io.*"%>
<%!private static final int BUFSIZE = 2048;

	/** * 
	 Sends a file to the ServletResponse output stream. Typically * you want the browser to receive a different name than the * 
	 name the file has been saved in your local database, since * your local names need to be unique. * * @param request The request * 
	 @param response The response * @param filename The name of the file you want to download. * @param original_filename The name the
	 browser should receive. */

	private void doDownload(HttpServletRequest request,
			HttpServletResponse response, String filename,
			String original_filename) throws IOException {

		File f = new File(filename);
		int length = 0;
		ServletOutputStream op = response.getOutputStream();
		ServletContext context = getServletConfig().getServletContext();
		String mimetype = context.getMimeType(filename);
		// // Set the response and go! // // 
		response.setContentType((mimetype != null) ? mimetype
				: "application/octet-stream");
		response.setContentLength((int) f.length());
		response.setHeader("Content-Disposition", "attachment; filename=\""
				+ original_filename + "\"");
		// // Stream to the requester. //
		byte[] bbuf = new byte[BUFSIZE];
		DataInputStream in = new DataInputStream(new FileInputStream(f));
		while ((in != null) && ((length = in.read(bbuf)) != -1)) {
			op.write(bbuf, 0, length);
		}
		in.close();
		op.flush();
		op.close();
	}%>
<%
	String original_filename = request.getParameter("file");

	// Security Isuue: User can type file=../WEB-INF/web.xml 
	//String filename = application.getRealPath(original_filename);
	boolean error = false;
	if (original_filename != null && !"".equals(original_filename)
			&& !original_filename.startsWith("../")) {
		String filename = "C:/" + original_filename;
	/*	String filename = application.getRealPath("/")
				+ "WEB-INF/export/" + original_filename;*/
		File file = new File(filename);
		if (file.exists()) {
			doDownload(request, response, filename, original_filename);
			// delete the file after download 
			if(!file.getName().equals("Example.xls")){
			boolean deleted = file.delete();
			System.out.println("File " + original_filename
					+ " deleted: " + deleted);
			}
		} else {
			error = true;
		}
	} else {
		error = true;
	}
	if (error) {
		response.setContentType("text/html; charset=BIG-5");
		out.println("File not found: " + original_filename);
	}
%>

 