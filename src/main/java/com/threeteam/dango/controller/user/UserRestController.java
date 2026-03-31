package com.threeteam.dango.controller.user;

import java.io.File;
import java.io.IOException;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.threeteam.dango.domain.user.UserVO;
import com.threeteam.dango.service.user.UserService;

@RestController
@RequestMapping("/user*")
public class UserRestController {
	@Autowired
	private UserService userService;
	
	@PostMapping("/upload")
    public String upload(@RequestParam("upload") MultipartFile file) throws IOException {
        String userProfile;
        String path = "C:/upload";
        String uuid = UUID.randomUUID().toString();
        userProfile = uuid + "_" + file.getOriginalFilename();
        File fullPath = new File(path, userProfile);
        file.transferTo(fullPath);

        return userProfile;
    }
	// 실행 시 큰 문제는 없지만 확장 시, 위험 할 수도 있기에 주석 처리된 display 메소드를 사용해야하지만 아직 미완성.
    @GetMapping("/display")
    public byte[] display(@RequestParam("userProfile") String userProfile) throws IOException{
       return FileCopyUtils.copyToByteArray(new File("C:/upload", userProfile));
    }
    /* undefined 뜰 가능성이 있기에 아래 주석으로 보완해 두긴 하였지만 실 서비스 사용시는 아직 미흡
    @GetMapping("/display")
    public byte[] display(@RequestParam("userProfile") String userProfile) throws IOException {
        if(userProfile == null || userProfile.equals("undefined") || userProfile.equals("")) {
            userProfile = "default.png";
        }
        File file = new File("C:/upload", userProfile);
        if(!file.exists()) {
            file = new File("C:/upload", "default.png");
        }
        return FileCopyUtils.copyToByteArray(file);
    }
    */
    @GetMapping(value="/idCheck")
    public String duplicateCheck(@RequestParam("userId") String userId) {
    	if(userService.countUserId(userId) == 0)
    		return "success";
    	return "fail";
    }
    
    @PostMapping(value="/restLogin", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public String loginCheck(@RequestBody UserVO userVO, HttpServletRequest request) {
    	userVO = userService.login(userVO.getUserId(), userVO.getUserPw());
    	if(userVO != null) {
    		HttpSession session = request.getSession();
    		session.setAttribute("user", userVO);
    		return "success";
    	}
    	return "fail";
    }
}
