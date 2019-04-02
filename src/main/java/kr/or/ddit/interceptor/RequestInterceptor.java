package kr.or.ddit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.or.ddit.member.model.MemberVo;

public class RequestInterceptor extends HandlerInterceptorAdapter{
	
	private Logger logger = LoggerFactory.getLogger(RequestInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		boolean result = false;
        String webRoot = request.getContextPath();
         
        try {
        	MemberVo mVO = (MemberVo) request.getSession().getAttribute("SESSION_MEMBERVO");
        	
        	logger.debug("Interceptor_mVO : {}", mVO);
        	
            if(mVO == null ){
                if(isAjaxRequest(request)){
                    response.sendError(400);
                    return false;
                }else{
                    response.sendRedirect(webRoot + "/login");
                    //request.getRequestDispatcher(webRoot + "/login").forward(request, response);
                    result =  false;
                }
            }else{
            	request.getSession().setAttribute("SESSION_MEMBERVO", mVO);
                result =  true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            return false;
        }
        return result;


	}
	
	//ajax 요청인지 판별
	private boolean isAjaxRequest(HttpServletRequest req) {
        String header = req.getHeader("AJAX");
        if ("true".equals(header)){
         return true;
        }else{
         return false;
        }
    }

}
