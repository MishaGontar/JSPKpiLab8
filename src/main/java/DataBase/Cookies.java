package DataBase;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class Cookies {
        public static String getCookieByName(HttpServletRequest request, String name){
            Cookie[] cookies = request.getCookies();
            for(Cookie cookie:cookies){
                if(cookie.getName().equals(name)){
                    return cookie.getName();
                }
            }
            return null;
        }

}
