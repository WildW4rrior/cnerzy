package com.pie.email;

import java.time.Year;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.pie.entity.Account;
import com.pie.entity.Requirement;
import com.pie.model.RegisterationBean;
import com.pie.util.Constants;
import com.pie.util.RequirementStatus;

public class EmailBody {

	public static String registrationEmailBody(Account account, String link) {
		return "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n"
				+ "<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\n"
				+ " <head>\n"
				+ "  <meta charset=\"UTF-8\">\n"
				+ "  <meta content=\"width=device-width, initial-scale=1\" name=\"viewport\">\n"
				+ "  <meta name=\"x-apple-disable-message-reformatting\">\n"
				+ "  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n"
				+ "  <meta content=\"telephone=no\" name=\"format-detection\">\n"
				+ "  <title>registration</title><!--[if (mso 16)]>\n"
				+ "    <style type=\"text/css\">\n"
				+ "    a {text-decoration: none;}\n"
				+ "    </style>\n"
				+ "    <![endif]--><!--[if gte mso 9]><style>sup { font-size: 100% !important; }</style><![endif]--><!--[if gte mso 9]>\n"
				+ "<xml>\n"
				+ "    <o:OfficeDocumentSettings>\n"
				+ "    <o:AllowPNG></o:AllowPNG>\n"
				+ "    <o:PixelsPerInch>96</o:PixelsPerInch>\n"
				+ "    </o:OfficeDocumentSettings>\n"
				+ "</xml>\n"
				+ "<![endif]-->\n"
				+ "  <style type=\"text/css\">\n"
				+ "#outlook a {\n"
				+ "	padding:0;\n"
				+ "}\n"
				+ ".es-button {\n"
				+ "	mso-style-priority:100!important;\n"
				+ "	text-decoration:none!important;\n"
				+ "}\n"
				+ "a[x-apple-data-detectors] {\n"
				+ "	color:inherit!important;\n"
				+ "	text-decoration:none!important;\n"
				+ "	font-size:inherit!important;\n"
				+ "	font-family:inherit!important;\n"
				+ "	font-weight:inherit!important;\n"
				+ "	line-height:inherit!important;\n"
				+ "}\n"
				+ ".es-desk-hidden {\n"
				+ "	display:none;\n"
				+ "	float:left;\n"
				+ "	overflow:hidden;\n"
				+ "	width:0;\n"
				+ "	max-height:0;\n"
				+ "	line-height:0;\n"
				+ "	mso-hide:all;\n"
				+ "}\n"
				+ "@media only screen and (max-width:600px) {p, ul li, ol li, a { line-height:150%!important } h1, h2, h3, h1 a, h2 a, h3 a { line-height:120%!important } h1 { font-size:30px!important; text-align:left } h2 { font-size:24px!important; text-align:left } h3 { font-size:20px!important; text-align:left } .es-header-body h1 a, .es-content-body h1 a, .es-footer-body h1 a { font-size:30px!important; text-align:left } .es-header-body h2 a, .es-content-body h2 a, .es-footer-body h2 a { font-size:24px!important; text-align:left } .es-header-body h3 a, .es-content-body h3 a, .es-footer-body h3 a { font-size:20px!important; text-align:left } .es-menu td a { font-size:14px!important } .es-header-body p, .es-header-body ul li, .es-header-body ol li, .es-header-body a { font-size:14px!important } .es-content-body p, .es-content-body ul li, .es-content-body ol li, .es-content-body a { font-size:14px!important } .es-footer-body p, .es-footer-body ul li, .es-footer-body ol li, .es-footer-body a { font-size:14px!important } .es-infoblock p, .es-infoblock ul li, .es-infoblock ol li, .es-infoblock a { font-size:12px!important } *[class=\"gmail-fix\"] { display:none!important } .es-m-txt-c, .es-m-txt-c h1, .es-m-txt-c h2, .es-m-txt-c h3 { text-align:center!important } .es-m-txt-r, .es-m-txt-r h1, .es-m-txt-r h2, .es-m-txt-r h3 { text-align:right!important } .es-m-txt-l, .es-m-txt-l h1, .es-m-txt-l h2, .es-m-txt-l h3 { text-align:left!important } .es-m-txt-r img, .es-m-txt-c img, .es-m-txt-l img { display:inline!important } .es-button-border { display:inline-block!important } a.es-button, button.es-button { font-size:18px!important; display:inline-block!important } .es-adaptive table, .es-left, .es-right { width:100%!important } .es-content table, .es-header table, .es-footer table, .es-content, .es-footer, .es-header { width:100%!important; max-width:600px!important } .es-adapt-td { display:block!important; width:100%!important } .adapt-img { width:100%!important; height:auto!important } .es-m-p0 { padding:0px!important } .es-m-p0r { padding-right:0px!important } .es-m-p0l { padding-left:0px!important } .es-m-p0t { padding-top:0px!important } .es-m-p0b { padding-bottom:0!important } .es-m-p20b { padding-bottom:20px!important } .es-mobile-hidden, .es-hidden { display:none!important } tr.es-desk-hidden, td.es-desk-hidden, table.es-desk-hidden { width:auto!important; overflow:visible!important; float:none!important; max-height:inherit!important; line-height:inherit!important } tr.es-desk-hidden { display:table-row!important } table.es-desk-hidden { display:table!important } td.es-desk-menu-hidden { display:table-cell!important } .es-menu td { width:1%!important } table.es-table-not-adapt, .esd-block-html table { width:auto!important } table.es-social { display:inline-block!important } table.es-social td { display:inline-block!important } .es-desk-hidden { display:table-row!important; width:auto!important; overflow:visible!important; max-height:inherit!important } }\n"
				+ "</style>\n"
				+ " </head>\n"
				+ " <body style=\"width:100%;font-family:verdana, geneva, sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;padding:0;Margin:0\">\n"
				+ "  <div class=\"es-wrapper-color\" style=\"background-color:#F6F6F6\"><!--[if gte mso 9]>\n"
				+ "			<v:background xmlns:v=\"urn:schemas-microsoft-com:vml\" fill=\"t\">\n"
				+ "				<v:fill type=\"tile\" color=\"#f6f6f6\"></v:fill>\n"
				+ "			</v:background>\n"
				+ "		<![endif]-->\n"
				+ "   <table class=\"es-wrapper\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;padding:0;Margin:0;width:100%;height:100%;background-repeat:repeat;background-position:center top;background-color:#F6F6F6\">\n"
				+ "     <tr>\n"
				+ "      <td valign=\"top\" style=\"padding:0;Margin:0\">\n"
				+ "       <table class=\"es-header\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%;background-color:transparent;background-repeat:repeat;background-position:center top\">\n"
				+ "         <tr>\n"
				+ "          <td align=\"center\" style=\"padding:0;Margin:0\">\n"
				+ "           <table class=\"es-header-body\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#ffffff\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#FFFFFF;width:600px\">\n"
				+ "             <tr>\n"
				+ "              <td align=\"left\" style=\"padding:0;Margin:0;padding-top:20px;padding-left:20px;padding-right:20px\">\n"
				+ "               <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
				+ "                 <tr>\n"
				+ "                  <td class=\"es-m-p0r\" valign=\"top\" align=\"center\" style=\"padding:0;Margin:0;width:560px\">\n"
				+ "                   <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
				+ "                     <tr>\n"
				+ "                      <td align=\"center\" style=\"padding:0;Margin:0;font-size:0px\"><img class=\"adapt-img\" src=\"https://xaftqg.stripocdn.email/content/guids/CABINET_7e7f7d76d9bdec1f6c29d3943f9c071799b3e3a5e93501e0cb0a98699bfa0511/images/yblogo.png\" alt style=\"display:block;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic\"></td>\n"
				+ "                     </tr>\n"
				+ "                   </table></td>\n"
				+ "                 </tr>\n"
				+ "               </table></td>\n"
				+ "             </tr>\n"
				+ "             <tr>\n"
				+ "              <td align=\"left\" style=\"padding:0;Margin:0;padding-left:20px;padding-right:20px;padding-top:40px\">\n"
				+ "               <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
				+ "                 <tr>\n"
				+ "                  <td align=\"center\" valign=\"top\" style=\"padding:0;Margin:0;width:560px\">\n"
				+ "                   <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
				+ "                     <tr>\n"
				+ "                      <td align=\"center\" class=\"es-m-txt-c\" style=\"padding:0;Margin:0\"><h1 style=\"Margin:0;line-height:36px;mso-line-height-rule:exactly;font-family:verdana, geneva, sans-serif;font-size:30px;font-style:normal;font-weight:normal;color:#666666\"><strong><span style=\"color:#283c8b\">Welcome, </span>"+account.getFirstName()+"</strong></h1></td>\n"
				+ "                     </tr>\n"
				+ "                   </table></td>\n"
				+ "                 </tr>\n"
				+ "               </table></td>\n"
				+ "             </tr>\n"
				+ "           </table></td>\n"
				+ "         </tr>\n"
				+ "       </table>\n"
				+ "       <table class=\"es-content\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%\">\n"
				+ "         <tr>\n"
				+ "          <td align=\"center\" style=\"padding:0;Margin:0\">\n"
				+ "           <table class=\"es-content-body\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#ffffff\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#FFFFFF;width:600px\">\n"
				+ "             <tr>\n"
				+ "              <td align=\"left\" style=\"padding:0;Margin:0;padding-top:20px;padding-left:20px;padding-right:20px\">\n"
				+ "               <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
				+ "                 <tr>\n"
				+ "                  <td valign=\"top\" align=\"center\" style=\"padding:0;Margin:0;width:560px\">\n"
				+ "                   <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
				+ "                     <tr>\n"
				+ "                      <td align=\"center\" style=\"padding:0;Margin:0\"><p style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:verdana, geneva, sans-serif;line-height:28px;color:#666666;font-size:14px\">Please take a minute to complete your registration by verifying your email address <strong><a target=\"_blank\" style=\"-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:none;color:#283c8b;font-size:14px\">"+account.getUserName()+"</a></strong>. Simply click the button below!</p></td>\n"
				+ "                     </tr>\n"
				+ "                   </table></td>\n"
				+ "                 </tr>\n"
				+ "               </table></td>\n"
				+ "             </tr>\n"
				+ "             <tr>\n"
				+ "              <td align=\"left\" style=\"padding:0;Margin:0;padding-left:20px;padding-right:20px;padding-top:30px\">\n"
				+ "               <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
				+ "                 <tr>\n"
				+ "                  <td valign=\"top\" align=\"center\" style=\"padding:0;Margin:0;width:560px\">\n"
				+ "                   <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
				+ "                     <tr>\n"
				+ "                      <td align=\"center\" bgcolor=\"#ffffff\" style=\"padding:0;Margin:0\"><!--[if mso]><a href="+link+">\n"
				+ "	<v:roundrect xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" esdevVmlButton href="+link+" \n"
				+ "                style=\"height:39px; v-text-anchor:middle; width:113px\" arcsize=\"50% \" strokecolor=\"#283c8b\" strokeweight=\"2px\" fillcolor=\"#283c8b\">\n"
				+ "		<w:anchorlock></w:anchorlock>\n"
				+ "		<center style='color:#ffffff; font-family:verdana, geneva, sans-serif; font-size:14px; font-weight:400; line-height:14px;  mso-text-raise:1px'>verify</center>\n"
				+ "	</v:roundrect></a>\n"
				+ "<![endif]--><!--[if !mso]><!-- --><span class=\"msohide es-button-border\" style=\"border-style:solid;border-color:#283c8b;background:#283c8b;border-width:0px 0px 2px 0px;display:inline-block;border-radius:30px;width:auto;mso-hide:all\"><a href="+link+" class=\"es-button\" target=\"_blank\" style=\"mso-style-priority:100 !important;text-decoration:none;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;color:#FFFFFF;font-size:18px;display:inline-block;background:#283c8b;border-radius:30px;font-family:verdana, geneva, sans-serif;font-weight:normal;font-style:normal;line-height:22px;width:auto;text-align:center;padding:10px 20px 10px 20px;mso-padding-alt:0;mso-border-alt:10px solid #31CB4B\">verify</a></span><!--<![endif]--></td>\n"
				+ "                     </tr>\n"
				+ "                   </table></td>\n"
				+ "                 </tr>\n"
				+ "               </table></td>\n"
				+ "             </tr>\n"
				+ "           </table></td>\n"
				+ "         </tr>\n"
				+ "       </table>\n"
				+ "       <table class=\"es-footer\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%;background-color:transparent;background-repeat:repeat;background-position:center top\">\n"
				+ "         <tr>\n"
				+ "          <td align=\"center\" style=\"padding:0;Margin:0\">\n"
				+ "           <table class=\"es-footer-body\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#ffffff\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#FFFFFF;width:600px\">\n"
				+ "             <tr>\n"
				+ "              <td align=\"left\" style=\"padding:0;Margin:0;padding-top:20px;padding-left:20px;padding-right:20px\">\n"
				+ "               <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
				+ "                 <tr>\n"
				+ "                  <td valign=\"top\" align=\"center\" style=\"padding:0;Margin:0;width:560px\">\n"
				+ "                   <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
				+ "                     <tr>\n"
				+ "                      <td align=\"center\" style=\"padding:0;Margin:0\"><p style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:verdana, geneva, sans-serif;line-height:28px;color:#666666;font-size:14px\">We don't send any irrelevant email or sell your data.</p></td>\n"
				+ "                     </tr>\n"
				+ "                   </table></td>\n"
				+ "                 </tr>\n"
				+ "               </table></td>\n"
				+ "             </tr>\n"
				+ "             <tr>\n"
				+ "              <td align=\"left\" style=\"Margin:0;padding-top:20px;padding-bottom:20px;padding-left:20px;padding-right:20px\">\n"
				+ "               <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
				+ "                 <tr>\n"
				+ "                  <td align=\"left\" style=\"padding:0;Margin:0;width:560px\">\n"
				+ "                   <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
				+ "                     <tr>\n"
				+ "                      <td align=\"left\" bgcolor=\"#ffffff\" style=\"padding:0;Margin:0;padding-top:20px;padding-bottom:20px;border-top:#999999 solid 1px\"><p style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:verdana, geneva, sans-serif;line-height:21px;color:#999999;font-size:14px\">Need help?</p><p style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:verdana, geneva, sans-serif;line-height:21px;color:#999999;font-size:14px\">Our customer support should be able to help you out with all your queries. Call us at +91-9873412238 or email us at&nbsp;<a href=\"mailto:support@yourbooks.in\" target=\"_blank\" style=\"-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:none;color:#3d85c6;font-size:14px\">support@yourbooks.in</a></p></td>\n"
				+ "                     </tr>\n"
				+ "                   </table></td>\n"
				+ "                 </tr>\n"
				+ "               </table></td>\n"
				+ "             </tr>\n"
				+ "           </table></td>\n"
				+ "         </tr>\n"
				+ "       </table></td>\n"
				+ "     </tr>\n"
				+ "   </table>\n"
				+ "  </div>\n"
				+ " </body>\n"
				+ "</html>";
	}
	
	private static String getHeader() {
		return "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n"
				+ "<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\n"
				+ " <head>\n"
				+ "  <meta charset=\"UTF-8\">\n"
				+ "  <meta content=\"width=device-width, initial-scale=1\" name=\"viewport\">\n"
				+ "  <meta name=\"x-apple-disable-message-reformatting\">\n"
				+ "  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n"
				+ "  <meta content=\"telephone=no\" name=\"format-detection\">\n"
				+ "  <title>New message</title><!--[if (mso 16)]>\n"
				+ "    <style type=\"text/css\">\n"
				+ "    a {text-decoration: none;}\n"
				+ "    </style>\n"
				+ "    <![endif]--><!--[if gte mso 9]><style>sup { font-size: 100% !important; }</style><![endif]--><!--[if gte mso 9]>\n"
				+ "<xml>\n"
				+ "    <o:OfficeDocumentSettings>\n"
				+ "    <o:AllowPNG></o:AllowPNG>\n"
				+ "    <o:PixelsPerInch>96</o:PixelsPerInch>\n"
				+ "    </o:OfficeDocumentSettings>\n"
				+ "</xml>\n"
				+ "<![endif]-->\n"
				+ "  <style type=\"text/css\">\n"
				+ ".rollover:hover .rollover-first {\n"
				+ "  max-height:0px!important;\n"
				+ "  display:none!important;\n"
				+ "  }\n"
				+ "  .rollover:hover .rollover-second {\n"
				+ "  max-height:none!important;\n"
				+ "  display:inline-block!important;\n"
				+ "  }\n"
				+ "  .rollover div {\n"
				+ "  font-size:0px;\n"
				+ "  }\n"
				+ "  u ~ div img + div > div {\n"
				+ "  display:none;\n"
				+ "  }\n"
				+ "  #outlook a {\n"
				+ "  padding:0;\n"
				+ "  }\n"
				+ "  span.MsoHyperlink,\n"
				+ "span.MsoHyperlinkFollowed {\n"
				+ "  color:inherit;\n"
				+ "  mso-style-priority:99;\n"
				+ "  }\n"
				+ "  a.es-button {\n"
				+ "  mso-style-priority:100!important;\n"
				+ "  text-decoration:none!important;\n"
				+ "  }\n"
				+ "  a[x-apple-data-detectors] {\n"
				+ "  color:inherit!important;\n"
				+ "  text-decoration:none!important;\n"
				+ "  font-size:inherit!important;\n"
				+ "  font-family:inherit!important;\n"
				+ "  font-weight:inherit!important;\n"
				+ "  line-height:inherit!important;\n"
				+ "  }\n"
				+ "  .es-desk-hidden {\n"
				+ "  display:none;\n"
				+ "  float:left;\n"
				+ "  overflow:hidden;\n"
				+ "  width:0;\n"
				+ "  max-height:0;\n"
				+ "  line-height:0;\n"
				+ "  mso-hide:all;\n"
				+ "  }\n"
				+ "  .es-header-body a:hover {\n"
				+ "  color:#2cb543!important;\n"
				+ "  }\n"
				+ "  .es-content-body a:hover {\n"
				+ "  color:#2cb543!important;\n"
				+ "  }\n"
				+ "  .es-footer-body a:hover {\n"
				+ "  color:#ffffff!important;\n"
				+ "  }\n"
				+ "  .es-infoblock a:hover {\n"
				+ "  color:#cccccc!important;\n"
				+ "  }\n"
				+ "  .es-button-border:hover > a.es-button {\n"
				+ "  color:#ffffff!important;\n"
				+ "  }\n"
				+ "@media only screen and (max-width:600px) {*[class=\"gmail-fix\"] { display:none!important } p, a { line-height:150%!important } h1, h1 a { line-height:120%!important } h2, h2 a { line-height:120%!important } h3, h3 a { line-height:120%!important } h4, h4 a { line-height:120%!important } h5, h5 a { line-height:120%!important } h6, h6 a { line-height:120%!important } h1 { font-size:30px!important; text-align:left } h2 { font-size:24px!important; text-align:left } h3 { font-size:20px!important; text-align:left } h4 { font-size:24px!important; text-align:left } h5 { font-size:20px!important; text-align:left } h6 { font-size:16px!important; text-align:left } .es-header-body h1 a, .es-content-body h1 a, .es-footer-body h1 a { font-size:30px!important } .es-header-body h2 a, .es-content-body h2 a, .es-footer-body h2 a { font-size:24px!important } .es-header-body h3 a, .es-content-body h3 a, .es-footer-body h3 a { font-size:20px!important } .es-header-body h4 a, .es-content-body h4 a, .es-footer-body h4 a { font-size:24px!important } .es-header-body h5 a, .es-content-body h5 a, .es-footer-body h5 a { font-size:20px!important } .es-header-body h6 a, .es-content-body h6 a, .es-footer-body h6 a { font-size:16px!important } .es-menu td a { font-size:14px!important } .es-header-body p, .es-header-body a { font-size:14px!important } .es-content-body p, .es-content-body a { font-size:14px!important } .es-footer-body p, .es-footer-body a { font-size:14px!important } .es-infoblock p, .es-infoblock a { font-size:12px!important } .es-m-txt-c, .es-m-txt-c h1, .es-m-txt-c h2, .es-m-txt-c h3, .es-m-txt-c h4, .es-m-txt-c h5, .es-m-txt-c h6 { text-align:center!important } .es-m-txt-r, .es-m-txt-r h1, .es-m-txt-r h2, .es-m-txt-r h3, .es-m-txt-r h4, .es-m-txt-r h5, .es-m-txt-r h6 { text-align:right!important } .es-m-txt-j, .es-m-txt-j h1, .es-m-txt-j h2, .es-m-txt-j h3, .es-m-txt-j h4, .es-m-txt-j h5, .es-m-txt-j h6 { text-align:justify!important } .es-m-txt-l, .es-m-txt-l h1, .es-m-txt-l h2, .es-m-txt-l h3, .es-m-txt-l h4, .es-m-txt-l h5, .es-m-txt-l h6 { text-align:left!important } .es-m-txt-r img, .es-m-txt-c img, .es-m-txt-l img { display:inline!important } .es-m-txt-r .rollover:hover .rollover-second, .es-m-txt-c .rollover:hover .rollover-second, .es-m-txt-l .rollover:hover .rollover-second { display:inline!important } .es-m-txt-r .rollover div, .es-m-txt-c .rollover div, .es-m-txt-l .rollover div { line-height:0!important; font-size:0!important } .es-spacer { display:inline-table } a.es-button, button.es-button { font-size:18px!important } a.es-button, button.es-button { display:inline-block!important } .es-button-border { display:inline-block!important } .es-m-fw, .es-m-fw.es-fw, .es-m-fw .es-button { display:block!important } .es-m-il, .es-m-il .es-button, .es-social, .es-social td, .es-menu { display:inline-block!important } .es-adaptive table, .es-left, .es-right { width:100%!important } .es-content table, .es-header table, .es-footer table, .es-content, .es-footer, .es-header { width:100%!important; max-width:600px!important } .adapt-img { width:100%!important; height:150px!important } .es-mobile-hidden, .es-hidden { display:none!important } .es-desk-hidden { width:auto!important; overflow:visible!important; float:none!important; max-height:inherit!important; line-height:inherit!important } tr.es-desk-hidden { display:table-row!important } table.es-desk-hidden { display:table!important } td.es-desk-menu-hidden { display:table-cell!important } .es-menu td { width:1%!important } table.es-table-not-adapt, .esd-block-html table { width:auto!important } .es-social td { padding-bottom:10px } .h-auto { height:auto!important } }\n"
				+ "</style>\n"
				+ " </head>\n"
				+ " <body style=\"width:100%;height:100%;padding:0;Margin:0\">\n"
				+ "  <div class=\"es-wrapper-color\" style=\"background-color:#F6F6F6\"><!--[if gte mso 9]>\n"
				+ "			<v:background xmlns:v=\"urn:schemas-microsoft-com:vml\" fill=\"t\">\n"
				+ "				<v:fill type=\"tile\" color=\"#f6f6f6\"></v:fill>\n"
				+ "			</v:background>\n"
				+ "		<![endif]-->\n"
				+ "   <table class=\"es-wrapper\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;padding:0;Margin:0;width:100%;height:100%;background-repeat:repeat;background-position:center top;background-color:#F6F6F6\">\n"
				+ "     <tr>\n"
				+ "      <td valign=\"top\" style=\"padding:0;Margin:0\">\n"
				+ "       <table class=\"es-content\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;width:100%;table-layout:fixed !important\">\n"
				+ "         <tr>\n"
				+ "          <td align=\"center\" style=\"padding:0;Margin:0\">\n"
				+ "           <table class=\"es-content-body\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#ffffff\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#FFFFFF;width:600px\">\n"
				+ "             <tr>\n"
				+ "              <td align=\"left\" style=\"padding:0;Margin:0;padding-top:20px;padding-right:20px;padding-left:20px\">\n";
				
	}
	
	private static String getFooter() {
		return 	  "                 </tr>\n"
				+ "               </table></td>\n"
				+ "             </tr>\n"
				+ "           </table></td>\n"
				+ "         </tr>\n"
				+ "       </table>\n"
				+ "       <table class=\"es-footer\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;width:100%;table-layout:fixed !important;background-color:transparent;background-repeat:repeat;background-position:center top\">\n"
				+ "         <tr>\n"
				+ "          <td align=\"center\" style=\"padding:0;Margin:0\">\n"
				+ "           <table class=\"es-footer-body\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#ffffff\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#FFFFFF;width:600px\">\n"
				+ "             <tr>\n"
				+ "              <td align=\"left\" style=\"Margin:0;padding-top:20px;padding-right:20px;padding-left:20px;padding-bottom:20px\">\n"
				+ "               <table class=\"es-right\" cellspacing=\"0\" cellpadding=\"0\" align=\"right\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;float:right\">\n"
				+ "                 <tr>\n"
				+ "                  <td align=\"left\" style=\"padding:0;Margin:0;width:560px\">\n"
				+ "                   <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
				+ "                     <tr>\n"
				+ "                      <td align=\"left\" style=\"padding:0;Margin:0;padding-top:20px;padding-bottom:20px;border-top:#999999 solid 1px\"><p style=\"Margin:0;mso-line-height-rule:exactly;font-family:verdana, geneva, sans-serif;line-height:21px !important;letter-spacing:0;color:#666666;font-size:14px\">Need help?</p><p style=\"Margin:0;mso-line-height-rule:exactly;font-family:verdana, geneva, sans-serif;line-height:21px !important;letter-spacing:0;color:#666666;font-size:14px\">If you need assistance or have questions, feel free to reach out to me at +1 908 566 7699 or mail us at&nbsp;<a href='mailto:info@cnerzy.com' target=\"_blank\" style=\"mso-line-height-rule:exactly;text-decoration:none;color:#3d85c6;font-size:14px\">info@cnerzy.com</a></p></td>\n"
				+ "                     </tr>\n"
				+ "                   </table></td>\n"
				+ "                 </tr>\n"
				+ "               </table></td>\n"
				+ "             </tr>\n"
				+ "           </table></td>\n"
				+ "         </tr>\n"
				+ "       </table></td>\n"
				+ "     </tr>\n"
				+ "   </table>\n"
				+ "  </div>\n"
				+ " </body>\n"
				+ "</html>";
	}

	public static String forgotPasswrodEmailBody(Account account,String link) {
		return 	getHeader()
				+ "               <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
				+ "                 <tr>\n"
				+ "                  <td valign=\"top\" align=\"center\" style=\"padding:0;Margin:0;width:560px\">\n"
				+ "                   <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
				+ "                     <tr>\n"
				+ "                      <td style=\"padding:0;Margin:0;padding-top:30px;padding-bottom:20px\"><h1 style=\"Margin:0;font-family:arial, 'helvetica neue', helvetica, sans-serif;mso-line-height-rule:exactly;letter-spacing:0;font-size:20px;font-style:normal;font-weight:normal;line-height:36px;color:#333333\"><strong style=\"color:#283c8b\">Hi,"+(account.getFirstName()!=null?account.getFirstName():"User")+" </strong></h1></td>\n"
				+ "                     </tr>\n"
				+ "                     <tr>\n"
				+ "                      <td align=\"justify\" style=\"padding:0;Margin:0\"><h6 style=\"Margin:0;font-family:arial, 'helvetica neue', helvetica, sans-serif;mso-line-height-rule:exactly;letter-spacing:0;font-size:16px;font-style:normal;font-weight:normal;line-height:32px !important;color:#333333\">It seems you forgot your password on <strong>Cnerzy</strong>. To reset your password simply click the button below!</h6></td>\n"
				+ "                     </tr>\n"
			    + "						<td align=\"center\" style=\"padding: 0; Margin: 0; padding-top: 20px;\">"
		        + "							<a href="+link+" style=\"text-decoration: none;\">"
				+ "					            <button style=\"background-color: #0C3755; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;\">"
				+ "					                Reset Password"
				+ "					            </button>"
				+ "					        </a>"
				+ "					    </td>"
				+ "                     <tr>\n"
				+ "                      <td align=\"left\" style=\"padding:0;Margin:0;padding-top:30px\"><p style=\"Margin:0;mso-line-height-rule:exactly;font-family:arial, 'helvetica neue', helvetica, sans-serif;line-height:21px;letter-spacing:0;color:#283c8b;font-size:14px\">Kind regards,<br><strong>Cnerzy.</strong></p></td>\n"
				+ "                     </tr>\n"
				+ "                   </table></td>\n"
				+ getFooter();
	}
	
	public static String accountStatusApprovedOrRejectedEmailBody(Account account) {
		String accountStatus = "";
		if(account.getStatus().equalsIgnoreCase(Constants.ACCOUNT_STATUS_APPROVED)) {
			accountStatus = "Approved";
		} else if(account.getStatus().equalsIgnoreCase(Constants.ACCOUNT_STATUS_REJECTED)){
			accountStatus = "Rejected";
		}
		return  getHeader()
				+ "                   <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
				+ "                     <tr>\n"
				+ "                      <td style=\"padding:0;Margin:0;padding-top:30px;padding-bottom:20px\"><h1 style=\"Margin:0;font-family:arial, 'helvetica neue', helvetica, sans-serif;mso-line-height-rule:exactly;letter-spacing:0;font-size:20px;font-style:normal;font-weight:normal;line-height:36px;color:#333333\"><strong style=\"color:#283c8b\">Hi,"+(account.getFirstName()!=null?account.getFirstName():"User")+" </strong></h1></td>\n"
				+ "                     </tr>\n"
				+ "                     <tr>\n"
				+ "                      <td align=\"justify\" style=\"padding:0;Margin:0\"><h6 style=\"Margin:0;font-family:arial, 'helvetica neue', helvetica, sans-serif;mso-line-height-rule:exactly;letter-spacing:0;font-size:16px;font-style:normal;font-weight:normal;line-height:32px !important;color:#333333\">.Your Cnerzy account status is "+accountStatus+"!</h6></td>\n"
				+ "                     </tr>\n"
				+ "                     <tr>\n"
				+ "                      <td align=\"left\" style=\"padding:0;Margin:0;padding-top:30px\"><p style=\"Margin:0;mso-line-height-rule:exactly;font-family:arial, 'helvetica neue', helvetica, sans-serif;line-height:21px;letter-spacing:0;color:#283c8b;font-size:14px\">Kind regards,<br><strong>Cnerzy.</strong></p></td>\n"
				+ "                     </tr>\n"
				+ "                   </table></td>\n"
				+ getFooter();
	}
	
	public static String accountConcernRaisedEmailBody(Account account, String link) {
		return 	getHeader()
				+ "                   <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
				+ "                     <tr>\n"
				+ "                      <td style=\"padding:0;Margin:0;padding-top:30px;padding-bottom:20px\"><h1 style=\"Margin:0;font-family:arial, 'helvetica neue', helvetica, sans-serif;mso-line-height-rule:exactly;letter-spacing:0;font-size:20px;font-style:normal;font-weight:normal;line-height:36px;color:#333333\"><strong style=\"color:#283c8b\">Hi,"+(account.getFirstName()!=null?account.getFirstName():"User")+" </strong></h1></td>\n"
				+ "                     </tr>\n"
				+ "                     <tr>\n"
				+ "                      <td align=\"justify\" style=\"padding:0;Margin:0\"><h6 style=\"Margin:0;font-family:arial, 'helvetica neue', helvetica, sans-serif;mso-line-height-rule:exactly;letter-spacing:0;font-size:16px;font-style:normal;font-weight:normal;line-height:32px !important;color:#333333\">.We noticed that your form submission is missing some essential information. To ensure a smooth process, we kindly request that you complete/update the following fields:</h6></td>\n"
				+ "                     </tr>\n"
				+ "                     <tr>\n"
				+ "                      <td align=\"justify\" style=\"padding:0;Margin:0\"><h6 style=\"Margin:0;font-family:arial, 'helvetica neue', helvetica, sans-serif;mso-line-height-rule:exactly;letter-spacing:0;font-size:16px;font-style:normal;font-weight:normal;line-height:32px !important;color:#333333\">."+account.getConcern()+"</h6></td>\n"
				+ "                     </tr>\n"
				+ "                     <tr>\n"
				+ "                      <td align=\"justify\" style=\"padding:0;Margin:0\"><h6 style=\"Margin:0;font-family:arial, 'helvetica neue', helvetica, sans-serif;mso-line-height-rule:exactly;letter-spacing:0;font-size:16px;font-style:normal;font-weight:normal;line-height:32px !important;color:#333333\">.Please click this <a href= "+link+" style=\"-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:none;color:#3d85c6;font-size:14px\">link</a> to access your form and fill in the required information.</h6></td>\n"
				+ "                     </tr>\n"
				+ "                     <tr>\n"
				+ "                      <td align=\"left\" style=\"padding:0;Margin:0;padding-top:30px\"><p style=\"Margin:0;mso-line-height-rule:exactly;font-family:arial, 'helvetica neue', helvetica, sans-serif;line-height:21px;letter-spacing:0;color:#283c8b;font-size:14px\">Kind regards,<br><strong>Cnerzy.</strong></p></td>\n"
				+ "                     </tr>\n"
				+ "                   </table></td>\n"
				+ getFooter();
	}
	
	public static String requirementStatusChangeEmailBody(Requirement requirement) {
		return  getHeader()
				+ "                   <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
				+ "                     <tr>\n"
				+ "                      <td style=\"padding:0;Margin:0;padding-top:30px;padding-bottom:20px\"><h1 style=\"Margin:0;font-family:arial, 'helvetica neue', helvetica, sans-serif;mso-line-height-rule:exactly;letter-spacing:0;font-size:20px;font-style:normal;font-weight:normal;line-height:36px;color:#333333\"><strong style=\"color:#283c8b\">Hi,"+(requirement.getAddedBy()!=null?requirement.getAddedBy():"User")+" </strong></h1></td>\n"
				+ "                     </tr>\n"
				+ "                     <tr>\n"
				+ "                      <td align=\"justify\" style=\"padding:0;Margin:0\"><h6 style=\"Margin:0;font-family:arial, 'helvetica neue', helvetica, sans-serif;mso-line-height-rule:exactly;letter-spacing:0;font-size:16px;font-style:normal;font-weight:normal;line-height:32px !important;color:#333333\">.Your requirement "+requirement.getTitle()+ " with ID "+requirement.getRequirementNo()+" has been "+(requirement.getStatus().equals(RequirementStatus.APPROVED)?"Approved":"Rejected")+"</h6></td>\n"
				+ "                     </tr>\n"
				+ "                     <tr>\n"
				+ "                      <td align=\"left\" style=\"padding:0;Margin:0;padding-top:30px\"><p style=\"Margin:0;mso-line-height-rule:exactly;font-family:arial, 'helvetica neue', helvetica, sans-serif;line-height:21px;letter-spacing:0;color:#283c8b;font-size:14px\">Kind regards,<br><strong>Cnerzy.</strong></p></td>\n"
				+ "                     </tr>\n"
				+ "                   </table></td>\n"
				+ getFooter();
	}
	
	public static String newRequirementForSellerEmailBody(Requirement requirement) {
		return 	getHeader()
				+ "                   <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
				+ "                     <tr>\n"
				+ "                      <td style=\"padding:0;Margin:0;padding-top:30px;padding-bottom:20px\"><h1 style=\"Margin:0;font-family:arial, 'helvetica neue', helvetica, sans-serif;mso-line-height-rule:exactly;letter-spacing:0;font-size:20px;font-style:normal;font-weight:normal;line-height:36px;color:#333333\"><strong style=\"color:#283c8b\">Hi, Seller </strong></h1></td>\n"
				+ "                     </tr>\n"
				+ "                     <tr>\n"
				+ "                      <td align=\"justify\" style=\"padding:0;Margin:0\"><h6 style=\"Margin:0;font-family:arial, 'helvetica neue', helvetica, sans-serif;mso-line-height-rule:exactly;letter-spacing:0;font-size:16px;font-style:normal;font-weight:normal;line-height:32px !important;color:#333333\">.A new Requirement "+requirement.getTitle()+" with ID "+requirement.getId()+" is posted by "+requirement.getAddedBy()+". </h6></td>\n"
				+ "                     </tr>\n"
				+ "                     <tr>\n"
				+ "                      <td align=\"left\" style=\"padding:0;Margin:0;padding-top:30px\"><p style=\"Margin:0;mso-line-height-rule:exactly;font-family:arial, 'helvetica neue', helvetica, sans-serif;line-height:21px;letter-spacing:0;color:#283c8b;font-size:14px\">Kind regards,<br><strong>Cnerzy.</strong></p></td>\n"
				+ "                     </tr>\n"
				+ "                   </table></td>\n"
				+ getFooter();
	}


	public static String getEmailBodyForPaymentSuccess(RegisterationBean registerationBean, String paidAmount, String expiryDate) {				
		return "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n"
				+ "<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\" style=\"font-family:arial, 'helvetica neue', helvetica, sans-serif\"> \r\n"
				+ " <head> \r\n"
				+ "  <meta charset=\"UTF-8\"> \r\n"
				+ "  <meta content=\"width=device-width, initial-scale=1\" name=\"viewport\"> \r\n"
				+ "  <meta name=\"x-apple-disable-message-reformatting\"> \r\n"
				+ "  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"> \r\n"
				+ "  <meta content=\"telephone=no\" name=\"format-detection\"> \r\n"
				+ "  <title>Payment successful</title><!--[if (mso 16)]>\r\n"
				+ "    <style type=\"text/css\">\r\n"
				+ "    a {text-decoration: none;}\r\n"
				+ "    </style>\r\n"
				+ "    <![endif]--><!--[if gte mso 9]><style>sup { font-size: 100% !important; }</style><![endif]--><!--[if gte mso 9]>\r\n"
				+ "<xml>\r\n"
				+ "    <o:OfficeDocumentSettings>\r\n"
				+ "    <o:AllowPNG></o:AllowPNG>\r\n"
				+ "    <o:PixelsPerInch>96</o:PixelsPerInch>\r\n"
				+ "    </o:OfficeDocumentSettings>\r\n"
				+ "</xml>\r\n"
				+ "<![endif]--> \r\n"
				+ "  <style type=\"text/css\">\r\n"
				+ "#outlook a {\r\n"
				+ "	padding:0;\r\n"
				+ "}\r\n"
				+ ".es-button {\r\n"
				+ "	mso-style-priority:100!important;\r\n"
				+ "	text-decoration:none!important;\r\n"
				+ "}\r\n"
				+ "a[x-apple-data-detectors] {\r\n"
				+ "	color:inherit!important;\r\n"
				+ "	text-decoration:none!important;\r\n"
				+ "	font-size:inherit!important;\r\n"
				+ "	font-family:inherit!important;\r\n"
				+ "	font-weight:inherit!important;\r\n"
				+ "	line-height:inherit!important;\r\n"
				+ "}\r\n"
				+ ".es-desk-hidden {\r\n"
				+ "	display:none;\r\n"
				+ "	float:left;\r\n"
				+ "	overflow:hidden;\r\n"
				+ "	width:0;\r\n"
				+ "	max-height:0;\r\n"
				+ "	line-height:0;\r\n"
				+ "	mso-hide:all;\r\n"
				+ "}\r\n"
				+ "[data-ogsb] .es-button {\r\n"
				+ "	border-width:0!important;\r\n"
				+ "	padding:10px 20px 10px 20px!important;\r\n"
				+ "}\r\n"
				+ "@media only screen and (max-width:600px) {p, ul li, ol li, a { line-height:150%!important } h1, h2, h3, h1 a, h2 a, h3 a { line-height:120% } h1 { font-size:30px!important; text-align:left } h2 { font-size:24px!important; text-align:left } h3 { font-size:20px!important; text-align:left } .es-header-body h1 a, .es-content-body h1 a, .es-footer-body h1 a { font-size:30px!important; text-align:left } .es-header-body h2 a, .es-content-body h2 a, .es-footer-body h2 a { font-size:24px!important; text-align:left } .es-header-body h3 a, .es-content-body h3 a, .es-footer-body h3 a { font-size:20px!important; text-align:left } .es-menu td a { font-size:14px!important } .es-header-body p, .es-header-body ul li, .es-header-body ol li, .es-header-body a { font-size:14px!important } .es-content-body p, .es-content-body ul li, .es-content-body ol li, .es-content-body a { font-size:14px!important } .es-footer-body p, .es-footer-body ul li, .es-footer-body ol li, .es-footer-body a { font-size:14px!important } .es-infoblock p, .es-infoblock ul li, .es-infoblock ol li, .es-infoblock a { font-size:12px!important } *[class=\"gmail-fix\"] { display:none!important } .es-m-txt-c, .es-m-txt-c h1, .es-m-txt-c h2, .es-m-txt-c h3 { text-align:center!important } .es-m-txt-r, .es-m-txt-r h1, .es-m-txt-r h2, .es-m-txt-r h3 { text-align:right!important } .es-m-txt-l, .es-m-txt-l h1, .es-m-txt-l h2, .es-m-txt-l h3 { text-align:left!important } .es-m-txt-r img, .es-m-txt-c img, .es-m-txt-l img { display:inline!important } .es-button-border { display:inline-block!important } a.es-button, button.es-button { font-size:18px!important; display:inline-block!important } .es-adaptive table, .es-left, .es-right { width:100%!important } .es-content table, .es-header table, .es-footer table, .es-content, .es-footer, .es-header { width:100%!important; max-width:600px!important } .es-adapt-td { display:block!important; width:100%!important } .adapt-img { width:100%!important; height:auto!important } .es-m-p0 { padding:0px!important } .es-m-p0r { padding-right:0px!important } .es-m-p0l { padding-left:0px!important } .es-m-p0t { padding-top:0px!important } .es-m-p0b { padding-bottom:0!important } .es-m-p20b { padding-bottom:20px!important } .es-mobile-hidden, .es-hidden { display:none!important } tr.es-desk-hidden, td.es-desk-hidden, table.es-desk-hidden { width:auto!important; overflow:visible!important; float:none!important; max-height:inherit!important; line-height:inherit!important } tr.es-desk-hidden { display:table-row!important } table.es-desk-hidden { display:table!important } td.es-desk-menu-hidden { display:table-cell!important } .es-menu td { width:1%!important } table.es-table-not-adapt, .esd-block-html table { width:auto!important } table.es-social { display:inline-block!important } table.es-social td { display:inline-block!important } }\r\n"
				+ "</style> \r\n"
				+ " </head> \r\n"
				+ " <body style=\"width:100%;font-family:arial, 'helvetica neue', helvetica, sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;padding:0;Margin:0\"> \r\n"
				+ "  <div class=\"es-wrapper-color\" style=\"background-color:transparent\"><!--[if gte mso 9]>\r\n"
				+ "			<v:background xmlns:v=\"urn:schemas-microsoft-com:vml\" fill=\"t\">\r\n"
				+ "				<v:fill type=\"tile\" color=\"transparent\"></v:fill>\r\n"
				+ "			</v:background>\r\n"
				+ "		<![endif]--> \r\n"
				+ "   <table class=\"es-wrapper\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;padding:0;Margin:0;width:100%;height:100%;background-repeat:repeat;background-position:center top;background-color:transparent\"> \r\n"
				+ "     <tr> \r\n"
				+ "      <td valign=\"top\" style=\"padding:0;Margin:0\"> \r\n"
				+ "       <table class=\"es-header\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%;background-color:transparent;background-repeat:repeat;background-position:center top\"> \r\n"
				+ "         <tr> \r\n"
				+ "          <td align=\"center\" style=\"padding:0;Margin:0\"> \r\n"
				+ "           <table class=\"es-header-body\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:transparent;width:600px\"> \r\n"
				+ "             <tr> \r\n"
				+ "              <td align=\"left\" bgcolor=\"#dff1ff\" style=\"padding:20px;Margin:0;background-color:#dff1ff\"><!--[if mso]><table style=\"width:560px\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"width:194px\" valign=\"top\"><![endif]--> \r\n"
				+ "               <table cellspacing=\"0\" cellpadding=\"0\" align=\"left\" class=\"es-left\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;float:left\"> \r\n"
				+ "                 <tr> \r\n"
				+ "                  <td class=\"es-m-p0r es-m-p20b\" valign=\"top\" align=\"center\" style=\"padding:0;Margin:0;width:174px\"> \r\n"
				+ "                   <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" role=\"presentation\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\"> \r\n"
				+ "                     <tr> \r\n"
				+ "                      <td align=\"center\" class=\"es-m-txt-c\" style=\"padding:0;Margin:0;font-size:0px\"><img src=\"https://whksxp.stripocdn.email/content/guids/CABINET_dc3a91621a7e33c8fbbf5bc2abc98074/images/logo_yb1removebgpreview.png\" alt style=\"display:block;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic\" width=\"140\"></td> \r\n"
				+ "                     </tr> \r\n"
				+ "                   </table></td> \r\n"
				+ "                  <td class=\"es-hidden\" style=\"padding:0;Margin:0;width:20px\"></td> \r\n"
				+ "                 </tr> \r\n"
				+ "               </table><!--[if mso]></td><td style=\"width:130px\" valign=\"top\"><![endif]--> \r\n"
				+ "               <table cellpadding=\"0\" cellspacing=\"0\" class=\"es-left\" align=\"left\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;float:left\"> \r\n"
				+ "                 <tr> \r\n"
				+ "                  <td align=\"left\" class=\"es-m-p20b\" style=\"padding:0;Margin:0;width:130px\"> \r\n"
				+ "                   <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\"> \r\n"
				+ "                     <tr> \r\n"
				+ "                      <td align=\"center\" style=\"padding:0;Margin:0;padding-top:30px;font-size:0px\"><img src=\"https://whksxp.stripocdn.email/content/guids/CABINET_a7128d5097f3308f23e62ebd613c8adf/images/correct256.png\" alt style=\"display:block;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic\" width=\"35\"></td> \r\n"
				+ "                     </tr> \r\n"
				+ "                   </table></td> \r\n"
				+ "                 </tr> \r\n"
				+ "               </table><!--[if mso]></td><td style=\"width:20px\"></td><td style=\"width:216px\" valign=\"top\"><![endif]--> \r\n"
				+ "               <table cellpadding=\"0\" cellspacing=\"0\" class=\"es-right\" align=\"right\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;float:right\"> \r\n"
				+ "                 <tr> \r\n"
				+ "                  <td align=\"left\" style=\"padding:0;Margin:0;width:216px\"> \r\n"
				+ "                   <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\"> \r\n"
				+ "                     <tr> \r\n"
				+ "                      <td align=\"left\" class=\"es-m-txt-c\" style=\"padding:5px;Margin:0\"><h1 style=\"Margin:0;line-height:43px;mso-line-height-rule:exactly;font-family:helvetica, 'helvetica neue', arial, verdana, sans-serif;font-size:36px;font-style:normal;font-weight:normal;color:#018eea\"><strong>Payment</strong></h1><h1 style=\"Margin:0;line-height:43px;mso-line-height-rule:exactly;font-family:helvetica, 'helvetica neue', arial, verdana, sans-serif;font-size:36px;font-style:normal;font-weight:normal;color:#018eea\"><strong>Successful</strong></h1></td> \r\n"
				+ "                     </tr> \r\n"
				+ "                   </table></td> \r\n"
				+ "                 </tr> \r\n"
				+ "               </table><!--[if mso]></td></tr></table><![endif]--></td> \r\n"
				+ "             </tr> \r\n"
				+ "           </table></td> \r\n"
				+ "         </tr> \r\n"
				+ "       </table> \r\n"
				+ "       <table class=\"es-content\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%\"> \r\n"
				+ "         <tr> \r\n"
				+ "          <td align=\"center\" style=\"padding:0;Margin:0\"> \r\n"
				+ "           <table class=\"es-content-body\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#ffffff\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#FFFFFF;width:600px\"> \r\n"
				+ "             <tr> \r\n"
				+ "              <td align=\"left\" bgcolor=\"#f3fbfd\" style=\"padding:0;Margin:0;padding-top:10px;background-color:#f3fbfd\"> \r\n"
				+ "               <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\"> \r\n"
				+ "                 <tr> \r\n"
				+ "                  <td valign=\"top\" align=\"center\" style=\"padding:0;Margin:0;width:600px\"> \r\n"
				+ "                   <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#f3fbfd\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#f3fbfd\" role=\"presentation\"> \r\n"
				+ "                     <tr> \r\n"
				+ "                      <td align=\"left\" style=\"padding:20px;Margin:0;border-bottom:4px solid #018eea\" bgcolor=\"#f3fbfd\"><h4 style=\"Margin:0;line-height:45px;mso-line-height-rule:exactly;font-family:helvetica, 'helvetica neue', arial, verdana, sans-serif;font-size:30px;color:#455e6a;text-align:center\">Hi, "+registerationBean.getFullName()+"!</h4><p style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:arial, 'helvetica neue', helvetica, sans-serif;line-height:21px;color:#333333;font-size:14px\"><br></p><p style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:helvetica, 'helvetica neue', arial, verdana, sans-serif;line-height:24px;color:#455e6a;font-size:16px;text-align:justify\">Thank you for making the payment for <strong>\"Rs: "+paidAmount+"\"</strong>. Your subscription is <strong>valid till \""+expiryDate+"\".</strong></p></td> \r\n"
				+ "                     </tr> \r\n"
				+ "                   </table></td> \r\n"
				+ "                 </tr> \r\n"
				+ "               </table></td> \r\n"
				+ "             </tr> \r\n"
				+ "           </table></td> \r\n"
				+ "         </tr> \r\n"
				+ "       </table> \r\n"
				+ "       <table class=\"es-footer\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%;background-color:transparent;background-repeat:repeat;background-position:center top\"> \r\n"
				+ "         <tr> \r\n"
				+ "          <td align=\"center\" style=\"padding:0;Margin:0\"> \r\n"
				+ "           <table class=\"es-footer-body\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#ffffff\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#FFFFFF;width:600px\"> \r\n"
				+ "             <tr> \r\n"
				+ "              <td class=\"es-m-p20b\" align=\"left\" style=\"padding:0;Margin:0;width:270px\"> \r\n"
				+ "               <table cellpadding=\"0\" cellspacing=\"0\" class=\"es-footer\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%;background-color:transparent;background-repeat:repeat;background-position:center top\" role=\"presentation\"> \r\n"
				+ "                 <tr> \r\n"
				+ "                  <td align=\"center\" style=\"padding:0;Margin:0\"> \r\n"
				+ "                   <table bgcolor=\"#ffffff\" class=\"es-footer-body\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#FFFFFF;width:600px\" role=\"presentation\"> \r\n"
				+ "                     <tr> \r\n"
				+ "                      <td align=\"left\" bgcolor=\"#121921\" style=\"padding:20px;Margin:0;background-color:#121921\"><!--[if mso]><table style=\"width:560px\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"width:270px\" valign=\"top\"><![endif]--> \r\n"
				+ "                       <table cellpadding=\"0\" cellspacing=\"0\" align=\"left\" class=\"es-left\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;float:left\" role=\"presentation\"> \r\n"
				+ "                         <tr> \r\n"
				+ "                          <td class=\"es-m-p20b\" align=\"center\" valign=\"top\" style=\"padding:0;Margin:0;width:270px\"> \r\n"
				+ "                           <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\"> \r\n"
				+ "                             <tr> \r\n"
				+ "                              <td align=\"left\" style=\"padding:0;Margin:0\"><p style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:helvetica, 'helvetica neue', arial, verdana, sans-serif;line-height:36px;color:#ffffff;font-size:18px\"><strong>Contact us</strong></p></td> \r\n"
				+ "                             </tr> \r\n"
				+ "                             <tr> \r\n"
				+ "                              <td style=\"padding:0;Margin:0\"> \r\n"
				+ "                              <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"es-menu\" role=\"presentation\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\"> \r\n"
				+ "                              <tr class=\"links-images-left\"> \r\n"
				+ "                              <td align=\"left\" valign=\"top\" width=\"100%\" id=\"esd-menu-id-0\" style=\"Margin:0;border:0;padding-left:5px;padding-right:5px;padding-top:6px;padding-bottom:10px\"><a target=\"_blank\" style=\"-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:none;display:block;font-family:helvetica, 'helvetica neue', arial, verdana, sans-serif;color:#FFFFFF;font-size:14px\" href=\"\"><img src=\"https://whksxp.stripocdn.email/content/guids/CABINET_dcf4a6b321ec26c90bb7f6a4d108f954/images/envelope.png\" alt=\"him@hahd.com\" title=\"him@hahd.com\" align=\"absmiddle\" width=\"18\" style=\"display:inline-block !important;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic;vertical-align:middle;padding-right:5px\">support@yourbooks.in</a></td> \r\n"
				+ "                              </tr> \r\n"
				+ "                              </table></td> \r\n"
				+ "                             </tr> \r\n"
				+ "                           </table></td> \r\n"
				+ "                         </tr> \r\n"
				+ "                       </table><!--[if mso]></td><td style=\"width:20px\"></td><td style=\"width:270px\" valign=\"top\"><![endif]--> \r\n"
				+ "                       <table cellpadding=\"0\" cellspacing=\"0\" class=\"es-right\" align=\"right\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;float:right\" role=\"presentation\"> \r\n"
				+ "                         <tr> \r\n"
				+ "                          <td align=\"left\" style=\"padding:0;Margin:0;width:270px\"> \r\n"
				+ "                           <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\"> \r\n"
				+ "                             <tr> \r\n"
				+ "                              <td align=\"left\" style=\"padding:0;Margin:0\"><p style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:helvetica, 'helvetica neue', arial, verdana, sans-serif;line-height:27px;color:#ffffff;font-size:18px\"><strong>Address</strong></p><p style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:helvetica, 'helvetica neue', arial, verdana, sans-serif;line-height:18px;color:#ffffff;font-size:12px\">Spaze Itech Park, Tower B2, Unit 853, eight floor, Sohna road, Sector 49, Gurgaon 122018 Haryana, INDIA</p></td> \r\n"
				+ "                             </tr> \r\n"
				+ "                           </table></td> \r\n"
				+ "                         </tr> \r\n"
				+ "                       </table><!--[if mso]></td></tr></table><![endif]--></td> \r\n"
				+ "                     </tr> \r\n"
				+ "                     <tr> \r\n"
				+ "                      <td align=\"left\" bgcolor=\"#121921\" style=\"padding:0;Margin:0;padding-bottom:20px;padding-left:20px;padding-right:20px;background-color:#121921\"> \r\n"
				+ "                       <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\" role=\"presentation\"> \r\n"
				+ "                         <tr> \r\n"
				+ "                          <td align=\"left\" style=\"padding:0;Margin:0;width:560px\"> \r\n"
				+ "                           <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\"> \r\n"
				+ "                             <tr> \r\n"
				+ "                              <td align=\"center\" style=\"padding:0;Margin:0\"><p style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:helvetica, 'helvetica neue', arial, verdana, sans-serif;line-height:21px;color:#333333;font-size:14px\"><strong>Powered by <span style=\"font-size:20px;color:#0000ff\">YourBooks</span></strong></p></td> \r\n"
				+ "                             </tr> \r\n"
				+ "                           </table></td> \r\n"
				+ "                         </tr> \r\n"
				+ "                       </table></td> \r\n"
				+ "                     </tr> \r\n"
				+ "                   </table></td> \r\n"
				+ "                 </tr> \r\n"
				+ "               </table></td> \r\n"
				+ "             </tr> \r\n"
				+ "           </table></td> \r\n"
				+ "         </tr> \r\n"
				+ "       </table></td> \r\n"
				+ "     </tr> \r\n"
				+ "   </table> \r\n"
				+ "  </div>  \r\n"
				+ " </body>\r\n"
				+ "</html>";
	
	}
	
	public static String generateHtmlEmail(String recipientName, List<String> lines) {
        StringBuilder emailContent = new StringBuilder();

        emailContent.append("<!DOCTYPE html>")
                .append("<html>")
                .append("<head>")
                .append("<style>")
                .append("body {")
                .append("font-family: Arial, sans-serif;")
                .append("background-color: #f4f4f4;")
                .append("color: #333;")
                .append("margin: 0;")
                .append("padding: 0;")
                .append("}")
                .append(".container {")
                .append("width: 100%;")
                .append("max-width: 600px;")
                .append("margin: 0 auto;")
                .append("padding: 20px;")
                .append("background-color: #fff;")
                .append("border-radius: 8px;")
                .append("box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);")
                .append("}")
                .append(".header {")
                .append("text-align: center;")
                .append("padding: 20px 0;")
                .append("}")
                .append(".header h1 {")
                .append("margin: 0;")
                .append("color: #333;")
                .append("}")
                .append(".content {")
                .append("padding: 20px 0;")
                .append("}")
                .append(".content p {")
                .append("line-height: 1.4;")
                .append("margin: 10px 0;")
                .append("}")
                .append(".footer {")
                .append("text-align: center;")
                .append("padding: 20px 0;")
                .append("color: #aaa;")
                .append("}")
                .append("</style>")
                .append("</head>")
                .append("<body>")
                .append("<div class=\"container\">")
//                .append("<div class=\"header\">")
//                .append("</div>")
                .append("<div class=\"content\">")
                .append("<p>Dear ").append(recipientName).append(",</p>");

        for (String line : lines) {
            emailContent.append("<p>").append(line).append("</p>");
        }

        emailContent.append("If you have any questions or need assistance, please contact us at <a href='mailto:admin@cnerzy.com'>admin@cnerzy.com</a>. We look forward to supporting your success. ");
       
        emailContent.append("<br>")
                .append("<p>Regards,</p>")
                .append("<p>Cnerzy Team</p>")
                .append("</div>")
                .append("<div class=\"footer\">")
                .append("<p>&copy; Cnerzy "+ Year.now()+" All rights reserved.</p>")
                .append("</div>")
                .append("</div>")
                .append("</body>")
                .append("</html>");

        return emailContent.toString();
    }
	
	public static String generateHtmlAdminEmail(List<String> lines) {
        StringBuilder emailContent = new StringBuilder();

        emailContent.append("<!DOCTYPE html>")
                .append("<html>")
                .append("<head>")
                .append("<style>")
                .append("body {")
                .append("font-family: Arial, sans-serif;")
                .append("background-color: #f4f4f4;")
                .append("color: #333;")
                .append("margin: 0;")
                .append("padding: 0;")
                .append("}")
                .append(".container {")
                .append("width: 100%;")
                .append("max-width: 600px;")
                .append("margin: 0 auto;")
                .append("padding: 20px;")
                .append("background-color: #fff;")
                .append("border-radius: 8px;")
                .append("box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);")
                .append("}")
                .append(".header {")
                .append("text-align: center;")
                .append("padding: 20px 0;")
                .append("}")
                .append(".header h1 {")
                .append("margin: 0;")
                .append("color: #333;")
                .append("}")
                .append(".content {")
                .append("padding: 20px 0;")
                .append("}")
                .append(".content p {")
                .append("line-height: 1.4;")
                .append("margin: 10px 0;")
                .append("}")
                .append(".footer {")
                .append("text-align: center;")
                .append("padding: 20px 0;")
                .append("color: #aaa;")
                .append("}")
                .append("</style>")
                .append("</head>")
                .append("<body>")
                .append("<div class=\"container\">")
//                .append("<div class=\"header\">")
//                .append("</div>")
                .append("<div class=\"content\">")
                .append("<p>Hi Admin Team,</p>");

        for (String line : lines) {
            emailContent.append("<p>").append(line).append("</p>");
        }
       
        emailContent.append("<br>")
                .append("<p>Regards,</p>")
                .append("<p>The Cnerzy Team</p>")
                .append("</div>")
                .append("<div class=\"footer\">")
                .append("<p>&copy; Cnerzy "+ Year.now()+" All rights reserved.</p>")
                .append("</div>")
                .append("</div>")
                .append("</body>")
                .append("</html>");

        return emailContent.toString();
    }

}
	
	