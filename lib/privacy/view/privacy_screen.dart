import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:trkar/core/helper/navigator.dart';
import '../../core/extensions/string.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({Key? key}) : super(key: key);
  static const routeName = '/privacy-policy';

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            NavigationService.goBack();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
          color: Colors.black,
        ),
        title: Text(
          'privacy_policy'.translate,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Html(data: '''<div id="content" class="page-confidential">

    <div class="text_page agb_page">
              <ul>
  <li><b>1. Name and address of the controller</b></li></ul>

<p>The controller within the meaning of the General Data Protection Regulation (GDPR) and other national data protection laws of the Member States as well as other data protection provisions is:</p>

<p><strong>AUTODOC AG</strong><br>
Josef-Orlopp-Straße 55 <br>10365 Berlin<br><br>
Fax: +49 30 208 478 250<br>
E-mail: <a href="mailto:privacy-policy@autodoc.de">privacy-policy@autodoc.de</a></p>

<p>You are welcome to contact our data protection officer at any time if you have any questions on the subject of data protection in connection with our products/services or the use of our website. They can be contacted at the above postal address as well as at the e-mail address indicated above (please mark your correspondence “For the attention of the data protection officer”). We draw your attention expressly to the fact that, when using this e-mail address, the contents of your e-mail will not be read exclusively by our data protection officer. If you wish to exchange confidential information, please therefore use this e-mail initially to ask the officer to contact you directly.</p>

<ul>
  <li><b>2. Data processing on our website</b></li></ul>

<p><b>2.1. Visiting our website / access data</b></p>

<p>Each time our website is visited, our system automatically records data and information from the computer system of the requesting computer.</p>

<p>The following data is collected here:</p>

<li>Information about the browser type and the version used</li>
<li>The user’s operating system</li>
<li>The user’s Internet service provider</li>
<li>The user’s IP address</li>
<li>Date and time of access</li>
<li>Websites from which the user’s system accessed our website</li>
<li>Websites that are visited by the user’s system from our website.</li><br>

<p>The processing of this data is necessary in order to enable the visit to the website and to guarantee that the functions and security of our systems are constantly maintained. The access data is additionally saved temporarily in internal log files for the purposes described above in order generate statistical information about the use of our website, to further develop our website based on how our visitors use it (e.g. if the proportion of mobile devices that are used to access the web pages increases) and to perform the general administrative management of our website.</p>

<p>The legal basis is provided by Art. 6(1) sentence 1 (b) GDPR if the page view takes place in the course of initiating or performing a contract and otherwise by Art. 6(1) sentence 1 (f) GDPR based on our legitimate interest in constantly maintaining the functions and security of our systems.</p>

<p>The data is deleted as soon as it is no longer necessary to achieve the purpose for which it was collected. If the data is collected in order to provide the website, the data is deleted when the current session is ended. If the data is stored in log files, it is generally deleted after no more than seven days. In this case, the users’ IP addresses are deleted or modified so that they can no longer be assigned to a specific customer.</p>

<p><b>2.2. Getting in contact with us</b></p>

<p>There are several options for getting in contact with us. These include using contact forms and getting in contact by e-mail or phone. In this connection, we process data exclusively for the purpose of communicating with you.</p>

<p>The legal basis is provided by Art. 6(1) sentence 1 (b) GDPR if your information is needed in order to answer your query or to initiate or perform a contract and otherwise by Art. 6(1) sentence 1 (f) GDPR based on our legitimate interest that you are able to contact us and that we can answer your query.</p>

<p>The data we collect when the contact form is used is deleted automatically after your enquiry has been fully processed, unless we still need your enquiry to fulfil contractual or statutory obligations (cf. section 5 “Period of storage”).</p>

<p><b>2.2.1. Contact forms</b></p>

<p><strong>Contact forms</strong> are available on our website that can be used to get in contact with us electronically. If a user uses this option, the following mandatory information is sent to us and stored:</p>

<li>Order number</li>
<li>Telephone number</li>
<li>Given and family names (optional)</li>
<li>Vehicle identification number (optional)</li>
<li>Key number</li>
<li>E-mail address</li>
<li>Article number</li><br>

<p>The following data is additionally stored at the time the message is sent:</p>

<li>IP address</li>
<li>Date and time that the query is received.</li><br>

<p><b>2.2.2. Getting in contact by e-mail</b></p>

<p>As an alternative to the contact form, it is also possible to contact us directly in writing using the e-mail address provided. In this case, the user’s personal data sent with the <strong>e-mail</strong> will be stored.</p>

<p>The data is deleted as soon as it is no longer necessary to achieve the purpose for which it was collected. If the query involves business correspondence, we store your information for up to three years.</p>

<p><b>2.2.3. Getting in contact by phone</b></p>

<p>You also have the option of contacting us <strong>by phone</strong>. If you grant us your consent at the beginning of your call, we will subsequently record the conversation we have with you. We will save the information provided during the telephone conversation to train our customer support staff as well as to ensure the quality of our call centre and generally delete it after three months at the latest, unless a longer retention period is stipulated by law or is necessary for documentation purposes. We can store the recording for up to three years for documentation purposes (e.g. entry into a purchase agreement). Your consent provides the legal basis (Art. 6(1) (a) GDPR) for recording and evaluating the conversation.</p>

<p><b>2.3. Registration</b></p>

<p>On our website, we offer users the option of creating a customer account and registering for our log-in area in order to benefit from the site's full scope of functions. We have highlighted the data that you have to provide as mandatory by marking the boxes as required fields. It is not possible to register without that data. The legal basis for the processing is provided by Art. 6(1) sentence 1 (b) GDPR.</p>

<p>The following data is collected in the course of the registration process:</p>

<li>Title</li>
<li>Given and family name</li>
<li>E-mail address</li>
<li>Password</li><br>

<p>The following data is additionally stored at the time of registration:</p>

<li>IP address</li>
<li>Date and time of the registration</li><br>

<p>The registration data is used to process orders in our online shop and to create a customer account.</p>

<p>The data is deleted as soon as it is no longer necessary to achieve the purpose for which it was collected, unless a longer retention period is necessary in order to fulfil statutory obligations.</p>

<p><b>2.4. Orders</b></p>

<p>In addition to the data already provided during registration, we collect the following information during an order process, which is necessary to execute the contract:</p>

<li>Date of birth</li>
<li>E-mail address</li>
<li>Password</li>
<li>Billing and shipping address</li>
<li>Payment method (possibly also including your bank’s IBAN and BIC depending on the payment method, if payment service providers mentioned in 2.4.1 have not been selected to make the payment).</li><br>

<p>Information such as telephone and fax numbers may also be provided optionally so that we can also contact you by these means in the event of queries or in order to phone you to request payment after the payment due date has elapsed and after we have sent you a written reminder if this is necessary and we are unable to contact you in another way if you have not paid.</p>

<p>The legal basis for the processing is provided by Art. 6(1) sentence 1 (b) GDPR.</p>

<p>We use the data you have provided exclusively to fulfil and process your orders. Your order data will be saved in your customer account and deleted after the retention period for tax and business records has expired, unless you have explicitly consented that your data can continue to be used.</p>

<p><b>2.4.1. Payment service providers</b></p>

<p>The option of selecting different payment service providers and common payment methods, such as payment in advance, payment by PayPal or by invoice, is available for settling the payment. Payment data such as billing addresses, IBAN, BIC and preferred payment methods can be sent to these service providers for this purpose. This furthermore includes data that is generated in direct connection with the payment settlement, such as data that external payment service providers use for identification purposes (e.g. given and family names, address, gender, e-mail address, IP address, telephone number, PayPal ID), device information (e.g. IP address, device type, operating system) or data that is required to prepare an invoice, such as the number of articles, article numbers, invoice amount and tax in percent. These service providers can also process data on your previous payment history as well as probability values on future behaviour. We also receive relevant information from the payment service providers about the payment for the purpose of reviewing payments, e.g. in order to release purchased goods. We also receive master data and financial information from the payment service providers as part of any identity check that may be prescribed by law.</p>

<p>If you have not granted us your consent pursuant to Art. 6(1) (a) GDPR, the legal basis for disclosing the data to the payment service providers in the course of processing the contract is provided by Art. 6(1) sentence 1 (b) GDPR, as the processing is necessary for the performance of the contract and the processing of the order.</p>

<p>Please see the data privacy notices of the relevant payment service providers for the legal bases of the data processing that they are independently responsible for performing.</p>

<li><strong>Klarna, Sveavägen 46, 111 34 Stockholm, Sweden (“Klarna”).</strong> Please see Klarna’s <a href="https://cdn.klarna.com/1.0/shared/content/legal/terms/0/de_de/privacy">privacy notice</a> for more information.</li>
<li><strong>Sofort GmbH, a company of the Klarna Group, Theresienhöhe 12, 80339 Munich (“Sofort GmbH”).</strong> Please see the <a href="https://www.sofort.de/datenschutz.html">privacy notice</a> of Sofort GmbH for more information.</li>
<li><strong>PayPal (Europe) S.a r.l. et Cie, S.C.A., 22-24 Boulevard Royal, 2449 Luxembourg, Luxembourg (“PayPal”).</strong> Please see PayPal’s <a href="https://www.paypal.com/us/webapps/mpp/ua/privacy-full">privacy notice</a> for more information. </li>
<li><strong>Trustly Group AB, 556754-8655, Norrtullsgatan 6, 113 29 Stockholm, Sweden (“Trustly”).</strong> Please see Trustly’s <a href="https://www.trustly.net/de/uber-uns/privacy-policy">privacy policy</a> for more information.</li>
<li><strong>Dalenys Payment SAS, 110 avenue de France, 75013 Paris, France (“Dalenys”).</strong> Please see Dalenys Payment’s <a href="https://www.dalenys.com/data-privacy/">privacy policy</a> for more information.</li>
<li><strong>Braintree, a company of PayPal (Europe) S.a r.l. et Cie, S.C.A., 22-24 Boulevard Royal, 2449 Luxembourg, Luxembourg (“Braintree”).</strong> Please see Braintree’s <a href="https://www.braintreepayments.com/de/legal/braintree-privacy-policy">privacy policy</a> for more information.</li>
<li><strong>Apple Pay, Apple Inc., One Apple Park Way, Cupertino, CA, USA, 95014 (“Apple Pay”).</strong> Please see Apple’s <a href="https://support.apple.com/de-de/HT203027">privacy policy</a> for Apple Pay for more information.</li>
<li><strong>Google Pay, Google Payment Ireland Limited, 70 Sir John Rogerson’s Quay, Dublin 2, Ireland (“Google Pay”).</strong> Please see the <a href="https://payments.google.com/payments/apis-secure/get_legal_document?ldo=0&amp;ldt=privacynotice&amp;ldl=de">privacy policy of Google Pay and Payments</a> and <a href="https://policies.google.com/privacy">Google’s privacy policy</a> for more information.</li>
<li><strong>Przelewy24 at PayPro Spółka Akcyjna, ul. Kanclerska 15, 60-327 Poznań, Poland (“przelewy24”).</strong> Please see the <a href="https://www.przelewy24.pl/eng/information-obligation-gdpr-payer">privacy policy</a> of przelewy24 for more information.</li>
<li><strong>PostFinance, PostFinance AG, Mingerstrasse 20, 3030 Berne, Switzerland (“PostFinance”).</strong> Please see PostFinance’s <a href="https://www.postfinance.ch/de/detail/data.html">privacy policy</a> for more information.</li><br>

<p>The payment options and service providers may vary depending on the place from where the website was accessed.</p> 

<p>We would like to point out that the most efficient way to make data protection enquires is to contact the relevant payment service provider, as only they have access to the data and can institute appropriate measures directly.</p>

<p><b>2.5. Newsletter</b></p>

<p>There is an option on our website  to subscribe to our free and personalised newsletter, in which we regularly send you information especially tailored to you, news about our product innovations and developments, current special offers and campaigns, shopping cart reminders and opinion and customer satisfaction surveys. When you register for the newsletter, the data from the input screen will be sent to us and to delivery service providers that we have engaged. Generally, you have to input only your e-mail address. Other information such as your given and family names and your gender might be requested as optional information in order to give you the possibility of receiving a personalised newsletter.</p> 

<p>We use the double opt-in procedure for the subscription to our newsletter, i.e. we will send you newsletters by e-mail only if you have confirmed that you are the holder of the indicated e-mail address by clicking a link in our e-mail notification. If you confirm your e-mail address, we store it, the time of your subscription and the IP address used to subscribe until you unsubscribe from the newsletter. The data is stored solely for the purpose of sending you the newsletter and being able to verify your subscription. You can unsubscribe from the newsletter at any time. The newsletter includes an appropriate cancellation link. A notification sent to the contact details indicated above or in the newsletter (e.g. by e-mail or letter) is of course also sufficient for this purpose.</p> 

<p>The legal basis for the processing is provided by your consent pursuant to Art. 6(1) sentence 1 (a) GDPR. The registration procedure is recorded here on the basis of our legitimate interest pursuant to Art. 6(1) (f) GDPR for purposes of documenting that the procedure has been conducted properly.</p> 

<p>The data is used exclusively for sending the newsletter.</p> 

<p>In order to ascertain when our e-mails are opened and how they are used, we use standard market technologies provided to us by our delivery service providers to record and analyse the interactions with the newsletter and the access data that is generated (e.g. opening rate or click rate). Our e-mails also include web beacons for this purpose. These are small image files that are downloaded from our website and allow us to establish when an e-mail is opened by you. Moreover, we learn what links contained in the e-mails you click on. We use this access data to constantly improve our offer, our contents and customer communication as well as for statistical purposes. Furthermore, we use the information to better understand what contents and products you are interested in so that we can show you contents that are as relevant to you as possible in the future.</p> 

<p>In the course of your registration to receive our advertising mails, we additionally obtain your consent for us to personalise our e-mails in line with your interests and needs on the basis of the data stored about you on multiple devices, such as your access data, any account information and your shopping behaviour (orders, returns, ordering processes not completed).</p> 

<p>If you do not want your usage behaviour to be analysed, you can unsubscribe from the newsletter or configure your e-mail program to disable graphics as the default setting.</p> 

<p>The legal basis for this is your consent pursuant to Art. 6(1) sentence 1 (a) GDPR.</p> 

<p>The access data (opening and click data) is collected and stored exclusively in anonymised form.</p> 

<p>Other data that is collected in the context of the newsletter independently of the opening and click data is deleted as soon as it is no longer necessary to achieve the purpose for which it was collected. The user’s e-mail address is accordingly stored in principle as long as the subscription to the newsletter is active. If you unsubscribe from e-mail notifications, we regard this as revocation of your consent to create your personalised user profile and to receive e-mails based on this profile. Your personalised user profile will be deleted by us immediately. The e-mail addresses, including the log data, are removed and blocked. The temporary block serves our legitimate interest in being able to prove that consent had originally been granted (Art. 6(1) f) GDPR). We delete the e-mail address from the e-mail distribution list after six months have elapsed.</p> 

<p>Separate revocation concerning the analysis of your access data that is described above is not possible. However, you have the option of configuring the mail program you use in such a way that e-mails are shown in text form and not in HTML. This causes image and graphic files to be blocked so that tracking is no longer possible. The newsletter will not be shown to you in full in this case, however, and you may possibly not be able to use all the functions. Separate revocation concerning the creation of a personalised user profile is also not possible. If you do not want us to create a personalised user profile for you, you have the option at any time to withdraw your consent to receiving personalised e-mail advertising as described above.</p> 

<p>In this connection we use the GetResponse service of GetResponse Sp.z o.o., ul. ARKONSKA 6/A3, 80-387 GDANSK, Poland (“GetResponse”).</p> 

<p>We have entered into a contract data processing agreement and, for the event that personal data is transferred to third countries such as the US, EU standard contractual clauses with GetResponse. Your consent to the tracking issued through the cookie banner also expressly extends to the transmission of data to GetResponse (Art. 49(1) sentence 1 (a) GDPR). Please see section 6 (“Transferring data to third countries”) for the risks involved.</p> 

<p>Please see GetResponse’s <a href="https://www.getresponse.com/de/legal/datenschutz">privacy policy</a> for more information on the protection of your data.</p> 

<p><b>2.6. Advertising for existing customers by e-mail</b></p>

<p>If you have made a purchase from us, we also use your contact data to e-mail you other information on our products that is relevant to you (“advertising for existing customers”). This can include new products, campaigns and offers as well as feedback and other surveys.</p>

<p>The legal basis for this data processing is Art. 6(1) (f) GDPR in conjunction with section 7(3) of the Gesetz gegen den unlauteren Wettbewerb (UWG – German Act against Unfair Competition), according to which the data processing is permitted to protect legitimate interests in so far as this concerns the storage and other use of the data for advertising purposes. You can object to the use of your data for advertising purposes at any time by clicking on a corresponding link in the e-mails or by sending a message to the contact details indicated above (e.g. by e-mail or post) without incurring costs other than the transmission costs at the basic rates.</p>

<p><b>2.7. Contact from Autodoc by telephone</b></p>

<p>If you have granted us your consent and registered your telephone number in your customer account, we may call you to conduct customer satisfaction surveys, to suggest special offers and campaigns to you and to inform you about products as well as for statistical purposes. If you grant us your consent at the beginning of the call, we will subsequently record the conversation. We will save the information provided during the telephone conversation to train our customer support staff as well as to ensure the quality of our call centre and generally delete it after three months at the latest, unless a longer retention period is stipulated by law or is necessary for documentation purposes. We can store the recording for up to three years for documentation purposes (e.g. entry into a purchase agreement). Your consent provides the legal basis (Art. 6(1) (a) GDPR) for recording and evaluating the conversation.</p>

<p><b>2.8. Surveys and competitions</b></p>

<p>If you take part in one of our surveys, we use your data for market and opinion research. We evaluate the data in principle in anonymous form for internal purposes. If in exceptional cases surveys are not anonymous when they are evaluated, the data will be collected and processed exclusively with your consent (Art. 6(1) sentence 1 (a) GDPR).</p>

<p>During competitions, we use your data for the purpose of conducting the competition and to notify you if you win a prize. More detailed information can be found in the terms and conditions of participation for the respective competition. The legal basis for the processing is provided by Art. 6(1) sentence 1 (b) GDPR.</p>

<ul>
  <li><b>3. Use of cookies and similar technologies</b></li></ul>

<p>We use cookies and similar technologies (“tools”) on this website that are offered either by us or by third parties.</p>

<p>Cookies are small text files that can be stored on your device by your browser. Cookies are not used to execute programs or to load viruses to your computer. Similar technologies include web storage (local / session storage), fingerprinting, tags and pixel in particular. Some cookies are kept on your computer for a specific period and allow us to recognise your computer again when you next visit our website (persistent cookies). Our partners are not permitted to collect, process or use personal data using cookies on our website.</p>

<p>Most browsers accept cookies and similar technologies as the default setting. However, you can generally adjust your browser settings so that cookies or similar technologies are rejected or stored only after being given prior consent. You can also allow or prohibit individual temporary and saved cookies independently of each other in the security settings. If you disable cookies, certain functions of our website may not be available to you, some web pages may not be correctly displayed and not all of our offers may function smoothly for you. For example, temporary cookies must be allowed in order to use our shopping cart. The data stored in our cookies is not linked to your personal data (name, address, etc.). We will not link the data stored in our cookies linked to your personal data (name, address, etc.) without your explicit consent.</p>

<p>You can delete any stored cookies at any time yourself by selecting the relevant menu item in your Internet browser or erasing the cookies on your hard drive. You can find the details on this on your Internet browser’s help menu. Session cookies are deleted again once you have left the website and are used here only in order to assist you in navigating the website and accessing content as well as to capture statistics.</p>

<p>The tools that we use are listed and ordered by category below, where we inform you in particular of the provider of the tool and the disclosure of the data to third parties. We also explain in what cases we obtain your voluntary consent to use the tools and how you can withdraw this consent.</p>

<p>Should the information in the cookie banner contradict the information in this privacy policy – also even when the greatest care has been taken – the information in this privacy policy shall prevail.</p>

<p><b>3.1. Legal basis and revocation</b></p>

<p><b>3.1.1. Legal basis</b></p>

<p>We use tools that are necessary to operate the website on the basis of our legitimate interest pursuant to Art. 6(1) sentence 1(f) GDPR in order to allow you a more convenient and more personalised use of our website and to design this use in a way that saves as much time as possible. In certain cases, these tools can also be necessary to take steps prior to entering into a contract or to perform a contract; the processing is then carried out pursuant to Art. 6(1) sentence 1(b) GDPR.</p>

<p>We use all other tools, especially tools for marketing purposes, based on your consent pursuant to Art. 6(1) sentence 1(a) GDPR as well as pursuant to section 15(3) sentence 1 of the Telemediengesetz (TMG – German Telemedia Act) if user profiles are created for advertising or market research purposes. Data processing using these tools takes place only if we have received your consent for this in advance.</p>

<p>If personal data is transferred to third countries, please refer to section 6 (“Transferring data to third countries”), also with regard to any risks that may be involved. We inform you if we have entered into standard contractual clauses or other guarantees with the providers of certain tools. If you have given your consent to the use of certain tools, we transfer the data processed when these tools are used to third countries (also) on the basis of this consent.</p>

<p><b>3.1.2. Obtaining your consent</b></p>

<p>We use a consent management tool to obtain and manage your consent. This generates a banner, which informs you of the data processing on our website and gives you the option of consenting to all, individual or no data processing using optional tools. This banner appears when you visit our website for the first time and when you view your settings selection again in order to change these settings or to withdraw your consent. The banner also appears each time you visit our website again if you have disabled the storage of cookies.</p>

<p>If you grant your consent, each consent or revocation, your IP address, information about your browser, and your device at the time you visit our website are transmitted to us in the course of your visit to the website. Moreover, we use our own necessary cookie in order to store any consent and revocations you have issued. If you delete cookies, we will ask you for your consent again when you view pages later.</p>

<p>The data processing is necessary in order to provide you with the legally required consent management and to meet our documentation obligations. The legal basis for using the consent management tool is provided by Art. 6(1) sentence 1 (f) GDPR based on our interest in fulfilling the legal requirements for cookie consent management.</p>

<p><b>3.1.3. Withdrawing your consent or changing your selection</b></p>

<p style="border: 2px solid #000000; background-color:#FFFFFF; padding: 1px;">You can withdraw your consent for specific tools at any time. To do this, click on the following <a href="https://www.autodoc.co.uk/profile/settings">link</a>. You can also change the selection of the tools for which you would like to give your consent for their use as well as obtain additional information about the cookies and the respective storage period here. Alternatively, you can withdraw your consent for specific tools by contacting the service provider directly.</p><br>

<p>Our website uses various types of cookies and similar technologies which each have a specific function. We use and manage some cookies directly, while other cookies are used and managed by third parties in accordance with their own privacy policies. Please find an overview below:</p>

<p><b>3.2. Necessary tools</b></p>

<p>We use certain tools in order to enable the basic functions of our website and the display of contents on a smartphone (“necessary tools”). Without these tools, we would not be able to provide our service. Necessary tools are therefore used without consent on the basis of our legitimate interest pursuant to Art. 6(1) sentence 1 (f) GDPR or to take steps prior to entering into a contract or to perform a contract pursuant to Art. 6(1) sentence 1(b) GDPR.</p>

<p><b>3.2.1. Own cookies</b></p>

<p>We use our own necessary cookies in particular</p>

<li>to authenticate log-ins,</li>
<li>to distribute the load,</li>
<li>to save your language settings,</li>
<li>to note that you have been shown information placed on our website – so that this is not shown again when you next visit the website.</li><br>

<p>These cookies are essential for enabling the website to function smoothly and identify the language and country from which you have accessed the website, for example. If you are a registered visitor, cookies enable you to be recognised and to access services in the relevant sections.</p>

<p><b>3.2.2. Google Tag Manager</b></p>

<p>Our website uses Google Tag Manager, a service that is offered to users from the European Economic Area and Switzerland by Google Ireland Limited, Gordon House, Barrow Street, Dublin 4, Ireland, and to all other users by Google LLC, 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA (jointly “Google”).</p>

<p>Tag Manager is used to administer tracking tools and other services, which are known as website tags. A tag is an element that is filed in the source text of our website in order for example to record defined usage data. Google Tag Manager ensures that the usage data required by our partners is sent to them.</p>

<p>Google Tag Manager works without using cookies.</p>

<p>The legal basis is provided by Art. 6(1) sentence 1 (f) based on our legitimate interest in integrating and administering several tags in an uncomplicated way on our website.</p>

<p>We have entered into a contract data processing agreement with Google. Some data is processed on a Google server in the US. We have entered into standard contractual clauses pursuant to Art. 46(2) (c) GDPR with Google for the event that personal data is transferred to the US or other third countries. Please see section 6 (“Transferring data to third countries”) for more information.</p>

<p>Please see <a href="https://support.google.com/tagmanager/answer/6103697?hl=de&amp;topic=2574304&amp;ctx=topic&amp;rd=1">Google’s information about Tag Manager</a> for more detailed information.</p>

<p><b>3.3. Functional tools</b></p>

<p>We additionally use tools in order to enhance the user experience on our website and to be able to offer your more functions (“functional tools”). Although these are not absolutely necessary for the basic functionality of the website, they can, however, provide the user with significant advantages, especially concerning user friendliness and the provision of additional communication, display or payment channels.</p>

<p><b>3.3.1. MyFonts</b></p>

<p>Our website uses the MyFonts service, which is offered by Monotype Imaging Holdings Inc., 600 Unicorn Park Drive, Woburn, MA 01801 USA, and its international subsidiaries and affiliated companies (“MyFonts”).</p>

<p>When you view a page, your browser loads the required fonts in order to display texts correctly and attractively. For this purpose, your browser has to establish a connection with the MyFonts servers. As a result, MyFonts learns that our website has been viewed from your IP address. This data is not amalgamated with other data. No cookies are stored.</p>

<p>The legal basis for the data processing is provided by your voluntary consent pursuant to Art. 6(1) sentence 1 (a) GDPR. MyFonts serves to display our online presence in a uniform and attractive way thanks to the maintenance-free and efficient use of fonts while also taking possible licensing restrictions for their local integration into account.</p>

<p>The server to which a connection is established may be located in the US. For the event that personal data is transferred to the US or other third countries, your consent explicitly also extends to this data transfer (Art. 49(1) sentence 1 (a) GDPR). Please see section 6 (“Transferring data to third countries”) for the risks involved.</p>

<p>You can find more information in the <a href="https://www.myfonts.com/legal/website-use-privacy-policy">privacy policy</a> and the <a href="https://www.myfonts.com/legal/terms-of-use">terms of use</a> of MyFonts and in Monotype’s <a href="https://www.monotype.com/de/rechtshinweise/datenschutzrichtlinie/datenschutzrichtlinie-zum-tracking-von-webschriften">privacy policy</a>.</p>

<p><b>3.3.2. Chat tool</b></p>

<p>Our website uses the chat program from Genesys Telecommunications Lab. GmbH Germany, Joseph-Wild-Straße 20, 81829 Munich, Germany, to improve communication with visitors.</p>

<p>If you have general or specific questions or problems relating to our products, the website or our company, you can send us a message via the chat program. You will see whether someone is online to answer you directly. If this is not the case, we will answer your query immediately during our business hours. In this connection, we process data exclusively for the purpose of communicating with you.</p>

<p>When the chat program is used, the IP address of the device and the address of the sub-page from which you call up the chat program are recorded. Genesys also uses cookies and similar technologies. Chats that are conducted are recorded and stored.</p>

<p>The legal basis is provided by Art. 6(1) sentence 1 (b) GDPR if the page view takes place in the course of initiating or executing a contract and otherwise by Art. 6(1) sentence 1 (f) GDPR based on our legitimate interest in constantly maintaining the functions and security of our systems.</p>

<p>We have entered into a contract data processing agreement with Genesys. The data recorded in this connection may be transmitted to and stored on a Genesys server in third countries. We have entered into standard contractual clauses pursuant to Art. 46(2) (c) GDPR with Genesys for the event that personal data is transferred to third countries. Please see section 6 (“Transferring data to third countries”) for more information.</p>

<p>Please see Genesys’s <a href="https://www.genesys.com/company/legal/privacy-policy">privacy policy</a> for more detailed information.</p>

<p><b>3.3.3. Push notifications (Firebase Cloud Messaging)</b></p>

<p>We offer a free push notification service on our website. You can subscribe to this service by clicking the “Allow” button. You have the option of ending this subscription at any time in your browser settings.</p>

<p>When using our app, you will receive what are known as push notifications from us; you will also receive them even when you do not have the app open at the time. These notifications can include messages that we send to you as part of performing a contract (e.g. message that our app is not available because maintenance work is being carried out).</p>

<p>The legal basis is provided in this case by Art. 6(1) (a) GDPR. You will receive advertising information by push notification only if you have given your consent for this. The legal basis in this case is provided by Art. 6(1) (a) GDPR.</p>

<p>Moreover, you can disable push notifications at any time using the settings on your mobile device.</p>

<p>We use the Firebase Cloud Messaging (FCM SDK) service, which is offered by Google LLC, 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA, to send our push notifications. Using the instance ID (Google token) that is assigned when the app is installed on your device, Firebase Cloud Messaging enables the push notifications for precisely your mobile device to be displayed. The instance ID does not allow any conclusions to be drawn about your identity and is therefore anonymous.</p>

<p>In the event that personal data is nevertheless transferred to the US, it is sent on the basis of Art. 49(1) (b) GDPR in order to enable the performance of a contract with you or the implementation of pre-contractual measures. Please see section 6 (“Transferring data to third countries”) for more information.</p>

<p>Please see Google’s <a href="https://policies.google.com/privacy">privacy policy</a> and the <a href="https://firebase.google.com/support/privacy/">data privacy notices concerning Firebase</a> for more detailed information about Firebase.</p>

<p><b>3.3.4. Cloudflare</b></p>

<p>We use content delivery network services of Cloudflare Germany GmbH, Rosental 7, 80331 Munich, Germany, and Cloudflare Inc., 701 Townsend St., San Francisco, CA 94107 (USA), on our website. In a content delivery network, the contents of our website is placed on the service’s server. The server of the service provider distributes these contents to you and your browser when our page is viewed. Cloudflare processes log data, such as your IP address, system setting information, DNS log data and device information. We use Cloudflare for the purpose of defending our website against attacks, such as DDoS and bot attacks for example and to be able to identify users. No user IDs or personal data are stored in this process. The time it takes for our website to load can also be shortened using Cloudflare, meaning we are able to make the contents of our pages available to you quickly.</p>

<p>The legal basis for using Cloudflare is Art. 6(1) (f) GDPR, based on our legitimate interest in using the service to institute security measures against attacks on our website and in providing large volumes of data to the users of our website.</p>

<p>We have entered into a contract data processing agreement with Cloudflare. We have entered into standard contractual clauses with Cloudflare for the event that Cloudflare transfers data to third countries.</p>

<p>Please see Cloudflare’s <a href="https://www.cloudflare.com/resources/assets/slt3lc6tev37/01GBBOfpA6gUhCl837IcP7/ae138214858d6fc48e321c462f61f14e/Cloudflare_Privacy_Policy_German_2020-12-08.pdf?utm_referrer=https://www.cloudflare.com/privacypolicy/">privacy policy</a> for more information.</p>

<p><b>3.4. Analysis tools</b></p>

<p>In order to improve our website, we use tools to statistically record and analyse the general usage behaviour on the basis of access data (“analysis tools”). In this process, we analyse search terms that are entered, the frequency of page views or the utilisation of certain website functions, for example.</p>

<p>We also use analysis services to evaluate the use of our various marketing channels.</p>

<p>The legal basis for using the analysis tools is provided – unless otherwise stated – by your consent pursuant to Art. 6(1) sentence 1 (a) GDPR. Please see 3.1.3: “Withdrawing your consent or changing your selection” for information on withdrawing your consent. For the event that personal data is transferred to the US or other third countries, your consent explicitly also extends to this data transfer (Art. 49(1) sentence 1 (a) GDPR). Please see section 6 (“Transferring data to third countries”) for the risks involved.</p>

<p>Technical measures are used to render users’ data pseudonymous and anonymous. It is therefore no longer possible to assign the data to the visiting user. The data is not stored together with users’ other personal data.</p>

<p><b>3.4.1. Google Analytics</b></p>

<p>Our website uses Google Analytics, a web analysis service of Google LLC, 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA (“Google”). According to Google, the point of contact for all data protection concerns is Google Ireland Limited, Gordon House, Barrow Street, Dublin 4, Ireland.</p>

<p>Google Analytics uses cookies and similar technologies in order to be able to analyse and enhance our website using your user behaviour. Google will process the information obtained in order to evaluate your use of the website, to compile reports on the website activities for the website owner and to perform other services associated with the use of the website and Internet use. These services also include the creation of remarketing target groups and lists and the delivery of advertisements in Google display and search campaigns (remarketing) as well as the identification and breakdown of visitors to the website by age, gender, interests (conversion tracking) to direct the advertisements at the relevant target groups. The data generated in this connection can be transferred to and stored on a server in the US by Google for evaluation.</p>

<p>We have used the following data protection settings for using Google Analytics:</p>

<li>IP anonymisation (masking of the IP address before evaluation so that no conclusions can be drawn about your identity).</li>
<li>Automatic deletion of old logs / limitation on the storage period</li>
<li>Advertising function disabled (including target group remarketing through GA Audience)</li>
<li>Personalised advertisements disabled</li>
<li>Measurement log disabled</li>
<li>Cross-page tracking (Google Signals) disabled</li>
<li>Data release to other Google products and services disabled</li><br>

<p>The following data is processed by Google Analytics:</p>

<li>Anonymised IP address</li>
<li>referrer URL (previous page visited)</li>
<li>pages viewed (data, time, URL, title, time spent there)</li>
<li>downloaded files</li>
<li>links to other websites clicked on</li>
<li>achievement of specific targets (conversions)</li>
<li>technical information: operating system, browser type, version and language, device type, brand, model and resolution</li>
<li>approximate location (country and, where appropriate, town, based on anonymised IP address)</li>
<li>data on demographic characteristics and interests.</li><br>

<p>Google Analytics places the following cookies for the respective storage period for the indicated purpose:</p>

<li>“_ga” for 2 years and “_gid” for 24 hours (both for identifying and differentiating the website visitors by means of a user ID)</li>
<li>“_gat” for 1 minute (to reduce queries to the Google servers)</li><br>

<p>We have entered into a contract data processing agreement with Google for the use of Google Analytics as well as standard contractual clauses for the event that personal data is transferred to the US or other third countries.</p>

<p>Please see Google’s <a href="https://support.google.com/analytics/answer/6004245?hl=de">privacy policy</a> for more detailed information.</p>

<p><b>3.4.2. Google Analytics for Firebase</b></p>

<p>We use Google Analytics for Firebase ("Firebase”), an analysis service of Google LLC, 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA (“Google”). Firebase enables us to analyse and evaluate the usage patterns of the users of our website and app by means of the device ID that we have generated for your device. The knowledge that we obtain in this process helps us to improve our website and app and thus to make your user experience more pleasant.</p>

<p>The following information in particular is processed in the analysis:</p>

<li>the device ID;</li>
<li>registration, log-in and log-out, forgot password;</li>
<li>number of users and sessions (data, time), session length;</li>
<li>operating system, device type, brand, model and resolution;</li>
<li>region, country, language;</li>
<li>age group, gender;</li>
<li>initial launch, app version, app models, app updates;</li>
<li>incidents (such as interactions and events), for example areas/modules visited within the app, contents viewed, clicks on buttons, etc.</li><br>

<p>You can restrict the use of your advertising ID in the device settings of your mobile device:</p>

<li>For Android: Settings &gt; Google &gt; Ads &gt; Reset advertising ID</li>
<li>For iOS: Settings &gt; Privacy &gt; Advertising &gt; Turn off ad tracking</li><br>

<p>The data processing for Firebase may also take place on servers in the US. Data linked with the advertising ID is stored for 60 days, user conversions for 14 months. We have entered into standard contractual clauses with Google if your user personal data is transferred to the US.</p>

<p>For more detailed information about data protection at Google and Firebase, please see:</p>

<li><a href="https://www.google.com/policies/privacy/" target="_blank">https://www.google.com/policies/privacy/</a></li>
<li><a href="https://firebase.google.com/support/privacy/" target="_blank">https://firebase.google.com/support/privacy/</a></li><br>

<p><b>3.4.3. Yandex</b></p>

<p>This website uses Yandex Metrica, a web analysis service of Yandex LLC, 16 Lva Tolstogo str., Moscow, 119021, Russia (<a href="http://www.yandex.com">www.yandex.com</a>), which is offered by Yandex Oy Limited Company – Moreenikatu 6, 04600 Mantsala, Finland (“Yandex”) for users from the European Union and the European Economic Area. Visitor data is collected, evaluated and stored in pseudonymous form using Yandex Metrica on the basis of your consent to the statistical analysis of usage behaviour for optimisation and marketing purposes pursuant to Art. 6(1) (a) GDPR. Pseudonymised usage profiles can be generated from this data and evaluated for the same purpose. Yandex Metrica uses cookies, i.e. small text files, which are stored locally in the cache of the page visitor’s Internet browser. One of the purposes that these cookies are used for is to recognise the browser and thus enable the statistical data to be identified more accurately. The user's IP address is collected and immediately pseudonymised after being collected and before being stored in order to prevent individual users from being identified.</p>

<p>The information created by the cookie (including the pseudonymised IP address) is transferred to and stored on a Yandex server in the Russian Federation in order to safeguard the above-mentioned interests. We have therefore entered into a contract data processing agreement and EU standard contractual clauses with Yandex. The data collected with the Yandex technologies is not used at any time to personally identify the visitor to this website and is not combined with personal data about the bearer of the pseudonym unless the data subject has granted their separate consent to this.</p>

<p>If you would like to disable the evaluation of the user behaviour via cookies, you can adjust your browser settings so that you are informed when cookies are placed on your browser and can decide whether to accept them individually or to prevent cookies from being accepted generally or in specific cases.</p>

<p>Alternatively, you can object to Yandex collecting data in the future by installing an opt-out add-on, which you can obtain from the following website: <a href="https://yandex.com/support/metrica/general/opt-out.xml">https://yandex.com/support/metrica/general/opt-out.xml</a>.</p>

<p>Please see <a href="https://yandex.ru/legal/confidential/?lang=en">Yandex’s privacy policy</a> for more information on the data processing.</p>

<p><b>3.4.4. New Relic</b></p>

<p>A plug-in of the New Relic web analysis service is used on this website for monitoring and analysis purposes. This service is provided by New Relic Inc., 188 Spear Street, Suite 1200, San Francisco, CA 94105, USA. This enables us to record and analyse statistical evaluations of the website's performance (response time, throughput, failure rate, transactions). The plug-in allows New Relic to receive the information that a user has viewed the corresponding page of the offer. System data on add-ons used, browsers as well as hardware and software and utilisation time, known as application data, is collected by New Relic for this purpose, for which cookies are placed on your browser. The cookie placed by New Relic is what is known as a pixel tracker or session cookie, which is automatically deleted when the browser is closed.</p>

<p>If you are logged in here as a user at New Relic, New Relic can assign your visit to your account there. If you are not a member of New Relic, there is nevertheless the possibility that New Relic will be able to find out and store your IP address.</p>

<p>If you are a member of a social network and do not want New Relic to collect data about you from our pages in order to link it with your membership data stored at New Relic, you will have to log out from New Relic before you visit our pages.</p>

<p>We have entered into a contract data processing agreement with New Relic as well as EU standard contractual clauses for the event that personal data is transferred to the US or other third countries.</p>

<p>Please see New Relic’s <a href="https://newrelic.com/termsandconditions/services-notices">data privacy notices</a> for the purpose and scope of the data collection and for information on the processing and use of data by New Relic as well as for setting options to protect users’ privacy.</p>

<p><b>3.5. Marketing tools</b></p>

<p>We also use tools for advertising purposes (“marketing tools”). Some of the access data generated from the use of our website is used for interest-based advertising. By analysing and evaluating this access data, we are able to display personalised advertising, i.e. advertising that corresponds to your actual interests and needs, for you on our website and on the websites of other service providers.</p>

<p>The tools are also used to create profiles in order to show you targeted advertisements corresponding to your preferences, e.g. for a specific model, on advertising platforms. Another purpose is to improve navigation: when you visit our website, we show you products of interest to you or products similar to those you have already viewed. These cookies enable us to use our commercial offering on other affiliated websites (retargeting). In the case of third-party cookies, we have no control over the information provided by the cookie or access to the data. In addition, the third-party providers we engage to place and analyse the clicks on advertisements provide assurances under their data protection provisions that they do not merge user profiles based on data from users of our website with other user profiles that have been derived from third-party sites. If you wish to view cookies from third-party providers, obtain information on the relevant data protection guidelines and actively manage your consent or revocation of consent, we invite you to visit the following page: <a href="http://www.youronlinechoices.com">http://www.youronlinechoices.com</a>.</p>

<p>The legal basis for the processing is provided by your consent pursuant to Art. 6(1) sentence 1 (a) GDPR. Please see 3.1.3: “Withdrawing your consent or changing your selection” for information on withdrawing your consent. For the event that personal data is transferred to the US or other third countries, your consent explicitly also extends to this data transfer (Art. 49(1) sentence 1 (a) GDPR). Please see section 6 (“Transferring data to third countries”) for the risks involved.</p>

<p>We would like to describe these technologies and the providers engaged for this in more detail in the following section: The data collected can include in particular:</p>

<li>the device’s IP address</li>
<li>a cookie’s identification number</li>
<li>the mobile device’s identifier (device ID)</li>
<li>referrer URL (previous page visited)</li>
<li>pages viewed (data, time, URL, title, time spent there)</li>
<li>downloaded files</li>
<li>links to other websites clicked on</li>
<li>where appropriate, achievement of specific targets (conversions)</li>
<li>technical information: operating system, browser type, version and language, device type, brand, model and resolution</li>
<li>approximate location (country and possibly town).</li><br>

<p>The data that is collected is stored exclusively in pseudonymous form, however, so that no direct conclusions can be drawn about a person’s identity.</p>

<p><b>3.5.1. Microsoft Advertising (formerly Bing Ads)</b></p>

<p>Our website uses Microsoft Advertising, a service of Microsoft Corporation, One Microsoft Way, Redmond, WA 98052-6399, USA (“Microsoft”). Microsoft uses cookies and similar technologies in order to show you advertisements that are relevant to you. The use of these technologies enables Microsoft and its partner websites to show advertisements on the basis of previous visits to our or other websites on the Internet.</p>

<p>We also use the UET tag on our website as part of Microsoft Advertising so that we can create usage profiles while using pseudonyms. This service allows us to track users’ activities on our website if they have landed on our website via an advertisement from Microsoft Advertising (formerly Bing Ads). A user who comes to our website via an advertisement of this kind has a cookie placed on their computer. A Bing UET tag is integrated on our website, through which some non-personal data about the use of the website is stored in conjunction with the cookie. This includes among other things the time spent on the website, which areas of the website have been viewed and the advertisement via which the user came to the website. Information concerning the identity of the users is not recorded.</p>

<p>The information recorded is transferred to Microsoft servers in the US, where it is stored in principle for a maximum of 180 days.</p>

<p>You can prevent the data generated by the cookie and relating to your use of the website from being collected and from being processed by disabling the use of cookies. The functions of the website may be restricted as a result. Furthermore, Microsoft may be able to track your usage behaviour across several of your electronic devices using what is known as cross-device tracking and is thus able to show personalised advertising on and in Microsoft websites and apps. You can disable this behaviour at <a href="http://choice.microsoft.com/de-de/opt-out">http://choice.microsoft.com/de-de/opt-out</a> (opt out).</p>

<p>Please see the <a href="https://help.bingads.microsoft.com/#apex/3/de/53056/2">Bing Ads website</a> for more detailed information on Bing’s analysis services. Please see Microsoft’s <a href="https://privacy.microsoft.com/de-de/privacystatement">privacy statement</a> for more detailed information about data protection at Microsoft and Bing.</p>

<p>In addition to withdrawing your consent, you also have the option of disabling the personalised advertisements at <a href="https://about.ads.microsoft.com/de-de/ressourcen/richtlinien/personalisierte-anzeigen">Microsoft Advertising</a> or in the <a href="http://choice.microsoft.com/de-de/opt-out">settings for advertisements</a> in your Microsoft account.</p>

<p>The following cookies are placed by Microsoft Advertising:</p>

<li>“_uetsid”</li>
<li>“_uetvid”</li>
<li>“_MUID”</li><br>

<p>Please see the <a href="https://help.bingads.microsoft.com/#apex/3/de/53056/2">help pages</a> for Microsoft Advertising and Microsoft’s <a href="https://privacy.microsoft.com/de-de/privacystatement">privacy statements</a> for more detailed information on this.</p>

<p><b>3.5.2. Facebook Pixel</b></p>

<p>Our websites use the Facebook pixel service of the Facebook social network, a service that is offered for users outside the USA and Canada by Facebook Ireland Limited, 4 Grand Canal Square, Grand Canal Harbour, Dublin 2, Ireland, and or all other users by Facebook Inc., 1601 Willow Road, Menlo Park, CA 94025, USA (jointly Facebook), for marketing purposes.</p>

<p>We use Facebook Pixel in order to analyse the general use of our websites and to track the effectiveness of Facebook advertising (“conversion tracking”). Moreover, we use Facebook Pixel in order to show you individualised advertising messages based on your interest for our products (“retargeting”). Target group remarketing using Custom Audience is also carried out in this process.</p>

<p>“Facebook Pixel” has been integrated on our website for this purpose. A direct connection between your browser and the Facebook service is created through this tracking pixel. The tracking is carried out using a cookie that is filed on your computer and that records the following information, such as HTTP header information (including IP address, information on the web browser, page storage location, document, URL of the website and user agent as well as date and time of use), and pixel-specific data (this comprises the pixel ID and Facebook cookie data, including your Facebook ID – which are used in order to link events with a specific Facebook advertising account and assign them to a Facebook user).</p>

<p>Using the Facebook pixel, Facebook is able in this connection on the one hand to define the visitors to our online offer as a target group for the display of advertisements (“Facebook ads”). Accordingly, we use the Facebook pixel to show the Facebook ads that we display only to the Facebook users who have also shown an interest in our online offer or who have certain characteristics (e.g. interests in specific issues or products, which are determined using the websites visited), which we transmit to Facebook (“Custom Audiences”). We also want to ensure by using the Facebook pixel that our Facebook ads match the user’s potential interest. Using the Facebook pixel, we can furthermore track the effectiveness of the Facebook advertisements for statistical and market research purposes by seeing whether users have been directed to our website after clicking on a Facebook advertisement (known as “conversion”). The data that is collected is anonymous to use as the operator of this website and we cannot draw any conclusions about the identify of the users. The data is stored and processed by Facebook, however, meaning that a connection to the relevant user profile is possible and Facebook can use the data for its own advertising purposes in accordance with Facebook’s data policy. This allows Facebook to show advertisements on its own websites and also outside Facebook. The use of this data cannot be influenced by use as the website operator.</p>

<p>The data generated in this connection can be transferred to and stored on a server in the US by Facebook for evaluation. We have entered into standard contractual clauses with Facebook for the event that personal data is transferred to the US. The legal basis for the processing is provided by your consent pursuant to Art. 49(1) sentence 1 (a) GDPR. Please see section 6 (“Transferring data to third countries”) for the risks involved.</p>

<p>If you are a member of Facebook and have allowed Facebook to do so in your account’s privacy settings, Facebook can additionally link the information collected about your visit to our website with your membership account and use it for the targeted presentation of Facebook Ads. You can view and change the <a href="https://www.facebook.com/settings/?tab=ads">privacy settings</a> of your Facebook profile at any time.</p>

<p>If you have not consented to the use of Facebook Pixel, Facebook will show only general Facebook Ads that are not selected using the information recorded about you on this website.</p>

<p>Please see Facebook’s <a href="https://www.facebook.com/about/privacy/">privacy policy</a> for more detailed information on this.</p>

<p><b>3.5.3. Google Marketing Platform and Ad Manager (formerly DoubleClick)</b></p>

<p>Our website uses the Google Marketing Platform and the Google Ad Manager, services that are offered to users from the European Economic Area and Switzerland by Google Ireland Limited, Gordon House, Barrow Street, Dublin 4, Ireland, to all other users by Google LLC, 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA (jointly “Google”).</p>

<p>These services use cookies and similar technologies in order to show you advertisements that are relevant to you. The use of the services enables Google and its partner websites to show advertisements on the basis of previous visits to our or other websites on the Internet.</p>

<p>The data generated in this connection can be transferred to and stored on a server in the US by Google for evaluation. We have entered into standard contractual clauses with Google for the event that personal data is transferred to the US.</p>

<p>If you have not consented to the use of Google Marketing Platform and Ad Manager, Google will display only more general advertising that has not been selected using the information collected about you on this website. In addition to withdrawing your consent, you also have the option of disabling personalised advertisements in the <a href="https://adssettings.google.com/authenticated">settings for advertisements</a> at Google.</p>

<p>The following cookies are placed by Google:</p>

<li>“test-cookie” for 12 months</li>
<li>“IDE” for 12 months</li><br>

<p>Please see Google’s <a href="https://policies.google.com/?hl=de">privacy policy</a> for more detailed information on this.</p>

<p><b>3.5.4. Criteo</b></p>

<p>In the context of joint responsibilities within the meaning of Art. 26 GDPR, we use services provided by Criteo SA, 32 Rue Blanche, 75009 Paris, France (“Criteo”) in order to collect information about user behaviour (e.g. products that you have viewed, placed in the shopping cart or purchased) in purely anonymised form with the aim of improving our website offer. As part of the contract with Criteo, we determine the scope of the relevant advertising campaign here. The implementation of this advertising campaign, including the decision on which advertisements are delivered where, then lies in Criteo’s scope of responsibility. To this end, a code created by Criteo is executed on our website directly by Criteo and (re)marketing tags (invisible graphics or code, also called web beacons) are integrated on the website.</p>

<p>These are used to store an individual cookie, i.e. a small file, on your device (similar technologies can also be used instead of cookies). This file makes a note on which websites the user has visited, what contents they are interested in and what offers they have clicked and furthermore contains information on the browser and operating system, referring websites, time of visit as well as other information on the use of the online offer.</p>

<p>Criteo can subsequently display matching product recommendations as advertising banners when other websites are visited (“retargeting”). Personal identification of the website visitor is prevented here. We can exchange information such as technical identifiers from your registration information on our website or our CRM system with reliable advertising partners. As a result, your devices and/or environments can be linked and a seamless user experience can be offered to you with the devices and environments that you use. The information mentioned above can also be connected by Criteo with information of this kind from other sources. When the user subsequently visits other websites, they can be shown the advertisements customised for them in line with their interests. The technical data recorded by Criteo is stored for up to 13 months from the time it is recorded. Cookies from Criteo expire automatically after 13 months.</p>

<p>In the context of the joint responsibility for the above-mentioned processing, you can assert your rights under the GDPR both against us and against Criteo. We have entered into an agreement with Criteo on the joint responsibility and will be happy to provide you with the key contents of this agreement on request.</p>

<p>Please see Criteo’s <a href="https://www.criteo.com/de/privacy/">privacy policy</a> for more details on these linking capabilities and how to object to the anonymous analysis of your browsing habits.</p>

<p><b>3.5.5. Affilinet (AWIN AG)</b></p>

<p>We take part in the performance advertising network and in partner programmes of AWIN AG, Eichhornstraße 3, 10785 Berlin, Germany (hereinafter “AWIN”), a service for integrating advertisements in the form of text links, image links, advertising banners or input masks (“affilinet”). Affilinet uses cookies and similar technologies in order to show you advertisements that are relevant to you. Affilinet also uses web beacons (invisible graphics). These allow information such as visitor traffic to these pages to be evaluated.</p>

<p>As part of its tracking services, AWIN stores cookies on end devices of the website’s users in order to document transactions (e.g. leads and sales). The sole purpose of these cookies is to correctly assign the success of an advertisement and to carry out the corresponding billing within AWIN’s network. The information on this is placed in a cookie only when a certain advertisement has been clicked on from an end device. An individual numerical sequence, which cannot, however, be assigned to the individual user, is filed in the AWIN tracking cookies that is used to document the partner programme of an advertiser, the publisher and the time of the user’s action (click or view). In addition to the information about the use of this website (including the IP address), AWIN also collects information here about the end device from which a transaction is conducted, e.g. the operating system and the requesting browser.</p>

<p>The information collected by cookies and web beacons about the use of this website (including your IP address) and the delivery of advertising formats is transmitted to and stored on an affilinet server. This information can be disclosed by affilinet to its contracting partners. Affilinet will however not combine your IP address with other data stored about you.</p>

<p>The cookies stored by AWIN are deleted after 30 days at the latest.</p>

<p>In addition to withdrawing your consent, you also have the option <a href="https://www.awin.com/de/rechtliches/cookieoptout">of disabling cookies on the AWIN AG website</a>.</p>

<p>Please see AWIN AG’s <a href="https://www.awin.com/de/datenschutzerklarung">privacy policies</a> for more detailed information on this.</p>

<p><b>3.5.6. Webgains</b></p>

<p>Furthermore, we use a plug-in from the Webgains international affiliate network. The service provider is ad pepper media GmbH, Frankenstraße 150C, FrankenCampus, 90461 Nuremberg, Germany (“Webgains”). As a result, we can measure how successful our advertisements are on partner sites that have been communicated to use by Webgains. In this way, we want to show our users advertising that is of interest to them and consequently provide an attractively designed website and achieve a fair calculation of advertising costs. A tracking code is integrated on our website for this purpose. Using this cookie, Webgains can collect pseudonymised data on the visit to our website and on the use of our online offer and provide us on this basis with aggregated, non-personal statistics especially about how many visitors of a particular partner site have ordered something from us after clicking on our advertisement. We have entered into a contract data processing agreement with Webgains.</p>

<p>Please see the Webgains <a href="http://www.webgains.com/public/de/datenschutzerklaerung/">privacy policy</a> for more information on the data processing and options for objecting to it.</p>

<p><b>3.5.7. Kelkoo</b></p>

<p>We use a pixel from the affiliate network of Kelkoo SAS, 12, rue Godot de Mauroy, 75009, Paris, France (“Kelkoo”). The Kelkoo Group operates search and price comparison portals on the Internet.</p>

<p>If you have been redirected to our website from a Kelkoo website, the pixel enables us to measure how successful our advertisements on Kelkoo partner sites are and to track and evaluate user actions on our website in order to optimise our online offer in this way. A tracking pixel is integrated on our website for this purpose. This pixel creates a link between an order completed on our website and the click on an advertisement on a Kelkoo website.</p>

<p>In the event that an order is completed, the order ID (order number) and OrderValue parameter (order/shopping cart value) are sent to Kelkoo together with technical browser information, the time the order was placed and your IP address, which is anonymised by Kelkoo before it is stored. This data is transferred to and saved by Kelkoo, however, only if you have actually placed  an order after being redirected to our website.</p>

<p>Kelkoo is responsible for processing the data that is transferred and, in the course of this transfer, it also measures the data transfer performance on our website for the purposes of measuring the performance of the data traffic (“Kelkoo Sales Tracking”).</p>

<p>The data that Kelkoo collects using the cookies on its own behalf to measure the performance of the Kelkoo advertising campaigns is stored for 12 months.</p>

<p>Please see Kelkoo’s <a href="https://www.kelkoogroup.com/de/datenschutzrichtlinie/">privacy policy</a> for more information on the data processing.</p>

<p><b>3.5.8. Daisycon</b></p>

<p>We use a pixel from the affiliate network of Daisycon B.V., P.J. Oudweg 5, 1314 CH Almere, Netherlands (“Daisycon”). Daisycon acts as a broker for partner websites (known as publishers) on which our products are offered.</p>

<p>If you have been redirected to our website from a Daisycon website, the pixel enables us to measure how successful our advertisements on Daisycon partner sites are and to track and evaluate user actions on our website in order to optimise our online offer in this way. A tracking pixel is integrated on our website for this purpose. This pixel creates a link between the order completed on our website and the click on the advertisement on a Daisycon website.</p>

<p>In the event that an order is completed, the order ID (order number) and OrderValue parameter (order/shopping cart value) are sent to Daisycon together with demographic and geographic characteristics, browser version and settings, which are anonymised in advance, device type and IP address, which are anonymised by Daisycon before they are stored. This data cannot be attributed to a data subject and is processed and shared with Daisycon only for statistical purposes. In addition, pseudonymous transaction IDs are also sent to Daisycon. This data is transferred to and saved by Daisycon, however, only if you have actually placed an order after being redirected to our website.</p>

<p>Daisycon stores only the anonymised IP address for a maximum of up to five years.</p>

<p>We have entered into a contract data processing agreement with Daisycon.</p>

<p>Please see Daisycon’s <a href="https://www.daisycon.com/en/Privacy/">privacy statement</a> for more information on the data processing.</p>

<p><b>3.5.9. Tradedoubler</b></p>

<p>We use a pixel from the affiliate network of Tradedoubler GmbH, Mainzer Straße 13, 80804 Munich, Germany (“Tradedoubler”). Tradedoubler acts as a broker for partner websites (known as publishers) on which our products are offered.</p>

<p>If you have been redirected to our website from a Tradedoubler website, the pixel enables us to measure how successful our advertisements on Daisycon partner sites are and to track and evaluate user actions on our website in order to optimise our online offer in this way and to display advertisements in the Tradedoubler network that are more relevant for you. A tracking pixel is integrated on our website for this purpose. This pixel creates a link between the order completed on our website and the click on the advertisement on a Tradedoubler website.</p>

<p>In the event that an order is completed, the order ID (order number) and OrderValue parameter (order/shopping cart value) are sent to Tradedoubler together with the cookie ID and your IP address.</p>

<p>This data is transferred to and saved by Tradedoubler, however, only if you have actually placed an order after being redirected to our website.</p>

<p>We have entered into a contract data processing agreement with Tradedoubler.</p>

<p>Please see Tradedoubler’s <a href="https://www.tradedoubler.com/en/privacy-policy/">privacy policy</a> for more information on the data processing.</p>

<p><b>3.5.10. Price aggregators</b></p>

<p>We use pixels from price aggregators on our website. These service providers maintain websites and price comparison portals on which our products are offered. If you have been redirected to our website from one of these websites and buy a product, the pixel is activated on our website, so that we can measure how successful our advertisements on the partner websites and comparison portals are. When an order is placed, the relevant order ID (order number) and the OrderValue parameter (order value) are sent to the service provider in question. Other personal data is not transferred. We receive from the service provider in question only the information that you were redirected to our website from this service provider.</p>

<p>We use pixels from the following service providers:</p>

<li>Billiger.de, solute GmbH, Zeppelinstraße 15, 76185 Karlsruhe, Germany. Please see the <a href="https://company.billiger.de/service/datenschutzunterrichtung/index.php">privacy policy</a> of Billiger.de for more information.</li>
<li>Connexity, Connexity Inc., 2120 Colorado Ave., Suite 400, Santa Monica, CA 90404, USA. Please see Connexity’s <a href="https://connexity.com/privacy-policy/">privacy policy</a> for more information.</li>
<li>PriceRunner, PriceRunner Sweden AB, Kungsbron 21, 11122 Stockholm, Sweden. Please see PriceRunner’s <a href="https://www.pricerunner.com/info/privacy">privacy policy</a> for more information.</li><br>

<p><b>3.6. Social media plug-ins and external media</b></p>

<p>We additionally use tools of the social networks that are used to register on the website with existing user accounts as well as other external media, such as embedded videos or maps.</p>

<p>The legal basis for this is provided – unless otherwise stated – by your consent pursuant to Art. 6(1) sentence 1 (a) GDPR, which you grant through the cookie banner or in the relevant tool itself by individually allowing its use via a superimposed banner (overlay). Please see 3.1.3: “Withdrawing your consent or changing your selection” for information on withdrawing your consent. For the event that personal data is transferred to the US or other third countries, your consent explicitly also extends to this data transfer (Art. 49(1) sentence 1 (a) GDPR). Please see section 6 (“Transferring data to third countries”) for the risks involved.</p>

<p><b>3.6.1. Registering with social network user accounts</b></p>

<p>Our website offers you the option of registering with an existing user account on the social networks listed below:</p>

<li>Facebook Login (Facebook Connect): Facebook Ireland Limited, 4 Grand Canal Square, Grand Canal Harbour, Dublin 2, Ireland (for users outside the USA and Canada) and Facebook Inc., 1601 Willow Road, Menlo Park, CA 94025, USA (for all other users) - <a href="https://www.facebook.com/about/privacy/">privacy policy</a></li>
<li>Google Sign-In for Websites: Google Ireland Limited, Gordon House, Barrow Street, Dublin 4, Ireland (for users from the European Economic Area and Switzerland) and Google LLC 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA (for all other users) - <a href="https://www.google.com/policies/privacy/">privacy policy</a></li>
<li>Amazon Sign-On for Websites: Amazon EU S.à.r.l, 38, avenue John F. Kennedy, L-1855 Luxembourg, Luxembourg - <a href="https://www.amazon.de/gp/help/customer/display.html?nodeId=GX7NJQ4ZB8MHFRNJ#GUID-9DFA0CFF-9E83-4207-8EE5-5B1B8CFC3F4A__SECTION_59D17962BEAC4806A83E752ECC5FC54D">privacy policy</a></li><br>

<p>Once you have registered with one of your existing user accounts, you no longer need to register separately. If you want to use this function, you will initially be redirected to the relevant social network. You will be requested there to log in with your username and password. We are of course not informed of this registration data. The server to which a connection is established may be located in the US or in other third countries.</p>

<p>Following confirmation of the corresponding registration button on our website, the relevant social network learns that you have registered on our site with your user account and links your user account with your customer account on our website. The following data is additionally sent to us:</p>

<li>Facebook log-in (Facebook Connect): e-mail address, public profile information (especially Facebook ID, name, profile picture), other profile information if applicable, such as age, date of birth, Facebook friends, gender, place of residence, “Like” information, profile URL, locations, contributions, photos, videos, cookies used, especially: “_fbp”</li>
<li>Google Sign-In for Websites: e-mail address, Google ID, name, profile picture URL</li>
<li>Amazon Sign-On: e-mail address, given name, family name, user ID, gender</li><br>

<p><b>3.6.2. YouTube</b></p>

<p>We have integrated videos from YouTube on this website, which are stored at YouTube and can be played from our website if you have granted your consent to this. The company that operates YouTube is YouTube, LLC, 901 Cherry Ave., San Bruno, CA 94066, USA. YouTube, LLC is a subsidiary of Google Inc., 1600 Amphitheatre Pkwy, Mountain View, CA 94043-1351, USA.</p>

<p>We have enabled YouTube’s privacy-enhanced mode. As a result, Google does not receive any usage information and also does not place cookies until the user actively clicks on the play button. After this button is clicked, the video is played and Google places its own cookies to improve its services and to display individualised advertising in the Google ad network.</p>

<p>When you visit our website, YouTube and Google receive the information that you have viewed the relevant sub-page of our website. This happens irrespective of whether you are logged in at YouTube or Google or not. YouTube and Google use this data for the purposes of advertising, market research and the tailored design of their websites. If you view YouTube on our website while you are logged in to your YouTube or Google profile, YouTube and Google can additionally link this event to the respective profiles. If you do not want this action to be assigned to your account, you have to log out from Google before visiting our website.</p>

<p>In addition to withdrawing your consent, you also have the option of disabling personalised advertisements in the <a href="https://adssettings.google.com/">Google settings for advertisements</a>. In this event, Google will display only non-individualised advertising.</p>

<p>Please see the <a href="https://policies.google.com/privacy?hl=de&amp;gl=de">privacy policy</a> that also applies to YouTube for more information.</p>

<p><b>3.6.3. Trustpilot review portal</b></p>

<p>We use the “Trustpilot” review service, which is provided by Trustpilot A/S, Pilestræde 58, 5. Stock, 1112 Copenhagen, Denmark (<a href="mailto:support@trustpilot.com">support@trustpilot.com</a>) to offer you the possibility of submitting a review of our service. Trustpilot’s <a href="http://legal.trustpilot.de/end-user-terms-and-conditions">terms and conditions</a> and <a href="http://legal.trustpilot.de/end-user-privacy-terms">privacy policies</a> apply to the submission of the review on the Trustpilot website. When you participate in this review system (you would need to register with Trustpilot), your review will be published on our website as well as on the websites of Trustpilot and its partners.</p>

<p>Acting on our behalf, Trustpilot sends you invitations to submit a review. These invitations are sent by e-mail on the basis of Art. 6(1) (a) GDPR and your consent to being sent e-mails of this kind by Autodoc that you grant when you subscribe to our newsletter.</p>

<p>We disclose your e-mail address, your given and family names as well as the order number we have generated to Trustpilot. We have entered into a contract data processing agreement with Trustpilot.</p>

<p>If you have submitted a review through Trustpilot, the above-mentioned data is processed pursuant to Art. 6(1) (f) GDPR on the basis of our legitimate interest in receiving user reviews and thus in creating a basis of trust for the use of our website. The reviews also serve to improve our website, products and services.</p>

<p>The data generated in connection with the submission of the review on the Trustpilot platform can be sent by Trustpilot to subcontractors in third countries and stored there. Trustpilot has entered into EU standard contractual clauses with all of these service providers.</p>

<p>The reviews are published for as long as you maintain your Trustpilot account and are deleted when you delete your account. The record of the deletion with your name and e-mail address and the date of deletion is kept for three years and then also deleted. The data that Trustpilot receives from us in order to send the invitations to submit a review on our behalf is stored for up to three years.</p>

<p>Please see <a href="https://de.legal.trustpilot.com/for-reviewers/end-user-privacy-terms">Trustpilot’s privacy policy</a> and its <a href="https://de.legal.trustpilot.com/for-reviewers/guidelines-for-reviewers">guidelines for reviewers</a> for more information.</p>

<p><b>3.6.4. Reviews with comment function and star rating system</b></p>

<p>We offer the possibility of submitting a public review of our products and our services exclusively on our website. We collect and use the following personal data: name, e-mail address, time the review is submitted and country. In the star rating system, an overall mark using our feedback scale is calculated, where the award of all stars represents the best rating. With the comment function, your review can be published on our websites also only with your initials or with a name (pseudonym) that you have freely selected. The purpose of the data processing in the course of the rating procedure is to offer users the option of reviewing our service on the Internet so that we can improve our products and services. Moreover, potential new customers can in this way receive reliable user experience reports providing information on the quality of the products and services we offer.</p>

<p>The processing is carried out on the basis of Art. 6(1) (f) GDPR and arises from our legitimate interest in receiving user reviews and thus in creating a basis of trust for the use of our website. Our legitimate interest also consists in making reviews of our sales transparent for other customers and in verifying that these reviews are based on the actual purchases.</p>

<ul>
  <li><b>4. Sharing of personal data/Sanctions screening</b></li></ul>

<p>The data that we collect is disclosed in principle only if</p>

<li>you have granted your explicit consent for this in accordance with Art. 6(1) sentence 1 (a) GDPR</li>
<li>the disclosure is necessary pursuant to Art. 6(1) sentence 1 (f) GDPR for the establishment, exercise or defence of legal claims and there is no reason to assume that you have an overriding legitimate interest in not having your data disclosed,</li>
<li>we are required by law to disclose the data pursuant to Art. 6(1) sentence 1 (c) or</li>
<li>the disclosure is permitted by law and is necessary in accordance with Art. 6(1) sentence 1 (b) GDPR for the processing of contractual relationships with you or in order to take steps at your request prior to entering into a contract.</li><br>

<p>Part of the data processing can be carried out by our service providers. In addition to the service providers mentioned in this privacy policy, these service providers can also include computer centres that store our website and databases, software providers, IT service providers that maintain our systems, agencies, market research companies, Group companies and consultancy companies in particular. If we disclose data to our service providers, they may use it only to perform their tasks. The service providers have been carefully selected and engaged by us. They are bound by contract to follow our instructions, have implemented suitable technical and organisational measures to protect the rights of the data subjects and are subject to regular controls by us.</p>

<p>Furthermore, data can be disclosed in connection with official requests, court rulings and legal proceedings if this is necessary for prosecution or law enforcement purposes.</p>

<p>When we send packages and deliver shipments, we share your name, address, phone number and email address with our contracted shipping providers – and any processors – so they can process the delivery and communicate with you about the arrival and coordination of the delivery.
The legal basis for the data processing related to this is Art. 6(1) (a) GDPR, provided you have given us your express consent. To the extent that the data processing is necessary to perform the contractually agreed delivery of goods, the legal basis is Art. 6(1) (b) GDPR. Furthermore, the legal basis for the data processing involved in this is Art. 6(1) (f) GDPR (balancing interests based on our interest in providing smooth delivery at the best times possible for you).</p>

<p>We wish to inform you that, in order to meet our obligations under EU anti-terrorism regulations, we screen against the sanctions lists maintained and published by the EU. The legal basis for this is our legitimate interest pursuant to Art. 6(1) (f) of the General Data Protection Regulation (GDPR) in checking whether the business relationship infringes Section 134 of the German Civil Code (BGB) and in preventing activities that are subject to sanction.</p>

<p>Therefore, when an order is placed we screen your name and delivery address against the current sanctions lists by performing a similarity check. If there is a positive match, we check the result manually. If the manual check does not yield a clearly negative result, we will contact you and may request further information from you for the purposes of screening (in particular, a copy of an identification document showing nationality, date of birth, and place of birth). We will delete copies of identification documents immediately after the manual check. Your order will be temporarily paused during the check. If the check yields a negative result, processing of the order will resume. If the check yields a match with an entry on the sanctions lists, we will inform you of this and give you an opportunity to respond. We will then decide whether to establish/continue the business relationship with you, or not to start/to end it.</p>

<p>If, in individual cases, we are required to transfer your personal data to public bodies (e.g. for prosecution or counter-terrorism purposes), we will transfer your personal data where the relevant legal requirements are met. The legal basis for the transfer is provided by Art. 6(1) (c) GDPR.</p>

<p>We will delete the records and results of screening against sanctions lists five years after the end of the calendar year in which the screening took place.</p>

<ul>
  <li><b>5. Storage period</b></li></ul>

<p>In principle, we store personal data only for as long as is necessary to fulfil the purpose for which we have collected the data. We subsequently delete the data immediately, unless we still require the data up to the expiry of the statutory limitation period for evidential purposes in civil law claims or on account of statutory retention obligations.</p>

<p>We have to retain contract data for evidential purposes for three years from the end of the year in which the business relationships with you end. Any claims become time-barred at the earliest at this point in time after the statutory limitation period.</p>

<p>We sometimes also have to store your data for longer than this for accounting reasons. We are required to do this on account of statutory documentation obligations that can result from the German Commercial Code, the German Fiscal Code, the German Banking Act, the German Money Laundering Act and the German Securities Trading Act. The periods for retaining documents that are defined in these acts range from two to ten years.</p>

<ul>
  <li><b>6. Transferring data to third countries</b></li></ul>

<p>As explained in this privacy policy, we use services where some of the providers are located or process personal data in what are known as third countries (outside of the European Union or the European Economic Area), i.e. countries where the level of data protection does not fulfil the standards in the European Union. If this is the case and the European Commission has not issued an adequacy decision (Art. 45 GDPR) for these countries, we have taken suitable precautions in order to guarantee an appropriate level of protection for any data transmissions. These include the standard contractual clauses of the European Union or binding internal data protection regulations.</p>

<p>Where this is not possible we base the data transfer on derogations under Art. 49 GDPR, especially your explicit consent or the necessity of the transmission for the performance of a contract or the implementation of pre-contractual measures.</p>

<p>If it is planned to transmit data to third countries and an adequacy decision or suitable guarantees are not in place, it is possible and there is the risk that authorities in the relevant third country (e.g. intelligence agencies) can gain access to the data that is transferred in order to record and analyse it and that the enforcement of your rights as a data subject cannot be guaranteed. You will be informed of this when your consent is obtained via the cookie banner.</p>

<ul>
  <li><b>7. Online presence on social networks</b></li></ul>

<p>We maintain an online presence on social networks in order to communicate there with customers and interested parties and to inform them of our products and services.</p>

<p>Users’ data is generally processed by the social networks for market research and advertising purposes. This enables user profiles to be created based on users’ interests. Cookies and other identifiers are saved on users’ computers for this purpose. Advertisements are then shown for example within the social networks, but also on third-party websites, on the basis of these user profiles. As part of the operation of our online presence, the possibility exists that we will be able to access information, such as statistics on the use of the various forms of our online presence, that is provided by the social networks. These statistics are aggregated and can include in particular demographic information and data on the interaction with our forms of online presence and the contributions and contents communicated through them. Please see the list below for details of and links to the data of the social networks that we can access as the operator of the online presence.</p>

<p>The legal basis for the data processing is provided by Art. 6(1) sentence 1 (f) GDPR based on our legitimate interest in providing effective information for the users and communicating with the users or by Art. 6(1) sentence 1 (b) GDPR in order to stay in contact with our customers and to provide them with information as well as to take steps prior to entering into a contract with future customers and interested parties.</p>

<p>Please see the privacy policies of the relevant social networks for the legal basis for the data processing that they are independently responsible for carrying out. You can additionally get more information about the relevant data processing and your possibilities for objecting to it from the links provided below.</p>

<p>We draw your attention to the fact that the most efficient way to assert requests about data protection is by contacting the respective provider of the social network, as only these providers have access to the data and can directly institute appropriate measures. The list below provides information on the social networks on which we conduct an online presence:</p>

<li>Facebook (USA and Canada: Facebook Inc., 1601 Willow Road, Menlo Park, CA 94025, USA; all other countries: Facebook Ireland Ltd., 4 Grand Canal Square, Grand Canal Harbour, Dublin 2, Ireland)<br><br>

- Operation of the Facebook fan page subject to joint responsibility on the basis of an <a href="https://www.facebook.com/legal/terms/page_controller_addendum">agreement on joint processing of personal data</a> (page insights addendum concerning the controller)<br>
- Information on the processed page insights data and on contact options if you have questions about data protection: <a href="https://www.facebook.com/legal/terms/information_about_page_insights_data">https://www.facebook.com/legal/terms/information_about_page_insights_data</a><br>
- Privacy policy: <a href="https://www.facebook.com/about/privacy/">https://www.facebook.com/about/privacy/</a><br>
- Opt-out: <a href="https://www.facebook.com/settings?tab=ads">https://www.facebook.com/settings?tab=ads</a> and <a href="http://www.youronlinechoices.com">http://www.youronlinechoices.com</a>.<br><br></li>

<li>Instagram (Facebook Ireland Ltd., 4 Grand Canal Square, Grand Canal Harbour, Dublin 2, Ireland)<br><br>

- Privacy policy: <a href="https://help.instagram.com/519522125107875">https://help.instagram.com/519522125107875</a><br><br></li>

<li>Google/YouTube (Google Ireland Limited, Gordon House, Barrow Street, Dublin 4, Ireland)<br><br>

- Privacy policy: <a href="https://policies.google.com/privacy">https://policies.google.com/privacy</a><br>
- Opt-out: <a href="https://www.google.com/settings/ads">https://www.google.com/settings/ads</a>.<br><br></li>

<li>Twitter (Twitter International Company, One Cumberland Place, Fenian Street, Dublin 2, D02 AX07 Ireland)<br><br>

- Privacy policy: <a href="https://twitter.com/de/privacy">https://twitter.com/de/privacy</a><br>
- Opt-out: <a href="https://twitter.com/personalization">https://twitter.com/personalization</a>.<br><br></li>

<li>LinkedIn (LinkedIn Ireland Unlimited Company Wilton Place, Dublin 2, Ireland)<br><br>

- Operation of the LinkedIn corporate page subject to joint responsibility on the basis of an <a href="https://legal.linkedin.com/pages-joint-controller-addendum">agreement on joint processing of personal data</a> (page insights joint controller addendum)<br>
- Information on the processed page insights data and on contact options if you have questions about data protection: <a href="https://legal.linkedin.com/pages-joint-controller-addendum">https://legal.linkedin.com/pages-joint-controller-addendum</a><br>
- Privacy policy: <a href="https://www.linkedin.com/legal/privacy-policy">https://www.linkedin.com/legal/privacy-policy</a><br>
- Opt-out: <a href="https://www.linkedin.com/psettings/guest-controls/retargeting-opt-out">https://www.linkedin.com/psettings/guest-controls/retargeting-opt-out</a>.<br><br></li>

<li>Xing/Kununu (XING SE, Dammtorstraße 30, 20354 Hamburg, Germany)<br><br>

- Privacy policy/opt-out: <a href="https://privacy.xing.com/de/datenschutzerklaerung">https://privacy.xing.com/de/datenschutzerklaerung</a>.<br><br></li>

<li>Pinterest (Pinterest Europe Limited, 2nd Floor, Palmerston House, Fenian Street, Dublin 2, Ireland)<br><br>
	
- Privacy policy: <a href="https://policy.pinterest.com/en/privacy-policy">https://policy.pinterest.com/en/privacy-policy</a><br><br></li>

<li>TikTok (TikTok Technology Limited, 10 Earlsfort Terrace, Dublin, D02 T380 Ireland)<br><br>
	
- Privacy policy/opt-out: <a href="https://www.tiktok.com/legal/privacy-policy?lang=en">https://www.tiktok.com/legal/privacy-policy?lang=en</a><br><br></li>

<ul>
  <li><b>8. Rights of the data subject</b></li></ul>

<p>You are entitled to the data subject’s rights formulated in Art. 15 to 21 and Art. 77 EU GDPR at any time: </p>

<li>Right to withdraw your consent</li>
<li>Right to object to the processing of your personal data (Art. 21 GDPR)</li>
<li>Right to obtain information about your personal data that is processed by us (Art. 15. GDPR)</li>
<li>Right to rectification of your personal data that is incorrectly stored by us (Art. 16 GDPR)</li>
<li>Right to have your personal data erased (Art. 17 GDPR)</li>
<li>The right to restrict the processing of your personal data (Art. 18 GDPR)</li>
<li>The right to transfer your personal data (Art. 20 GDPR)</li>
<li>Right to lodge a complaint with a supervisory authority (Art. 77 GDPR)</li><br>

<p>You can contact us using the contact details given above at any time in order to assert your rights that are described here. This also applies if you want to receive copies of guarantees as proof of an appropriate data protection level. If the relevant legal requirements are met, we will comply with your data protection request.</p>

<p>Your requests to assert data protection rights and our responses to them are retained for documentation purposes for a period of up to three years and also beyond that on a case-by-case basis for the establishment, exercise or defence of legal claims. The legal basis is provided by Art. 6(1) sentence 1 (f) GDPR based on our interest in defending any claims under civil law in accordance with Art. 82 GDPR, in avoiding administrative fines in accordance with Art. 83 GDPR and in fulfilling our accountability arising from Art. 5(2) GDPR.</p>

<p style="border: 2px solid #000000; background-color:#FFFFFF; padding: 1px;">You have the right to withdraw any consent you have previously granted at any time. This has the consequence that we will no longer continue in the future the data processing that was based on this consent. The withdrawal of consent shall not affect the lawfulness of processing based on consent before it was withdrawn.<br><br>
If we process your data on the basis of legitimate interests, you have the right to file an objection to the processing at any time on grounds relating to your particular situation. If this involves an objection to the data processing for direct advertising purposes, you have a general right to object that will be implemented by us without you having to state your reasons for this.<br><br>
If you would like to make use of your right to withdraw consent or file an objection, a simple message sent to the contact details specified above will suffice.</p><br>

<p>Finally, you have the right to lodge a complaint with a data protection supervisory authority in the member state in which you have your habitual residence or place of work or in which the alleged breach took place.</p>

<ul>
  <li><b>9. Amendments to the privacy policy</b></li></ul>

<p>We occasionally update this privacy policy, for example when we modify our website or the legal or regulatory requirements change.</p>

 <p>Version: 1.0 / updated: 08.09.2021</p>
    </div>
</div>'''),
        ),
      ),
    );
  }
}
