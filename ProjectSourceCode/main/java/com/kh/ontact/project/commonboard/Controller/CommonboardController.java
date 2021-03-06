package com.kh.ontact.project.commonboard.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ontact.alert.model.dto.AlertDto;
import com.kh.ontact.alert.model.service.AlertService;
import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.commonboard.model.dto.CommonboardDto;
import com.kh.ontact.project.commonboard.model.service.CommonboardService;
import com.kh.ontact.project.files.model.dto.FilesDto;
import com.kh.ontact.projectMember.model.dto.ProjectMemberDto;
import com.kh.ontact.projectMember.model.service.ProjectMemberService;
import com.kh.ontact.users.model.dto.CustomUserDetails;

@RequestMapping("/project/commonboard")
@Controller
public class CommonboardController {
	@Autowired
	CommonboardService commonboardservice;
	//혜원 알림기능 추가
	@Autowired
	ProjectMemberService pmService;
	@Autowired
	AlertService alertService;
	
	// 메인화면 이동
		@RequestMapping("/cboard")
		public ModelAndView getFileboard() {
			ModelAndView mv = new ModelAndView();
			String pno = "22";
			try {
				mv.addObject("blist", commonboardservice.getCommonboard());
				mv.addObject("file", commonboardservice.getFileboard(pno));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			mv.setViewName("project/project");
			return mv;
		}
		
		@RequestMapping("/ins")
		public ModelAndView insertCommonboard(ModelAndView mv, FilesDto file, BoardAllDto alldto, CommonboardDto comdto) {
			CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String uno = user.getUno();
			String uname=user.getUname();
			String pno = alldto.getPno();
			alldto.setUno(uno);
			alldto.setUname(uname);
			alldto.setBtype(1);
			 try {
				commonboardservice.insertCommonboard(file, alldto, comdto);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			mv.addObject("pno", pno);
			mv.setViewName("redirect:/project/pjdetail");
			return mv;
//			return "redirect:/project/commonboard/cboard";
		}
		
		@RequestMapping("/del")
		public ModelAndView deleteCommonboard(ModelAndView mv, @RequestParam int bno, @RequestParam String pno) {
			int rs =0; 
			try {
				rs = commonboardservice.deleteCommonboard(bno);
			} catch (Exception e) {
				e.printStackTrace();
			}
			 
			mv.addObject("pno", pno);
			mv.addObject("deleteResult", rs);
			mv.setViewName("redirect:/project/pjdetail");
			return mv;
		}
}
