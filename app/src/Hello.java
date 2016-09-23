import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Hello extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res)
		
		throws IOException, ServletException {
		
		PrintWriter out = res.getWriter();
		out.println("hello keisuke you've done!!");
	}
}