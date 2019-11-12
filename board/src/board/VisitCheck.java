package board;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class VisitCheck
 *
 */
@WebListener
public class VisitCheck implements HttpSessionListener {

	int nowUser=0;
	
    /**
     * Default constructor. 
     */
    public VisitCheck() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent arg0)  { 
         // TODO Auto-generated method stub
    	nowUser++;
    	arg0.getSession().getServletContext().setAttribute("nowUser", nowUser);
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent arg0)  { 
         // TODO Auto-generated method stub
    	nowUser--;
    	arg0.getSession().getServletContext().setAttribute("nowUser", nowUser);
    }
	
}
