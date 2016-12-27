package bitcamp.java87.project01.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import bitcamp.java87.project01.domain.User;
import bitcamp.java87.project01.domain.Wardrobe;
import bitcamp.java87.project01.service.UserService;
import bitcamp.java87.project01.service.WardrobeService;

@Controller
@RequestMapping("/wardrobe/*")
public class WardrobeController {

  /// Field
  @Autowired
  @Qualifier("wardrobeServiceImpl")
  private WardrobeService wardrobeService;
  @Autowired
  @Qualifier("userServiceImpl")
  private UserService userService;

  /// Constructor
  public WardrobeController() {
    System.out.println(this.getClass());
  }


  // 옷장 추가시 이름 유효성 체크
  @RequestMapping(value = "wardrobeValidate")
  public @ResponseBody Wardrobe wardrobeValidate(int user_no, String cls_name) throws Exception {

    System.out.println("[wardrobeController] wardrobeValidate");

    // Business Logic
    Wardrobe wardrobe = new Wardrobe();
    wardrobe.setUser_no(user_no);
    wardrobe.setCls_name(cls_name);
    
    wardrobe = wardrobeService.getWardrobe(wardrobe);
    System.out.println("[wardrobeController] wardrobeValidate ::: domain ::: " + wardrobe);

    return wardrobe;
  }


  // 옷장 추가
  @RequestMapping(value = "addWardrobe", method = RequestMethod.POST)
  public @ResponseBody Wardrobe addWardrobe(int user_no, String cls_name) throws Exception {

    System.out.println("[wardrobeController] addWardrobe ::: POST ");

    // Business Logic
    Wardrobe wardrobe = new Wardrobe();
    wardrobe.setUser_no(user_no);
    wardrobe.setCls_name(cls_name.trim());

    wardrobeService.addWardrobe(wardrobe);

    System.out.println("[wardrobeController] addWardrobe ::: domain::: " + wardrobe);

    return wardrobe;
  }


  // 옷장 목록 조회
  @RequestMapping(value = "getWardrobeList", method = RequestMethod.GET)
  public String listWardrobe(@RequestParam int user_no, Model model) throws Exception {

    System.out.println("[wardrobeController] ::: getWardrobeList ::: POST ");
    System.out.println("[wardrobeController] ::: getWardrobeList ::: parameter:user_no::: " + user_no);

    // Business Logic
    User user = userService.getUser(user_no);
    System.out.println("[wardrobeController] ::: getWardrobeList ::: domain:user ::: " + user);

    Map<String, Object> map = wardrobeService.getWardrobeList(user_no);

    model.addAttribute("cls_user", user);
    model.addAttribute("list", map.get("list"));

    return "forward:/wardrobe/myWardrobe.jsp";
  }
  
  
  // 옷장 이름 수정
  @RequestMapping(value = "updateWardrobe")
  public @ResponseBody Wardrobe updateWardrobe(int cls_no, String cls_name) throws Exception {

    System.out.println("[wardrobeController] ::: updateWardrobe ");
    System.out.println("[wardrobeController] ::: updateWardrobe ::: parameter:cls_no : "+cls_no);
    System.out.println("[wardrobeController] ::: updateWardrobe ::: parameter:cls_name : "+cls_name);
    
    // Business Logic
    Wardrobe wardrobe = wardrobeService.getWardrobe(cls_no);
    wardrobe.setCls_name(cls_name.trim());
    System.out.println("[wardrobeController] ::: updateWardrobe ::: domain ::: before : "+wardrobe);
    
    wardrobeService.updateWardrobe(wardrobe);
    System.out.println("[wardrobeController] ::: updateWardrobe ::: domain ::: after : "+wardrobe);
    
    return wardrobe;
  }
  
  
  // 옷장 삭제
  @RequestMapping(value = "deleteWardrobe")
  public @ResponseBody Wardrobe deleteWardrobe(int cls_no) throws Exception {
    
    System.out.println("[wardrobeController] ::: deleteWardrobe ");
    System.out.println("[wardrobeController] ::: deleteWardrobe ::: parameter:cls_no : "+cls_no);
    
    // Business Logic
    wardrobeService.deleteWardrobe(cls_no);
    Wardrobe wardrobe = new Wardrobe();
    wardrobe.setCls_no(cls_no);
    
    return wardrobe;
  }
  

}
