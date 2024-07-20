-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 19, 2011 at 03:12 SA
-- Server version: 5.1.37
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gianhang`
--

-- --------------------------------------------------------

--
-- Table structure for table `ecm_acategory`
--

CREATE TABLE IF NOT EXISTS `ecm_acategory` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(100) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ecm_acategory`
--

INSERT INTO `ecm_acategory` (`cate_id`, `cate_name`, `parent_id`, `sort_order`, `code`) VALUES
(1, 'Trợ giúp mua hàng', 0, 0, 'help'),
(2, 'Thông báo Mall', 0, 0, 'notice'),
(3, 'Tích hợp trong bài viết', 0, 0, 'system');

-- --------------------------------------------------------

--
-- Table structure for table `ecm_address`
--

CREATE TABLE IF NOT EXISTS `ecm_address` (
  `addr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `consignee` varchar(60) NOT NULL DEFAULT '',
  `region_id` int(10) unsigned DEFAULT NULL,
  `region_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zipcode` varchar(20) DEFAULT NULL,
  `phone_tel` varchar(60) DEFAULT NULL,
  `phone_mob` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`addr_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ecm_address`
--

INSERT INTO `ecm_address` (`addr_id`, `user_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`) VALUES
(1, 2, 'Thanhtcbkhn', 3, 'Hà Nội	Quận Đống Đa', '14b - Ngõ 36 - Giáp Bát - Hoàng Mai - Hà Nội', '', '0908722688', '');

-- --------------------------------------------------------

--
-- Table structure for table `ecm_article`
--

CREATE TABLE IF NOT EXISTS `ecm_article` (
  `article_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `cate_id` int(10) NOT NULL DEFAULT '0',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) DEFAULT NULL,
  `content` text,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `if_show` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `add_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`article_id`),
  KEY `code` (`code`),
  KEY `cate_id` (`cate_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ecm_article`
--

INSERT INTO `ecm_article` (`article_id`, `code`, `title`, `cate_id`, `store_id`, `link`, `content`, `sort_order`, `if_show`, `add_time`) VALUES
(1, 'eula', 'Người sử dụng Dịch vụ Hiệp định', 3, 0, '', '<p>特別提醒用戶認真閱讀本《用戶服務協議》(下稱《協議》) 中各條款。除非您接受本《協議》條款，否則您無權使用本網站提供的相關服務。您的使用行為將視為對本《協議》的接受，並同意接受本《協議》各項條款的約束。 <br /> <br /> <strong>一、定義</strong></p>\r\n<ol>\r\n<li>"用戶"指符合本協議所規定的條件，同意遵守本網站各種規則、條款（包括但不限于本協議），並使用本網站的個人或機構。</li>\r\n<li>"賣家"是指在本網站上出售物品的用戶。"買家"是指在本網站購買物品的用戶。</li>\r\n<li>"成交"指買家根據賣家所刊登的交易要求，在特定時間內提出最優的交易條件，因而取得依其提出的條件購買該交易物品的權利。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>二、用戶資格</strong><br /> <br /> 只有符合下列條件之一的人員或實體才能申請成為本網站用戶，可以使用本網站的服務。</p>\r\n<ol>\r\n<li>年滿十八歲，並具有民事權利能力和民事行為能力的自然人；</li>\r\n<li>未滿十八歲，但監護人（包括但不僅限于父母）予以書面同意的自然人；</li>\r\n<li>根據中國法律或設立地法律、法規和/或規章成立並合法存在的公司、企事業單位、社團組織和其他組織。</li>\r\n</ol>\r\n<p><br /> 無民事行為能力人、限制民事行為能力人以及無經營或特定經營資格的組織不當注冊為本網站用戶或超過其民事權利或行為能力範圍從事交易的，其與本網站之間的協議自始無效，本網站一經發現，有權立即注銷該用戶，並追究其使用本網站"服務"的一切法律責任。<br /> <br /> <strong>三.用戶的權利和義務</strong></p>\r\n<ol>\r\n<li>用戶有權根據本協議的規定及本網站發布的相關規則，利用本網站網上交易平台登錄物品、發布交易信息、查詢物品信息、購買物品、與其他用戶訂立物品買賣合同、在本網站社區發帖、參加本網站的有關活動及有權享受本網站提供的其他的有關資訊及信息服務。</li>\r\n<li>用戶有權根據需要更改密碼和交易密碼。用戶應對以該用戶名進行的所有活動和事件負全部責任。</li>\r\n<li>用戶有義務確保向本網站提供的任何資料、注冊信息真實準確，包括但不限于真實姓名、身份證號、聯系電話、地址、郵政編碼等。保證本網站及其他用戶可以通過上述聯系方式與自己進行聯系。同時，用戶也有義務在相關資料實際變更時及時更新有關注冊資料。</li>\r\n<li>用戶不得以任何形式擅自轉讓或授權他人使用自己在本網站的用戶帳號。</li>\r\n<li>用戶有義務確保在本網站網上交易平台上登錄物品、發布的交易信息真實、準確，無誤導性。</li>\r\n<li>用戶不得在本網站網上交易平台買賣國家禁止銷售的或限制銷售的物品、不得買賣侵犯他人知識產權或其他合法權益的物品，也不得買賣違背社會公共利益或公共道德的物品。</li>\r\n<li>用戶不得在本網站發布各類違法或違規信息。包括但不限于物品信息、交易信息、社區帖子、物品留言，店鋪留言，評價內容等。</li>\r\n<li>用戶在本網站交易中應當遵守誠實信用原則，不得以干預或操縱物品價格等不正當競爭方式擾亂網上交易秩序，不得從事與網上交易無關的不當行為，不得在交易平台上發布任何違法信息。</li>\r\n<li>用戶不應采取不正當手段（包括但不限于虛假交易、互換好評等方式）提高自身或他人信用度，或采用不正當手段惡意評價其他用戶，降低其他用戶信用度。</li>\r\n<li>用戶承諾自己在使用本網站網上交易平台實施的所有行為遵守國家法律、法規和本網站的相關規定以及各種社會公共利益或公共道德。對于任何法律後果的發生，用戶將以自己的名義獨立承擔所有相應的法律責任。</li>\r\n<li>用戶在本網站網上交易過程中如與其他用戶因交易產生糾紛，可以請求本網站從中予以協調。用戶如發現其他用戶有違法或違反本協議的行為，可以向本網站舉報。如用戶因網上交易與其他用戶產生訴訟的，用戶有權通過司法部門要求本網站提供相關資料。</li>\r\n<li>用戶應自行承擔因交易產生的相關費用，並依法納稅。</li>\r\n<li>未經本網站書面允許，用戶不得將本網站資料以及在交易平台上所展示的任何信息以復制、修改、翻譯等形式制作衍生作品、分發或公開展示。</li>\r\n<li>用戶同意接收來自本網站的信息，包括但不限于活動信息、交易信息、促銷信息等。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>四、 本網站的權利和義務</strong></p>\r\n<ol>\r\n<li>本網站不是傳統意義上的"拍賣商"，僅為用戶提供一個信息交流、進行物品買賣的平台，充當買賣雙方之間的交流媒介，而非買主或賣主的代理商、合伙  人、雇員或雇主等經營關系人。公布在本網站上的交易物品是用戶自行上傳進行交易的物品，並非本網站所有。對于用戶刊登物品、提供的信息或參與競標的過程，  本網站均不加以監視或控制，亦不介入物品的交易過程，包括運送、付款、退款、瑕疵擔保及其它交易事項，且不承擔因交易物品存在品質、權利上的瑕疵以及交易  方履行交易協議的能力而產生的任何責任，對于出現在拍賣上的物品品質、安全性或合法性，本網站均不予保證。</li>\r\n<li>本網站有義務在現有技術水平的基礎上努力確保整個網上交易平台的正常運行，盡力避免服務中斷或將中斷時間限制在最短時間內，保證用戶網上交易活動的順利進行。</li>\r\n<li>本網站有義務對用戶在注冊使用本網站網上交易平台中所遇到的問題及反映的情況及時作出回復。 </li>\r\n<li>本網站有權對用戶的注冊資料進行查閱，對存在任何問題或懷疑的注冊資料，本網站有權發出通知詢問用戶並要求用戶做出解釋、改正，或直接做出處罰、刪除等處理。</li>\r\n<li>用  戶因在本網站網上交易與其他用戶產生糾紛的，用戶通過司法部門或行政部門依照法定程序要求本網站提供相關資料，本網站將積極配合並提供有關資料；用戶將糾  紛告知本網站，或本網站知悉糾紛情況的，經審核後，本網站有權通過電子郵件及電話聯系向糾紛雙方了解糾紛情況，並將所了解的情況通過電子郵件互相通知對  方。 </li>\r\n<li>因網上交易平台的特殊性，本網站沒有義務對所有用戶的注冊資料、所有的交易行為以及與交易有關的其他事項進行事先審查，但如發生以下情形，本網站有權限制用戶的活動、向用戶核實有關資料、發出警告通知、暫時中止、無限期地中止及拒絕向該用戶提供服務︰          \r\n<ul>\r\n<li>用戶違反本協議或因被提及而納入本協議的文件；</li>\r\n<li>存在用戶或其他第三方通知本網站，認為某個用戶或具體交易事項存在違法或不當行為，並提供相關證據，而本網站無法聯系到該用戶核證或驗證該用戶向本網站提供的任何資料；</li>\r\n<li>存在用戶或其他第三方通知本網站，認為某個用戶或具體交易事項存在違法或不當行為，並提供相關證據。本網站以普通非專業交易者的知識水平標準對相關內容進行判別，可以明顯認為這些內容或行為可能對本網站用戶或本網站造成財務損失或法律責任。 </li>\r\n</ul>\r\n</li>\r\n<li>在反網絡欺詐行動中，本著保護廣大用戶利益的原則，當用戶舉報自己交易可能存在欺詐而產生交易爭議時，本網站有權通過表面判斷暫時凍結相關用戶賬號，並有權核對當事人身份資料及要求提供交易相關證明材料。</li>\r\n<li>根據國家法律法規、本協議的內容和本網站所掌握的事實依據，可以認定用戶存在違法或違反本協議行為以及在本網站交易平台上的其他不當行為，本網站有權在本網站交易平台及所在網站上以網絡發布形式公布用戶的違法行為，並有權隨時作出刪除相關信息，而無須征得用戶的同意。</li>\r\n<li>本  網站有權在不通知用戶的前提下刪除或采取其他限制性措施處理下列信息︰包括但不限于以規避費用為目的；以炒作信用為目的；存在欺詐等惡意或虛假內容；與網  上交易無關或不是以交易為目的；存在惡意競價或其他試圖擾亂正常交易秩序因素；該信息違反公共利益或可能嚴重損害本網站和其他用戶合法利益的。</li>\r\n<li>用  戶授予本網站獨家的、全球通用的、永久的、免費的信息許可使用權利，本網站有權對該權利進行再授權，依此授權本網站有權(全部或部份地)  使用、復制、修訂、改寫、發布、翻譯、分發、執行和展示用戶公示于網站的各類信息或制作其派生作品，以現在已知或日後開發的任何形式、媒體或技術，將上述  信息納入其他作品內。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>五、服務的中斷和終止</strong></p>\r\n<ol>\r\n<li>在  本網站未向用戶收取相關服務費用的情況下，本網站可自行全權決定以任何理由  (包括但不限于本網站認為用戶已違反本協議的字面意義和精神，或用戶在超過180天內未登錄本網站等)  終止對用戶的服務，並不再保存用戶在本網站的全部資料（包括但不限于用戶信息、商品信息、交易信息等）。同時本網站可自行全權決定，在發出通知或不發出通  知的情況下，隨時停止提供全部或部分服務。服務終止後，本網站沒有義務為用戶保留原用戶資料或與之相關的任何信息，或轉發任何未曾閱讀或發送的信息給用戶  或第三方。此外，本網站不就終止對用戶的服務而對用戶或任何第三方承擔任何責任。 </li>\r\n<li>如用戶向本網站提出注銷本網站注冊用戶身份，需經本網站審核同意，由本網站注銷該注冊用戶，用戶即解除與本網站的協議關系，但本網站仍保留下列權利︰          \r\n<ul>\r\n<li>用戶注銷後，本網站有權保留該用戶的資料,包括但不限于以前的用戶資料、店鋪資料、商品資料和交易記錄等。 </li>\r\n<li>用戶注銷後，如用戶在注銷前在本網站交易平台上存在違法行為或違反本協議的行為，本網站仍可行使本協議所規定的權利。 </li>\r\n</ul>\r\n</li>\r\n<li>如存在下列情況，本網站可以通過注銷用戶的方式終止服務︰          \r\n<ul>\r\n<li>在用戶違反本協議相關規定時，本網站有權終止向該用戶提供服務。本網站將在中斷服務時通知用戶。但如該用戶在被本網站終止提供服務後，再一次直接或間接或以他人名義注冊為本網站用戶的，本網站有權再次單方面終止為該用戶提供服務；</li>\r\n<li>一旦本網站發現用戶注冊資料中主要內容是虛假的，本網站有權隨時終止為該用戶提供服務； </li>\r\n<li>本協議終止或更新時，用戶未確認新的協議的。 </li>\r\n<li>其它本網站認為需終止服務的情況。 </li>\r\n</ul>\r\n</li>\r\n<li>因用戶違反相關法律法規或者違反本協議規定等原因而致使本網站中斷、終止對用戶服務的，對于服務中斷、終止之前用戶交易行為依下列原則處理︰          \r\n<ul>\r\n<li>本網站有權決定是否在中斷、終止對用戶服務前將用戶被中斷或終止服務的情況和原因通知用戶交易關系方，包括但不限于對該交易有意向但尚未達成交易的用戶,參與該交易競價的用戶，已達成交易要約用戶。</li>\r\n<li>服務中斷、終止之前，用戶已經上傳至本網站的物品尚未交易或交易尚未完成的，本網站有權在中斷、終止服務的同時刪除此項物品的相關信息。 </li>\r\n<li>服務中斷、終止之前，用戶已經就其他用戶出售的具體物品作出要約，但交易尚未結束，本網站有權在中斷或終止服務的同時刪除該用戶的相關要約和信息。</li>\r\n</ul>\r\n</li>\r\n<li>本網站若因用戶的行為（包括但不限于刊登的商品、在本網站社區發帖等）侵害了第三方的權利或違反了相關規定，而受到第三方的追償或受到主管機關的處分時，用戶應賠償本網站因此所產生的一切損失及費用。</li>\r\n<li>對違反相關法律法規或者違反本協議規定，且情節嚴重的用戶，本網站有權終止該用戶的其它服務。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>六、協議的修訂</strong><br /> <br /> 本協議可由本網站隨時修訂，並將修訂後的協議公告于本網站之上，修訂後的條款內容自公告時起生效，並成為本協議的一部分。用戶若在本協議修改之後，仍繼續使用本網站，則視為用戶接受和自願遵守修訂後的協議。本網站行使修改或中斷服務時，不需對任何第三方負責。<br /> <br /> <strong>七、 本網站的責任範圍 </strong><br /> <br /> 當用戶接受該協議時，用戶應明確了解並同意：</p>\r\n<ol>\r\n<li>是否經由本網站下載或取得任何資料，由用戶自行考慮、衡量並且自負風險，因下載任何資料而導致用戶電腦系統的任何損壞或資料流失，用戶應負完全責任。</li>\r\n<li>用戶經由本網站取得的建議和資訊，無論其形式或表現，絕不構成本協議未明示規定的任何保證。</li>\r\n<li>基于以下原因而造成的利潤、商譽、使用、資料損失或其它無形損失，本網站不承擔任何直接、間接、附帶、特別、衍生性或懲罰性賠償（即使本網站已被告知前款賠償的可能性）︰          \r\n<ul>\r\n<li>本網站的使用或無法使用。</li>\r\n<li>經由或通過本網站購買或取得的任何物品，或接收之信息，或進行交易所隨之產生的替代物品及服務的購買成本。</li>\r\n<li>用戶的傳輸或資料遭到未獲授權的存取或變更。</li>\r\n<li>本網站中任何第三方之聲明或行為。</li>\r\n<li>本網站其它相關事宜。</li>\r\n</ul>\r\n</li>\r\n<li>本網站只是為用戶提供一個交易的平台，對于用戶所刊登的交易物品的合法性、真實性及其品質，以及用戶履行交易的能力等，本網站一律不負任何擔保責任。用戶如果因使用本網站，或因購買刊登于本網站的任何物品，而受有損害時，本網站不負任何補償或賠償責任。</li>\r\n<li>本  網站提供與其它互聯網上的網站或資源的鏈接，用戶可能會因此連結至其它運營商經營的網站，但不表示本網站與這些運營商有任何關系。其它運營商經營的網站均  由各經營者自行負責，不屬于本網站控制及負責範圍之內。對于存在或來源于此類網站或資源的任何內容、廣告、產品或其它資料，本網站亦不予保證或負責。因使  用或依賴任何此類網站或資源發布的或經由此類網站或資源獲得的任何內容、物品或服務所產生的任何損害或損失，本網站不負任何直接或間接的責任。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>八.、不可抗力</strong><br /> <br /> 因不可抗力或者其他意外事件，使得本協議的履行不可能、不必要或者無意義的，雙方均不承擔責任。本合同所稱之不可抗力意指不能預見、不能避免並不能克服的  客觀情況，包括但不限于戰爭、台風、水災、火災、雷擊或地震、罷工、暴動、法定疾病、黑客攻擊、網絡病毒、電信部門技術管制、政府行為或任何其它自然或人  為造成的災難等客觀情況。<br /> <br /> <strong>九、爭議解決方式</strong></p>\r\n<ol>\r\n<li>本協議及其修訂本的有效性、履行和與本協議及其修訂本效力有關的所有事宜，將受中華人民共和國法律管轄，任何爭議僅適用中華人民共和國法律。</li>\r\n<li>因  使用本網站服務所引起與本網站的任何爭議，均應提交深圳仲裁委員會按照該會屆時有效的仲裁規則進行仲裁。相關爭議應單獨仲裁，不得與任何其它方的爭議在任  何仲裁中合並處理，該仲裁裁決是終局，對各方均有約束力。如果所涉及的爭議不適于仲裁解決，用戶同意一切爭議由人民法院管轄。</li>\r\n</ol>', 0, 0, 1240122848),
(2, 'cert_autonym', 'Xác thực tên thật là gì', 3, 0, '', '<p><strong>什麼是實名認證？</strong></p>\r\n<p>&ldquo;認證店鋪&rdquo;服務是一項對店主身份真實性識別服務。店主可以通過站內PM、電話或管理員EMail的方式 聯系並申請該項認證。經過管理員審核確認了店主的真實身份，就可以開通該項認證。</p>\r\n<p>通過該認證，可以說明店主身份的真實有效性，為買家在網絡交易的過程中提供一定的信心和保證。</p>\r\n<p><strong>認證申請的方式︰</strong></p>\r\n<p>Email︰XXXX@XX.com</p>\r\n<p>管理員︰XXXXXX</p>', 0, 0, 1240122848),
(3, 'cert_material', '什麼是實體店鋪認證', 3, 0, '', '<p><strong>什麼是實體店鋪認證？</strong></p>\r\n<p>&ldquo;認證店鋪&rdquo;服務是一項對店主身份真實性識別服務。店主可以通過站內PM、電話或管理員EMail的方式 聯系並申請該項認證。經過管理員審核確認了店主的真實身份，就可以開通該項認證。</p>\r\n<p>通過該認證，可以說明店主身份的真實有效性，為買家在網絡交易的過程中提供一定的信心和保證。</p>\r\n<p><strong>認證申請的方式︰</strong></p>\r\n<p>Email︰XXXX@XX.com</p>\r\n<p>管理員︰XXXXXX</p>', 255, 1, 1240122848),
(4, 'setup_store', '開店協議', 3, 0, '', '<p>使用本公司服務所須遵守的條款和條件。<br /><br />1.用戶資格<br />本公司的服務僅向適用法律下能夠簽訂具有法律約束力的合同的個人提供並僅由其使用。在不限制前述規定的前提下，本公司的服務不向18周歲以下或被臨時或無限期中止的用戶提供。如您不合資格，請勿使用本公司的服務。此外，您的帳戶（包括信用評價）和用戶名不得向其他方轉讓或出售。另外，本公司保留根據其意願中止或終止您的帳戶的權利。<br /><br />2.您的資料（包括但不限于所添加的任何商品）不得︰<br />*具有欺詐性、虛假、不準確或具誤導性；<br />*侵犯任何第三方著作權、專利權、商標權、商業秘密或其他專有權利或發表權或隱私權；<br />*違反任何適用的法律或法規（包括但不限于有關出口管制、消費者保護、不正當競爭、刑法、反歧視或貿易慣例/公平貿易法律的法律或法規）；<br />*有侮辱或者誹謗他人，侵害他人合法權益的內容；<br />*有淫穢、色情、賭博、暴力、凶殺、恐怖或者教唆犯罪的內容；<br />*包含可能破壞、改變、刪除、不利影響、秘密截取、未經授權而接觸或征用任何系統、數據或個人資料的任何病毒、特洛依木馬、蠕蟲、定時炸彈、刪除蠅、復活節彩蛋、間諜軟件或其他電腦程序；<br /><br />3.違約<br />如發生以下情形，本公司可能限制您的活動、立即刪除您的商品、向本公司社區發出有關您的行為的警告、發出警告通知、暫時中止、無限期地中止或終止您的用戶資格及拒絕向您提供服務︰<br />(a)您違反本協議或納入本協議的文件；<br />(b)本公司無法核證或驗證您向本公司提供的任何資料；<br />(c)本公司相信您的行為可能對您、本公司用戶或本公司造成損失或法律責任。<br /><br />4.責任限制<br />本公司、本公司的關聯公司和相關實體或本公司的供應商在任何情況下均不就因本公司的網站、本公司的服務或本協議而產生或與之有關的利潤損失或任何特別、間接或後果性的損害（無論以何種方式產生，包括疏忽）承擔任何責任。您同意您就您自身行為之合法性單獨承擔責任。您同意，本公司和本公司的所有關聯公司和相關實體對本公司用戶的行為的合法性及產生的任何結果不承擔責任。<br /><br />5.無代理關系<br />用戶和本公司是獨立的合同方，本協議無意建立也沒有創立任何代理、合伙、合營、雇員與雇主或特許經營關系。本公司也不對任何用戶及其網上交易行為做出明示或默許的推薦、承諾或擔保。<br /><br />6.一般規定<br />本協議在所有方面均受中華人民共和國法律管轄。本協議的規定是可分割的，如本協議任何規定被裁定為無效或不可執行，該規定可被刪除而其余條款應予以執行。</p>', 255, 1, 1240122848),
(5, 'msn_privacy', 'MSN在線通隱私策略', 3, 0, '', '<p>Msn在線通隱私策略旨在說明您在本網站使用Msn在線通功能時我們如何保護您的Msn帳號信息。<br /> 我們認為隱私權非常重要。我們希望此隱私保護中心有助于您在本網站更好使用Msn在線通<br /> <strong>我們收集的信息</strong></p><blockquote>* 您在本網站激活Msn在線通時,程序將會記錄您的Msn在線通帳號</blockquote><p><br /> <strong>您的選擇</strong></p><blockquote>* 您可以在本網站隨時注銷您的Msn在線通帳號</blockquote><p><br /> <strong>其他隱私聲明</strong></p><blockquote>* 如果我們需要改變本網站Msn在線通的隱私策略, 我們會把相關的改動在此頁面發布.</blockquote>', 255, 1, 1240122848);

-- --------------------------------------------------------

--
-- Table structure for table `ecm_attribute`
--

CREATE TABLE IF NOT EXISTS `ecm_attribute` (
  `attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attr_name` varchar(60) NOT NULL DEFAULT '',
  `input_mode` varchar(10) NOT NULL DEFAULT 'text',
  `def_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`attr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ecm_attribute`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_brand`
--

CREATE TABLE IF NOT EXISTS `ecm_brand` (
  `brand_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(100) NOT NULL DEFAULT '',
  `brand_logo` varchar(255) DEFAULT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `if_show` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `tag` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`brand_id`),
  KEY `tag` (`tag`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ecm_brand`
--

INSERT INTO `ecm_brand` (`brand_id`, `brand_name`, `brand_logo`, `sort_order`, `recommended`, `store_id`, `if_show`, `tag`) VALUES
(1, 'Nokia', NULL, 255, 0, 0, 1, 'Nokia'),
(2, 'HTC', NULL, 255, 0, 0, 1, 'HTC'),
(3, 'Apple', NULL, 255, 0, 0, 1, 'Apple');

-- --------------------------------------------------------

--
-- Table structure for table `ecm_cart`
--

CREATE TABLE IF NOT EXISTS `ecm_cart` (
  `rec_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(255) NOT NULL DEFAULT '',
  `spec_id` int(10) unsigned NOT NULL DEFAULT '0',
  `specification` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `goods_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `session_id` (`session_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ecm_cart`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_category_goods`
--

CREATE TABLE IF NOT EXISTS `ecm_category_goods` (
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cate_id`,`goods_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecm_category_goods`
--

INSERT INTO `ecm_category_goods` (`cate_id`, `goods_id`) VALUES
(1, 1),
(7, 2),
(79, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ecm_category_store`
--

CREATE TABLE IF NOT EXISTS `ecm_category_store` (
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cate_id`,`store_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecm_category_store`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_collect`
--

CREATE TABLE IF NOT EXISTS `ecm_collect` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL DEFAULT 'goods',
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `keyword` varchar(60) DEFAULT NULL,
  `add_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`,`type`,`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecm_collect`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_coupon`
--

CREATE TABLE IF NOT EXISTS `ecm_coupon` (
  `coupon_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `coupon_name` varchar(100) NOT NULL DEFAULT '',
  `coupon_value` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `use_times` int(10) unsigned NOT NULL DEFAULT '0',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0',
  `min_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `if_issue` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`coupon_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ecm_coupon`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_coupon_sn`
--

CREATE TABLE IF NOT EXISTS `ecm_coupon_sn` (
  `coupon_sn` varchar(20) NOT NULL,
  `coupon_id` int(10) unsigned NOT NULL DEFAULT '0',
  `remain_times` int(10) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`coupon_sn`),
  KEY `coupon_id` (`coupon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecm_coupon_sn`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_friend`
--

CREATE TABLE IF NOT EXISTS `ecm_friend` (
  `owner_id` int(10) unsigned NOT NULL DEFAULT '0',
  `friend_id` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`owner_id`,`friend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecm_friend`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_function`
--

CREATE TABLE IF NOT EXISTS `ecm_function` (
  `func_code` varchar(20) NOT NULL DEFAULT '',
  `func_name` varchar(60) NOT NULL DEFAULT '',
  `privileges` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`func_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecm_function`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_gcategory`
--

CREATE TABLE IF NOT EXISTS `ecm_gcategory` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cate_name` varchar(100) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `if_show` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`cate_id`),
  KEY `store_id` (`store_id`,`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=80 ;

--
-- Dumping data for table `ecm_gcategory`
--

INSERT INTO `ecm_gcategory` (`cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show`) VALUES
(1, 2, 'Điện thoại', 0, 1, 1),
(2, 2, 'Máy nghe nhạc', 0, 2, 1),
(3, 0, 'Điện thoại - Viễn Thông', 0, 255, 1),
(4, 0, 'Nokia', 3, 255, 1),
(5, 2, 'Phụ kiện máy tính', 0, 255, 1),
(6, 2, 'Chuột - Bàn phím máy tính', 5, 255, 1),
(7, 2, 'Nokia', 1, 255, 1),
(8, 2, 'HTC', 1, 255, 1),
(9, 0, 'Sony', 3, 255, 1),
(10, 0, 'Samsung', 3, 255, 1),
(11, 0, 'LG', 3, 255, 1),
(12, 0, 'Q-Mobile', 3, 255, 1),
(13, 0, 'J-Mobile', 3, 255, 1),
(14, 0, 'Apple', 3, 255, 1),
(15, 0, 'HTC', 3, 255, 1),
(16, 0, 'BenQ-Simen', 3, 255, 1),
(17, 0, 'Motorola', 3, 255, 1),
(18, 0, 'Điện thoại China', 3, 255, 1),
(19, 0, 'Máy tính - Linh kiện', 0, 255, 1),
(20, 0, 'Máy vi tính', 19, 255, 1),
(21, 0, 'Máy tính Laptop', 20, 255, 1),
(22, 0, 'Máy tính Destop', 20, 255, 1),
(23, 0, 'Server ( Máy chủ )', 20, 255, 1),
(24, 0, 'Dich vụ IT', 19, 255, 1),
(25, 0, 'Linh kiện Server', 19, 255, 1),
(26, 0, 'Thiết bị cho máy tính', 19, 255, 1),
(27, 0, 'Thiết bị mạng', 19, 255, 1),
(28, 0, 'Máy văn phòng', 19, 255, 1),
(29, 0, 'Linh kiện máy tính Desktop', 19, 255, 1),
(30, 0, 'Linh kiện máy tính Laptop', 19, 255, 1),
(31, 0, 'Cặp, túi đựng Laptop', 30, 255, 1),
(32, 0, 'Pin Laptop', 30, 255, 1),
(33, 0, 'Màn hình Laptop', 30, 255, 1),
(34, 0, 'Đồ chơi Laptop', 30, 255, 1),
(35, 0, 'Video Card', 29, 255, 1),
(36, 0, 'Main Board', 29, 255, 1),
(37, 0, 'Thùng, vỏ máy tính', 29, 255, 1),
(38, 0, 'Power - nguồn điện', 29, 255, 1),
(39, 0, 'Ram', 29, 255, 1),
(40, 0, 'HDD desktop', 29, 255, 1),
(41, 0, 'CPU Desktop', 29, 255, 1),
(42, 0, 'Điện tử - Nhạc cụ', 0, 255, 1),
(43, 0, 'Máy ảnh - Máy quay', 0, 255, 1),
(44, 0, 'Oto - Xe máy - Xe đạp', 0, 255, 1),
(45, 0, 'Công nghiệp - Xây dựng', 0, 255, 1),
(46, 0, 'Hàng thời trang', 0, 255, 1),
(47, 0, 'Đồ dùng sinh hoạt', 0, 255, 1),
(48, 0, 'Mẹ & Bé', 0, 255, 1),
(49, 0, 'Sách - Đồ văn phòng', 0, 255, 1),
(50, 0, 'Sức khoẻ - Sắc đẹp', 0, 255, 1),
(51, 0, 'Hoa - Quà tặng - Đồ chơi', 0, 255, 1),
(52, 0, 'Nội thất - Ngoại thất', 0, 255, 1),
(53, 0, 'Thực phẩm - Đồ uống', 0, 255, 1),
(54, 0, 'Bất động sản', 0, 255, 1),
(55, 0, 'Dịch vụ - Giải trí - Du lịch', 0, 255, 1),
(56, 0, 'Đồ cho bé khi ra ngoài', 48, 255, 1),
(57, 0, 'Đồ cho mẹ', 48, 255, 1),
(58, 0, 'Tắm gội , vệ sinh, an toàn', 48, 255, 1),
(59, 0, 'Bỉm cho trẻ', 48, 255, 1),
(60, 0, 'Quần áo', 48, 255, 1),
(61, 0, 'Đồ dùng trẻ em', 48, 255, 1),
(62, 0, 'Dụng cụ ăn uống', 48, 255, 1),
(63, 0, 'Thời trang nữ', 46, 255, 1),
(64, 0, 'Thời trang nam', 46, 255, 1),
(65, 0, 'Thời trang trẻ em', 46, 255, 1),
(66, 0, 'Giầy dép', 46, 255, 1),
(67, 0, 'Quần áo đồng phục', 46, 255, 1),
(68, 0, 'Túi sách - Cặp đựng - Ví', 46, 255, 1),
(69, 0, 'Đồ trang sức', 46, 255, 1),
(70, 0, 'Máy ảnh, máy quay', 43, 255, 1),
(71, 0, 'Thiết bị liên quan', 43, 255, 1),
(72, 0, 'Dịch vụ chụp, rửa ảnh', 43, 255, 1),
(73, 0, 'Điện tử, điện lạnh', 42, 255, 1),
(74, 0, 'Hình ảnh', 42, 255, 1),
(75, 0, 'Âm thanh', 42, 255, 1),
(76, 0, 'Thiết bị an ninh', 42, 255, 1),
(77, 0, 'Nhạc cụ', 42, 255, 1),
(78, 0, 'Thiết bị truyền hình', 42, 255, 1),
(79, 2, 'Thời trang nữ', 0, 255, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ecm_goods`
--

CREATE TABLE IF NOT EXISTS `ecm_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL DEFAULT 'material',
  `goods_name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cate_name` varchar(255) NOT NULL DEFAULT '',
  `brand` varchar(100) NOT NULL,
  `spec_qty` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `spec_name_1` varchar(60) NOT NULL DEFAULT '',
  `spec_name_2` varchar(60) NOT NULL DEFAULT '',
  `if_show` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `closed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `close_reason` varchar(255) DEFAULT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0',
  `default_spec` int(11) unsigned NOT NULL DEFAULT '0',
  `default_image` varchar(255) NOT NULL DEFAULT '',
  `recommended` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `cate_id_1` int(10) unsigned NOT NULL DEFAULT '0',
  `cate_id_2` int(10) unsigned NOT NULL DEFAULT '0',
  `cate_id_3` int(10) unsigned NOT NULL DEFAULT '0',
  `cate_id_4` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tags` varchar(102) NOT NULL,
  PRIMARY KEY (`goods_id`),
  KEY `store_id` (`store_id`),
  KEY `cate_id` (`cate_id`),
  KEY `cate_id_1` (`cate_id_1`),
  KEY `cate_id_2` (`cate_id_2`),
  KEY `cate_id_3` (`cate_id_3`),
  KEY `cate_id_4` (`cate_id_4`),
  KEY `brand` (`brand`(10)),
  KEY `tags` (`tags`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ecm_goods`
--

INSERT INTO `ecm_goods` (`goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `tags`) VALUES
(1, 2, 'material', 'Nokia 1200', '<p>* H&atilde;ng sản xuất Nokia</p>\r\n<p>&nbsp;</p>', 3, 'Điện thoại', 'Nokia', 0, '', '', 1, 0, '', 1313289745, 1313289745, 1, 'data/files/store_2/goods_97/small_201108141631378507.jpg', 1, 3, 0, 0, 0, '260000.00', ',Nokia 1200,'),
(2, 2, 'material', 'Nokia 1202', '<p>* H&atilde;ng sản xuất Nokia</p>\r\n<p>* Pin bền, s&oacute;ng khoẻ</p>\r\n<p>* Hỗ trợ đ&egrave;n pin ...</p>', 4, 'Điện thoại	Nokia', 'Nokia', 0, '', '', 1, 0, NULL, 1313319717, 1313319717, 2, 'data/files/store_2/goods_96/small_201108150101366208.jpg', 1, 3, 4, 0, 0, '360000.00', ',Nokia 1202,'),
(3, 2, 'material', 'Đầm ngắn DN019', '<p>* V&aacute;y nữ</p>', 63, 'Hàng thời trang	Thời trang nữ', 'Đầm ngắn DN019', 0, '', '', 1, 0, NULL, 1313325977, 1313325977, 3, 'data/files/store_2/goods_93/small_201108150244536600.jpg', 1, 46, 63, 0, 0, '1750.00', ',Đầm ngắn DN019,');

-- --------------------------------------------------------

--
-- Table structure for table `ecm_goods_attr`
--

CREATE TABLE IF NOT EXISTS `ecm_goods_attr` (
  `gattr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attr_name` varchar(60) NOT NULL DEFAULT '',
  `attr_value` varchar(255) NOT NULL DEFAULT '',
  `attr_id` int(10) unsigned DEFAULT NULL,
  `sort_order` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`gattr_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ecm_goods_attr`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_goods_image`
--

CREATE TABLE IF NOT EXISTS `ecm_goods_image` (
  `image_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `image_url` varchar(255) NOT NULL DEFAULT '',
  `thumbnail` varchar(255) NOT NULL DEFAULT '',
  `sort_order` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `file_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`image_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ecm_goods_image`
--

INSERT INTO `ecm_goods_image` (`image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id`) VALUES
(1, 1, 'data/files/store_2/goods_97/201108141631378507.jpg', 'data/files/store_2/goods_97/small_201108141631378507.jpg', 1, 1),
(2, 2, 'data/files/store_2/goods_96/201108150101366208.jpg', 'data/files/store_2/goods_96/small_201108150101366208.jpg', 1, 3),
(3, 3, 'data/files/store_2/goods_93/201108150244536600.jpg', 'data/files/store_2/goods_93/small_201108150244536600.jpg', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ecm_goods_qa`
--

CREATE TABLE IF NOT EXISTS `ecm_goods_qa` (
  `ques_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_content` varchar(255) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `email` varchar(60) NOT NULL,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `item_name` varchar(255) NOT NULL DEFAULT '',
  `reply_content` varchar(255) NOT NULL,
  `time_post` int(10) unsigned NOT NULL,
  `time_reply` int(10) unsigned NOT NULL,
  `if_new` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `type` varchar(10) NOT NULL DEFAULT 'goods',
  PRIMARY KEY (`ques_id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`item_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ecm_goods_qa`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_goods_spec`
--

CREATE TABLE IF NOT EXISTS `ecm_goods_spec` (
  `spec_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `spec_1` varchar(60) NOT NULL DEFAULT '',
  `spec_2` varchar(60) NOT NULL DEFAULT '',
  `color_rgb` varchar(7) NOT NULL DEFAULT '',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `stock` int(11) NOT NULL DEFAULT '0',
  `sku` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`spec_id`),
  KEY `goods_id` (`goods_id`),
  KEY `price` (`price`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ecm_goods_spec`
--

INSERT INTO `ecm_goods_spec` (`spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku`) VALUES
(1, 1, '', '', '', '260000.00', 0, ''),
(2, 2, '', '', '', '360000.00', 0, ''),
(3, 3, '', '', '', '1750.00', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `ecm_goods_statistics`
--

CREATE TABLE IF NOT EXISTS `ecm_goods_statistics` (
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `collects` int(10) unsigned NOT NULL DEFAULT '0',
  `carts` int(10) unsigned NOT NULL DEFAULT '0',
  `orders` int(10) unsigned NOT NULL DEFAULT '0',
  `sales` int(10) unsigned NOT NULL DEFAULT '0',
  `comments` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecm_goods_statistics`
--

INSERT INTO `ecm_goods_statistics` (`goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments`) VALUES
(1, 3, 0, 0, 0, 0, 0),
(2, 0, 0, 0, 0, 0, 0),
(3, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ecm_groupbuy`
--

CREATE TABLE IF NOT EXISTS `ecm_groupbuy` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL DEFAULT '',
  `group_desc` varchar(255) NOT NULL DEFAULT '',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `spec_price` text NOT NULL,
  `min_quantity` smallint(5) unsigned NOT NULL DEFAULT '0',
  `max_per_user` smallint(5) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`),
  KEY `goods_id` (`goods_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ecm_groupbuy`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_groupbuy_log`
--

CREATE TABLE IF NOT EXISTS `ecm_groupbuy_log` (
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `quantity` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spec_quantity` text NOT NULL,
  `linkman` varchar(60) NOT NULL DEFAULT '',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecm_groupbuy_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_mail_queue`
--

CREATE TABLE IF NOT EXISTS `ecm_mail_queue` (
  `queue_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mail_to` varchar(150) NOT NULL DEFAULT '',
  `mail_encoding` varchar(50) NOT NULL DEFAULT '',
  `mail_subject` varchar(255) NOT NULL DEFAULT '',
  `mail_body` text NOT NULL,
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `err_num` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL DEFAULT '0',
  `lock_expiry` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`queue_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ecm_mail_queue`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_member`
--

CREATE TABLE IF NOT EXISTS `ecm_member` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `real_name` varchar(60) DEFAULT NULL,
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `birthday` date DEFAULT NULL,
  `phone_tel` varchar(60) DEFAULT NULL,
  `phone_mob` varchar(60) DEFAULT NULL,
  `im_qq` varchar(60) DEFAULT NULL,
  `im_msn` varchar(60) DEFAULT NULL,
  `im_skype` varchar(60) DEFAULT NULL,
  `im_yahoo` varchar(60) DEFAULT NULL,
  `im_aliww` varchar(60) DEFAULT NULL,
  `reg_time` int(10) unsigned DEFAULT '0',
  `last_login` int(10) unsigned DEFAULT NULL,
  `last_ip` varchar(15) DEFAULT NULL,
  `logins` int(10) unsigned NOT NULL DEFAULT '0',
  `ugrade` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `portrait` varchar(255) DEFAULT NULL,
  `outer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `activation` varchar(60) DEFAULT NULL,
  `feed_config` text NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_name` (`user_name`),
  KEY `email` (`email`),
  KEY `outer_id` (`outer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ecm_member`
--

INSERT INTO `ecm_member` (`user_id`, `user_name`, `email`, `password`, `real_name`, `gender`, `birthday`, `phone_tel`, `phone_mob`, `im_qq`, `im_msn`, `im_skype`, `im_yahoo`, `im_aliww`, `reg_time`, `last_login`, `last_ip`, `logins`, `ugrade`, `portrait`, `outer_id`, `activation`, `feed_config`) VALUES
(1, 'thanhtc84', 'thanhtc84@gmail.com', 'a66abb5684c45962d887564f08346e8d', 'Trần Công Thành', 0, NULL, NULL, NULL, '', '', NULL, NULL, NULL, 1313276676, 1313773909, '0.0.0.0', 6, 0, '', 0, NULL, ''),
(2, 'thanhtcbkhn', 'thanhtc_bkhn@yahoo.com', '2ef8f62b46cb6ad90b0d45cc17bbf5ef', 'Trần Công Thành', 1, '0000-00-00', NULL, NULL, '', '', NULL, NULL, NULL, 1313278126, 1313303819, '113.190.141.14', 2, 0, NULL, 0, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `ecm_message`
--

CREATE TABLE IF NOT EXISTS `ecm_message` (
  `msg_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_id` int(10) unsigned NOT NULL DEFAULT '0',
  `to_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0',
  `new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_id`),
  KEY `from_id` (`from_id`),
  KEY `to_id` (`to_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ecm_message`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_module`
--

CREATE TABLE IF NOT EXISTS `ecm_module` (
  `module_id` varchar(30) NOT NULL DEFAULT '',
  `module_name` varchar(100) NOT NULL DEFAULT '',
  `module_version` varchar(5) NOT NULL DEFAULT '',
  `module_desc` text NOT NULL,
  `module_config` text NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecm_module`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_navigation`
--

CREATE TABLE IF NOT EXISTS `ecm_navigation` (
  `nav_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL DEFAULT '',
  `title` varchar(60) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `open_new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nav_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ecm_navigation`
--

INSERT INTO `ecm_navigation` (`nav_id`, `type`, `title`, `link`, `sort_order`, `open_new`) VALUES
(1, 'header', 'Điện tử', 'http://', 255, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ecm_order`
--

CREATE TABLE IF NOT EXISTS `ecm_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(20) NOT NULL DEFAULT '',
  `type` varchar(10) NOT NULL DEFAULT 'material',
  `extension` varchar(10) NOT NULL DEFAULT '',
  `seller_id` int(10) unsigned NOT NULL DEFAULT '0',
  `seller_name` varchar(100) DEFAULT NULL,
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `buyer_name` varchar(100) DEFAULT NULL,
  `buyer_email` varchar(60) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `payment_id` int(10) unsigned DEFAULT NULL,
  `payment_name` varchar(100) DEFAULT NULL,
  `payment_code` varchar(20) NOT NULL DEFAULT '',
  `out_trade_sn` varchar(20) NOT NULL DEFAULT '',
  `pay_time` int(10) unsigned DEFAULT NULL,
  `pay_message` varchar(255) NOT NULL DEFAULT '',
  `ship_time` int(10) unsigned DEFAULT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `finished_time` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `discount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `evaluation_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `evaluation_time` int(10) unsigned NOT NULL DEFAULT '0',
  `anonymous` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `postscript` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`order_id`),
  KEY `order_sn` (`order_sn`,`seller_id`),
  KEY `seller_name` (`seller_name`),
  KEY `buyer_name` (`buyer_name`),
  KEY `add_time` (`add_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ecm_order`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_order_extm`
--

CREATE TABLE IF NOT EXISTS `ecm_order_extm` (
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `consignee` varchar(60) NOT NULL DEFAULT '',
  `region_id` int(10) unsigned DEFAULT NULL,
  `region_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zipcode` varchar(20) DEFAULT NULL,
  `phone_tel` varchar(60) DEFAULT NULL,
  `phone_mob` varchar(60) DEFAULT NULL,
  `shipping_id` int(10) unsigned DEFAULT NULL,
  `shipping_name` varchar(100) DEFAULT NULL,
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`order_id`),
  KEY `consignee` (`consignee`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecm_order_extm`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_order_goods`
--

CREATE TABLE IF NOT EXISTS `ecm_order_goods` (
  `rec_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(255) NOT NULL DEFAULT '',
  `spec_id` int(10) unsigned NOT NULL DEFAULT '0',
  `specification` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `goods_image` varchar(255) DEFAULT NULL,
  `evaluation` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) NOT NULL DEFAULT '',
  `credit_value` tinyint(1) NOT NULL DEFAULT '0',
  `is_valid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`rec_id`),
  KEY `order_id` (`order_id`,`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ecm_order_goods`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_order_log`
--

CREATE TABLE IF NOT EXISTS `ecm_order_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `operator` varchar(60) NOT NULL DEFAULT '',
  `order_status` varchar(60) NOT NULL DEFAULT '',
  `changed_status` varchar(60) NOT NULL DEFAULT '',
  `remark` varchar(255) DEFAULT NULL,
  `log_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ecm_order_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_pageview`
--

CREATE TABLE IF NOT EXISTS `ecm_pageview` (
  `rec_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `view_date` date NOT NULL DEFAULT '0000-00-00',
  `view_times` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `storedate` (`store_id`,`view_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ecm_pageview`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_partner`
--

CREATE TABLE IF NOT EXISTS `ecm_partner` (
  `partner_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) DEFAULT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`partner_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ecm_partner`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_payment`
--

CREATE TABLE IF NOT EXISTS `ecm_payment` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `payment_code` varchar(20) NOT NULL DEFAULT '',
  `payment_name` varchar(100) NOT NULL DEFAULT '',
  `payment_desc` varchar(255) DEFAULT NULL,
  `config` text,
  `is_online` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`payment_id`),
  KEY `store_id` (`store_id`),
  KEY `payment_code` (`payment_code`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ecm_payment`
--

INSERT INTO `ecm_payment` (`payment_id`, `store_id`, `payment_code`, `payment_name`, `payment_desc`, `config`, `is_online`, `enabled`, `sort_order`) VALUES
(1, 2, 'post', 'Bưu điện chuyển tiền', 'Chuyển tiền qua bưu điện cho chúng tôi, chúng tôi sẽ chuyển hàng cho bạn trong thời gian sớm nhất', '', 0, 1, 0),
(2, 2, 'bank', 'Ngân hàng chuyển', 'Bạn chuyển hàng qua tài khoản sau cho chúng tôi', '', 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ecm_privilege`
--

CREATE TABLE IF NOT EXISTS `ecm_privilege` (
  `priv_code` varchar(20) NOT NULL DEFAULT '',
  `priv_name` varchar(60) NOT NULL DEFAULT '',
  `parent_code` varchar(20) DEFAULT NULL,
  `owner` varchar(10) NOT NULL DEFAULT 'mall',
  PRIMARY KEY (`priv_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecm_privilege`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_recommend`
--

CREATE TABLE IF NOT EXISTS `ecm_recommend` (
  `recom_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recom_name` varchar(100) NOT NULL DEFAULT '',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`recom_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ecm_recommend`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_recommended_goods`
--

CREATE TABLE IF NOT EXISTS `ecm_recommended_goods` (
  `recom_id` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`recom_id`,`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecm_recommended_goods`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_region`
--

CREATE TABLE IF NOT EXISTS `ecm_region` (
  `region_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region_name` varchar(100) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`region_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `ecm_region`
--

INSERT INTO `ecm_region` (`region_id`, `region_name`, `parent_id`, `sort_order`) VALUES
(1, 'TP.HCM', 0, 255),
(2, 'Hà Nội', 0, 255),
(3, 'Quận Đống Đa', 2, 255),
(4, 'Quận Thanh Xuân', 2, 255),
(5, 'Quận Long Biên', 2, 255),
(6, 'Quận Hoàng Mai', 2, 255),
(7, 'Quận Cầu Giấy', 2, 255),
(8, 'Quận Hoàn Kiếm', 2, 255),
(9, 'Quận Tây Hồ', 2, 255),
(10, 'Nam Định', 0, 255),
(11, 'Thái Bình', 0, 255),
(12, 'Ninh Bình', 0, 255),
(13, 'Thanh Hoá', 0, 255),
(14, 'Hải Dương', 0, 255),
(15, 'Hưng Yên', 0, 255),
(16, 'Bắc Ninh', 0, 255),
(17, 'Bắc Giang', 0, 255),
(18, 'Lạng Sơn', 0, 255),
(19, 'Vĩnh Phúc', 0, 255),
(20, 'Phú Thọ', 0, 255),
(21, 'Tuyên Quang', 0, 255),
(22, 'Yên Bái', 0, 255),
(23, 'Bắc Cạn', 0, 255),
(24, 'Thái Nguyên', 0, 255),
(25, 'Nghệ An', 0, 255),
(26, 'Hà Tĩnh', 0, 255),
(27, 'Quảng Bình', 0, 255),
(28, 'Quảng Trị', 0, 255),
(29, 'Thừa Thiên Huế', 0, 255),
(30, 'Đà Nẵng', 0, 255),
(31, 'Quy Nhơn', 0, 255),
(32, 'Phan Thiết', 0, 255),
(33, 'Đắc Lắc', 0, 255),
(34, 'Cần Thơ', 0, 255),
(35, 'Cà Mau', 0, 255),
(36, 'Vũng Tàu', 0, 255);

-- --------------------------------------------------------

--
-- Table structure for table `ecm_scategory`
--

CREATE TABLE IF NOT EXISTS `ecm_scategory` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(100) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`cate_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ecm_scategory`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_sessions`
--

CREATE TABLE IF NOT EXISTS `ecm_sessions` (
  `sesskey` char(32) NOT NULL DEFAULT '',
  `expiry` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `adminid` int(11) NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL DEFAULT '',
  `data` char(255) NOT NULL DEFAULT '',
  `is_overflow` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sesskey`),
  KEY `expiry` (`expiry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecm_sessions`
--

INSERT INTO `ecm_sessions` (`sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow`) VALUES
('aa1ee858b2e578fcc05402f0f4f362ef', 1313775355, 0, 0, '0.0.0.0', 'admin_info|a:5:{s:7:"user_id";s:1:"1";s:9:"user_name";s:9:"thanhtc84";s:8:"reg_time";s:10:"1313276676";s:10:"last_login";s:10:"1313773784";s:7:"last_ip";s:7:"0.0.0.0";}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ecm_sessions_data`
--

CREATE TABLE IF NOT EXISTS `ecm_sessions_data` (
  `sesskey` varchar(32) NOT NULL DEFAULT '',
  `expiry` int(11) NOT NULL DEFAULT '0',
  `data` longtext NOT NULL,
  PRIMARY KEY (`sesskey`),
  KEY `expiry` (`expiry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecm_sessions_data`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_sgrade`
--

CREATE TABLE IF NOT EXISTS `ecm_sgrade` (
  `grade_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `grade_name` varchar(60) NOT NULL DEFAULT '',
  `goods_limit` int(10) unsigned NOT NULL DEFAULT '0',
  `space_limit` int(10) unsigned NOT NULL DEFAULT '0',
  `skin_limit` int(10) unsigned NOT NULL DEFAULT '0',
  `charge` varchar(100) NOT NULL DEFAULT '',
  `need_confirm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `functions` varchar(255) DEFAULT NULL,
  `skins` text NOT NULL,
  `sort_order` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`grade_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ecm_sgrade`
--

INSERT INTO `ecm_sgrade` (`grade_id`, `grade_name`, `goods_limit`, `space_limit`, `skin_limit`, `charge`, `need_confirm`, `description`, `functions`, `skins`, `sort_order`) VALUES
(1, 'mặc định', 5, 2, 1, '100.000 vnđ / năm', 0, 'Kiểm tra người sử dụng chọn "Default Level", bạn có thể mở ngay lập tức.', '', 'default|default', 255);

-- --------------------------------------------------------

--
-- Table structure for table `ecm_shipping`
--

CREATE TABLE IF NOT EXISTS `ecm_shipping` (
  `shipping_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `shipping_name` varchar(100) NOT NULL DEFAULT '',
  `shipping_desc` varchar(255) DEFAULT NULL,
  `first_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `step_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cod_regions` text,
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`shipping_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ecm_shipping`
--

INSERT INTO `ecm_shipping` (`shipping_id`, `store_id`, `shipping_name`, `shipping_desc`, `first_price`, `step_price`, `cod_regions`, `enabled`, `sort_order`) VALUES
(1, 2, 'Giao hàng qua oto vận chuyển', 'chúng tôi sẽ gửi hàng bằng xe mà quý khách quen', '30000.00', '0.00', NULL, 1, 255);

-- --------------------------------------------------------

--
-- Table structure for table `ecm_store`
--

CREATE TABLE IF NOT EXISTS `ecm_store` (
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_name` varchar(100) NOT NULL DEFAULT '',
  `owner_name` varchar(60) NOT NULL DEFAULT '',
  `owner_card` varchar(60) NOT NULL DEFAULT '',
  `region_id` int(10) unsigned DEFAULT NULL,
  `region_name` varchar(100) DEFAULT NULL,
  `address` varchar(255) NOT NULL DEFAULT '',
  `zipcode` varchar(20) NOT NULL DEFAULT '',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `sgrade` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `apply_remark` varchar(255) NOT NULL DEFAULT '',
  `credit_value` int(10) NOT NULL DEFAULT '0',
  `praise_rate` decimal(5,2) unsigned NOT NULL DEFAULT '0.00',
  `domain` varchar(60) DEFAULT NULL,
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `close_reason` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned DEFAULT NULL,
  `end_time` int(10) unsigned NOT NULL DEFAULT '0',
  `certification` varchar(255) DEFAULT NULL,
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0',
  `recommended` tinyint(4) NOT NULL DEFAULT '0',
  `theme` varchar(60) NOT NULL DEFAULT '',
  `store_banner` varchar(255) DEFAULT NULL,
  `store_logo` varchar(255) DEFAULT NULL,
  `description` text,
  `image_1` varchar(255) NOT NULL DEFAULT '',
  `image_2` varchar(255) NOT NULL DEFAULT '',
  `image_3` varchar(255) NOT NULL DEFAULT '',
  `im_qq` varchar(60) NOT NULL DEFAULT '',
  `im_ww` varchar(60) NOT NULL DEFAULT '',
  `im_msn` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`store_id`),
  KEY `store_name` (`store_name`),
  KEY `owner_name` (`owner_name`),
  KEY `region_id` (`region_id`),
  KEY `domain` (`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecm_store`
--

INSERT INTO `ecm_store` (`store_id`, `store_name`, `owner_name`, `owner_card`, `region_id`, `region_name`, `address`, `zipcode`, `tel`, `sgrade`, `apply_remark`, `credit_value`, `praise_rate`, `domain`, `state`, `close_reason`, `add_time`, `end_time`, `certification`, `sort_order`, `recommended`, `theme`, `store_banner`, `store_logo`, `description`, `image_1`, `image_2`, `image_3`, `im_qq`, `im_ww`, `im_msn`) VALUES
(2, 'Giasoconline', 'Giasoconline', '162584983', 0, '', 'Hà Nội', '', '0908722688', 1, '', 0, '0.00', NULL, 1, '', 1313284279, 0, NULL, 0, 0, 'default|default', NULL, NULL, NULL, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ecm_uploaded_file`
--

CREATE TABLE IF NOT EXISTS `ecm_uploaded_file` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `file_type` varchar(60) NOT NULL DEFAULT '',
  `file_size` int(10) unsigned NOT NULL DEFAULT '0',
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `file_path` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `belong` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`file_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ecm_uploaded_file`
--

INSERT INTO `ecm_uploaded_file` (`file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id`) VALUES
(1, 2, 'image/jpeg', 115067, 'jib1307965766.jpg', 'data/files/store_2/goods_97/201108141631378507.jpg', 1313289097, 2, 1),
(2, 2, 'image/jpeg', 115067, 'jib1307965766.jpg', 'data/files/store_2/goods_139/201108141632193396.jpg', 1313289139, 2, 1),
(3, 2, 'image/jpeg', 50288, 'nokia 1202.jpg', 'data/files/store_2/goods_96/201108150101366208.jpg', 1313319696, 2, 2),
(4, 2, 'image/jpeg', 50288, 'nokia 1202.jpg', 'data/files/store_2/goods_108/201108150101481245.jpg', 1313319708, 2, 2),
(5, 2, 'image/jpeg', 43971, 'dam-ngan-dn019.jpg', 'data/files/store_2/goods_93/201108150244536600.jpg', 1313325893, 2, 3),
(6, 2, 'image/jpeg', 43971, 'dam-ngan-dn019.jpg', 'data/files/store_2/goods_165/201108150246052673.jpg', 1313325965, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ecm_user_coupon`
--

CREATE TABLE IF NOT EXISTS `ecm_user_coupon` (
  `user_id` int(10) unsigned NOT NULL,
  `coupon_sn` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`,`coupon_sn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecm_user_coupon`
--


-- --------------------------------------------------------

--
-- Table structure for table `ecm_user_priv`
--

CREATE TABLE IF NOT EXISTS `ecm_user_priv` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `privs` text NOT NULL,
  PRIMARY KEY (`user_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ecm_user_priv`
--

INSERT INTO `ecm_user_priv` (`user_id`, `store_id`, `privs`) VALUES
(1, 0, 'all'),
(2, 2, 'all');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
