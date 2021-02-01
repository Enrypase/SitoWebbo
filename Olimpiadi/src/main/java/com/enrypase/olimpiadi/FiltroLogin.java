package com.enrypase.olimpiadi;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(filterName = "FiltroLogin", urlPatterns = {"/Log", "/Modifica", "/log.jsp"})
public class FiltroLogin implements Filter {
    
    private static final boolean debug = true;

    private FilterConfig filterConfig = null;
    
    public FiltroLogin() {
    }    
    
    private void doBeforeProcessing(ServletRequest request, ServletResponse response) throws IOException, ServletException {
        if (debug) {
            log("FiltroLogin:DoBeforeProcessing");
        }
    }    
    
    private void doAfterProcessing(ServletRequest request, ServletResponse response) throws IOException, ServletException {
        if (debug) {
            log("FiltroLogin:DoAfterProcessing");
        }
    }
    
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
         
        if (debug) {
            log("FiltroLogin:doFilter()");
        }
        
        doBeforeProcessing(request, response);
        
        try{
            HttpServletRequest richiesta = (HttpServletRequest) request;
            HttpSession sessione = richiesta.getSession();

            HttpServletResponse risposta = (HttpServletResponse) response;

            if(sessione.getAttribute("logged").equals("true")){
                System.out.println("utente loggato");
                chain.doFilter(request, response);
            }
            else{
                //DA FARE con codici di errore
                System.out.println("utente non loggato");
                risposta.sendRedirect("login.html");
            }

            doAfterProcessing(request, response);
        }
        catch(Exception e){
            System.out.println("Non trovato");
            HttpServletResponse risposta = (HttpServletResponse) response;
            risposta.sendRedirect("index.html");
        }

    }

    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    public void destroy() {        
    }

    public void init(FilterConfig filterConfig) {        
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {                
                log("FiltroLogin:Initializing filter");
            }
        }
    }

    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("FiltroLogin()");
        }
        StringBuffer sb = new StringBuffer("FiltroLogin(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }
    
    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);        
        
        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);                
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");                
                pw.print(stackTrace);                
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }
    
    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }
    
    public void log(String msg) {
        filterConfig.getServletContext().log(msg);        
    }
    
}