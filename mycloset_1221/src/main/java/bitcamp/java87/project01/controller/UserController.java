package bitcamp.java87.project01.controller;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.MultipartResolver;

import bitcamp.java87.project01.domain.Page;
import bitcamp.java87.project01.domain.Search;
import bitcamp.java87.project01.domain.User;
import bitcamp.java87.project01.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

  /// Field
  @Autowired
  @Qualifier("userServiceImpl")
  private UserService userService;

  public UserController() {
    System.out.println(this.getClass());
  }

  @Value("#{commonProperties['pageUnit']}")
  int pageUnit;

  @Value("#{commonProperties['pageSize']}")
  int pageSize;


  @RequestMapping(value = "addUser", method = RequestMethod.GET)
  public String addUser() throws Exception {

    System.out.println("[userController] addUser ::: GET");

    return "redirect:/user/addUserView.jsp";
  }

  
  @RequestMapping(value = "addUser", method = RequestMethod.POST)
  public String addUser(@ModelAttribute("user") User user, HttpSession session) throws Exception {

    System.out.println("[userController] addUser ::: POST");
    
    // Business Logic
    user.setPhot_path("images.png");
    userService.addUser(user);

    if (user != null) {
      session.setAttribute("user", user);
    }
    
    return "redirect:/main/main.jsp";
  }

  /* email(userId)로 get*/
  @RequestMapping(value = "getUser", method = RequestMethod.GET)
  public String getUser(@RequestParam("userId") String userId, Model model) throws Exception {

    System.out.println("[userController] getUser ::: GET");
    
    // Business Logic
    User user = userService.getUser(userId);
    model.addAttribute("user", user);

    return "forward:/user/getUser.jsp";
  }

  /* user_no로 get*/
  @RequestMapping(value = "getUserbyNo", method = RequestMethod.GET)
  public String getUserbyNo(@RequestParam("user_no") int user_no, Model model) throws Exception {

    System.out.println("[userController] getUserbyNo ::: GET");

    return "forward:/user/getUser.jsp";
  }

  /* 개인정보수정 */
  @RequestMapping(value = "updateUser", method = RequestMethod.POST)
  public @ResponseBody User updateUser(MultipartHttpServletRequest req, HttpSession session) throws Exception {

    System.out.println("[userController] updateUser ::: POST");
    
    MultipartFile file = req.getFile("testFile");
    System.out.println("[userController] updateUser ::: POST ::: MultipartFile file ::: "+file);

    User user = new User();

    if (file.getSize() != 0) {
      System.out.println("[userController] updateUser ::: POST ::: file,getSize() != 0 조건문");
      /* 개인 프로젝트 폴더 절대 경로 */
      String path = "C:\\git-personal\\mycloset_project\\mycloset_1221\\src\\main\\webapp\\header\\upload\\" + file.getOriginalFilename();
      file.transferTo(new File(path));
    }

    if (file.getOriginalFilename() == "") {
      if (req.getParameter("email") != null)
        user.setPhot_path(userService.getUser(req.getParameter("email")).getPhot_path());
    } else {
      user.setPhot_path(file.getOriginalFilename());
    }

    user.setEmail(req.getParameter("email"));
    user.setPwd(req.getParameter("pwd"));
    user.setNick(req.getParameter("nick"));

    session.setAttribute("user", user);
    userService.updateUser(user);

    return user;
  }

  @RequestMapping(value = "faceupdateUser", method = RequestMethod.POST)
  public @ResponseBody User faceupdateUser(MultipartHttpServletRequest req, HttpSession session) throws Exception {

    System.out.println("[userController] faceupdateUser ::: POST ");
    
    MultipartFile file = req.getFile("testFile");
    User user = new User();
    
    if (file.getSize() != 0) {
      System.out.println("[userController] faceupdateUser ::: POST ::: file,getSize() != 0 조건문");
      /* 개인 프로젝트 폴더 절대 경로 */
      String path = "C:\\git-personal\\mycloset_project\\mycloset_1221\\src\\main\\webapp\\header\\upload\\" + file.getOriginalFilename();
      file.transferTo(new File(path));
    }
    
    if (file.getOriginalFilename() == "") {
      if (req.getParameter("email") != null)
        user.setPhot_path(userService.getUser(req.getParameter("email")).getPhot_path());
    } else {
      user.setPhot_path(file.getOriginalFilename());
    }
    user.setEmail(req.getParameter("email"));
    user.setPwd(req.getParameter("pwd"));
    user.setNick(req.getParameter("nick"));

    session.setAttribute("faceUser", user);
    userService.updateUser(user);

    return user;
  }

  @RequestMapping(value = "login", method = RequestMethod.GET)
  public String login(@RequestParam("email") String email, @RequestParam("name") String name) throws Exception {

    System.out.println("[userController] ::: logon ::: GET ");
    System.out.println("[userController] ::: logon::: parameter:email :  "+email);
    System.out.println("[userController] ::: logon::: parameter:name :  "+name);
    
    return "redirect:/index.jsp";
  }

  
  @RequestMapping(value = "login", method = RequestMethod.POST)
  public @ResponseBody User login(String email, String pwd, HttpSession session) throws Exception {
    System.out.println("로그인안돼");
    User user = userService.getUser(email);
    if (user.getPwd().trim().equals(pwd.trim())) {
      System.out.println("세션");
      session.setAttribute("user", user);
    }
    return user;
  }

  @RequestMapping(value = "loginCheck", method = RequestMethod.POST)
  public @ResponseBody User loginCheck(String email) throws Exception {
    System.out.println("체크메서드:" + email);
    User user = userService.getUser(email);

    return user;
  }

  @RequestMapping(value = "facebook", method = RequestMethod.POST)
  public @ResponseBody User facebook(String email, HttpSession session) throws Exception {

    System.out.println("email:" + email);
    User user = userService.getUser(email);
    System.out.println("로그인 세션만들기");

    if (user != null) {
      session.setAttribute("faceUser", user);
    }
    return user;
  }

  @RequestMapping(value = "fbaddUser", method = RequestMethod.POST)
  public @ResponseBody void fbaddUser(String nick, String email, String pwd, String phot_path, HttpSession session)
      throws Exception {
    User user = new User();
    user.setNick(nick);
    user.setEmail(email);
    user.setPwd(pwd);
    user.setPhot_path(phot_path);

    System.out.println("add세션만들기" + user);
    userService.addUser(user);

    if (user != null) {
      session.setAttribute("user", user);
    }
  }

  // @RequestMapping("/logout.do")
  /*
   * @RequestMapping( value="logout", method=RequestMethod.GET ) public String
   * logout(HttpSession session ) throws Exception{
   * 
   * System.out.println("/user/logout : POST");
   * 
   * session.invalidate(); session.invalidate();
   * 
   * return "redirect:..index.jsp"; }
   */

  // @RequestMapping("/checkDuplication.do")
  @RequestMapping(value = "checkDuplication", method = RequestMethod.POST)
  public String checkDuplication(@RequestParam("email") String email, Model model) throws Exception {

    System.out.println("여기 유저컨트롤러" + "/user/checkDuplication : POST");
    // Business Logic
    boolean result = userService.checkDuplication(email);
    model.addAttribute("result", new Boolean(result));
    model.addAttribute("email", email);

    return "forward:/user/checkDuplication.jsp";
  }

  // @RequestMapping("/listUser.do")
  @RequestMapping(value = "listUser")
  public String listUser(@ModelAttribute("search") Search search, Model model, HttpServletRequest request)
      throws Exception {

    System.out.println("/user/listUser : GET / POST");

    if (search.getCurrentPage() == 0) {
      search.setCurrentPage(1);
    }
    search.setPageSize(pageSize);

    Map<String, Object> map = userService.getUserList(search);

    Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
        pageSize);
    System.out.println(resultPage);

    model.addAttribute("list", map.get("list"));
    model.addAttribute("resultPage", resultPage);
    model.addAttribute("search", search);

    return "forward:/user/listUser.jsp";
  }
}