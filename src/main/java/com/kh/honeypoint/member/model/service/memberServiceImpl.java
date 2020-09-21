package com.kh.honeypoint.member.model.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.honeypoint.member.model.dao.memberDao;
import com.kh.honeypoint.member.model.vo.InsertResImg;
import com.kh.honeypoint.member.model.vo.Member;
import com.kh.honeypoint.member.model.vo.Menu;
import com.kh.honeypoint.member.model.vo.Restaurant;


@Service("memService")
public class memberServiceImpl implements memberService {

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private memberDao mDao;
	
	@Override
	public Member loginMember(Member m) {
		
		Member loginUser = mDao.selectMember(m);
		
		if(!bcryptPasswordEncoder.matches(m.getmPwd(), loginUser.getmPwd())) {
			
			// 첫번째 인자로 로그인시 입력한 pwd 평문
			// 두번째 인자로 회원가입시 생성 된 pwd 다이제스트
			// match되지 않으면 비밀번호 틀린 것이므로 loginUser를 null처리
			loginUser = null;
			
		}
		return loginUser;
	}

	@Override
	public int insertMember1(Member m1) {
		return mDao.insertMember1(m1);
	}
	@Override
	public int insertMember2(Member m2) {
		return mDao.insertMember2(m2);
	}
	@Override
	public int insertMember3(Member m3) {
		String encPwd = bcryptPasswordEncoder.encode(m3.getmPwd());
		m3.setmPwd(encPwd);
		return mDao.insertMember3(m3);
	}

	@Override
	public int insertRes1(Restaurant r1) {
		return mDao.insertRes1(r1);
	}

	@Override
	public int insertRes2(Restaurant r2) {
		return mDao.insertRes2(r2);
	}

	@Override
	public int insertRes3(Restaurant r3) {
		String encPwd = bcryptPasswordEncoder.encode(r3.getmPwd());
		r3.setmPwd(encPwd);
		return mDao.insertRes3(r3);
	}
	
	
	@Override
	public int checkIdDup(String id) {
		return mDao.checkIdDup(id);
	}

	@Override
	public int insertResImg(int rNo, String originFileList, String renameFileList) {
		return mDao.insertResImg(rNo, originFileList,renameFileList);
	}

	@Override
	public int insertMenu(int rNo, String menuName, int menuPrice) {
		return mDao.insertMenu(rNo, menuName,menuPrice);
	}

	@Override
	public int selectRno() {
		return mDao.selectRno();
	}

	@Override
	public int loginHistory(Member loginUser) {
		return mDao.insertHistory(loginUser);
	}
	
	public String find_id(HttpServletResponse response, String email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = mDao.find_id(email);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}
	
	@Override
	public int find_id_email(String email) {
		return mDao.find_id_email(email);
	}
	
	@Override
	public Member find_id_email2(String email) {
		return mDao.find_id_email2(email);
	}
	
	@Override
	public void send_mail(Member mem, String div){
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "strange177a";
		String hostSMTPpwd = "honeypoint123";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "strange177a@naver.com";
		String fromName = "허니포인트";
		String subject = "";
		String msg = "";
		
		
		if(div.equals("find_pw")) {
			subject = "Honey Point 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += mem.getmId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += mem.getmPwd() + "</p></div>";
		}
		// 받는 사람 E-Mail 주소
		String mail = mem.getmEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	@Override
	public void find_pwd(HttpServletResponse response, String id, String email) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int result = mDao.checkIdDup(id);
		int result2 = mDao.find_id_email(email);
		Member mem = mDao.find_id_email2(email);
		System.out.println("멤버안에 잇니?"+mem);
		
		// 아이디가 없으면
		if(result == 0) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		// 가입에 사용한 이메일이 아니면
		else if(result2 == 0) {
			out.println("<script>");
			out.println("alert('잘못된 이메일 입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			mem.setmPwd(pw);
			// 비밀번호 변경
			mDao.update_pw(mem);
			// 비밀번호 변경 메일 발송
			send_mail(mem,"find_pw");
			
			out.println("<script>");
			out.println("alert('임시 비밀번호를 이메일로 발송했습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			out.close();
		}
		
	}


}

