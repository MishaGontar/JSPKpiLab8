package DataBase;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Cookies {
        public static Cookie getCookieByName(HttpServletRequest request, String name){
            Cookie[] cookies = request.getCookies();
            for(Cookie cookie:cookies){
                if(cookie.getName().equals(name)){
                    return cookie;
                }
            }
            return null;
        }
        public static void setCookie(HttpServletResponse response , String name, String value){
            Cookie cookie = new Cookie(name,value);
            cookie.setMaxAge(60*60);
            response.addCookie(cookie);
        }
        public static void deleteCookieByName(HttpServletResponse response , String name){
            Cookie cookie = new Cookie(name,"");
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
}
