package action;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mail.GoogleMailAuthenticator;
import svc.isRightUserService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberFindPasswdProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		System.out.println("MemberFindPasswdProAction");
		try {
			request.setCharacterEncoding("UTF-8");
			
			String member_id = request.getParameter("member_id");
			String member_email = request.getParameter("member_email");
			
			MemberBean member = new MemberBean();
			member.setMember_id(member_id);
			member.setMember_email(member_email);
			
			isRightUserService service = new isRightUserService();
			boolean isExistUser = service.passwdFind(member);
//			System.out.println(isExistUser);
			
//			if(isExistUser) {
//				String content = "임시 비밀번호로 로그인 한 후, 회원정보 수정에서 비밀번호 변경하세요.";
//				content += "<hr>";
//				content += "<table>";
//				content += "<tr>";
//				content += "	<th>아이디</th>";
//				content += "	<td>" + member_id + "</td>";
//				content += "</tr>";
//				content += "<tr>";
//				content += "	<th>임시비밀번호</th>";
////				content += "	<td>" + imsiPW.toString() + "</td>";
//				content += "</tr>";
//				content += "</table>";
//				
//				
//				String mailServer = "smtp.gmail.com";
//				Properties props = new Properties();
//				props.put("mail.smtp.host", mailServer);
//				props.put("mail.smtp.auth", true);
//				Authenticator myAuth = new GoogleMailAuthenticator();
//				Session mailSession = Session.getDefaultInstance(props, myAuth);
//				
//				Address resceiverAddress = new InternetAddress(member.getMember_email());
//				
//				// 5. 서버 정보와 인증 정보를 포함하는 javax.mail.MimeMessage 객체 생성
//				// => 파라미터 : javax.mail.Session 객체 전달
//				// => 생성된 MimeMessage 객체를 통해 전송할 메일에 대한 정보 생성
//				Message mailMessage = new MimeMessage(mailSession);
//				
//				// 6. 전송할 메일에 대한 정보 설정
//				// 1) 발신자 정보 설정을 위한 InternetAddress 객체 생성
//				// => 단, 상용 메일 서버(구글, 네이버 등)의 경우 스팸 메일 정책으로 인해 발신자 주소 변경 불가
//				// => 파라미터 : 발신자 주소, 발신자 이름
//				mailMessage.setRecipients(Message.RecipientType.TO, resceiverAddress);
//				mailMessage.setFrom(new InternetAddress("yongs1041@naver.com"));
//				// 2) 수신자 정보 설정을 위한 InternetAddress 객체 생성
//				// => 파라미터 : 수신자 주소
////				Address receiverAddress = new InternetAddress(receiver);
//				// 3) Message 객체를 통해 전송할 메일에 대한 내용 정보 설정
//				// 3-1) 메일 헤더 정보 설정
////				mailMessage.setHeader("content-type", "text/html; charset=UTF-8");
//				// 3-2) 발신자 정보 설정
////				mailMessage.setFrom(senderAddress);
//				// 3-3) 수신자 정보 설정
//				// => addRecipient() 메서드를 사용하여 수신자 정보 설정
//				//    파라미터 : 수신 타입(기본 수신자이므로 TO 상수 활용), 수신자 정보 객체
////				mailMessage.addRecipient(RecipientType.TO, receiverAddress);
//				// 3-4) 메일 제목 설정
//				mailMessage.setSubject("[SmallBox] 아이디 / 비밀번호 입니다");
//				// 3-5) 메일 본문 설정
//				mailMessage.setContent(content, "text/html; charset=UTF-8");
//				// 3-6) 메일 전송 날짜 및 시각 정보 설정
//				//      => java.util.Date 객체 생성을 통해 시스템 시각 정보 사용
//				mailMessage.setSentDate(new Date());
//				
//				// 7. 메일 전송
//				// javax.mail.Transport 클래스의 static 메서드 send() 호출
//				// => 파라미터 : Message 객체
//				Transport.send(mailMessage);
//				
//				
//			}
			
		
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return forward;
	}

}
