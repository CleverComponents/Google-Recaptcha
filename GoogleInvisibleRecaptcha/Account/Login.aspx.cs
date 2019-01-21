using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI;
using GoogleInvisibleRecaptcha;

public partial class Account_Login : Page
{
	public string CaptchaSiteKey
	{
		get
		{
			return System.Configuration.ConfigurationManager.AppSettings["CaptchaSiteKey"];
		}
	}

	public string CaptchaSecret
	{
		get
		{
			return System.Configuration.ConfigurationManager.AppSettings["CaptchaSecret"];
		}
	}

	protected void Page_Load(object sender, EventArgs e)
	{
	}

	protected void LogIn(object sender, EventArgs e)
	{
		if (!ReCaptcha.Validate(CaptchaSecret, Request.Form["g-recaptcha-response"]))
		{
			FailureText.Text = "reCAPTCHA error";
			ErrorMessage.Visible = true;
		}
		else if (IsValid)
		{
			// Validate the user password
			var manager = new UserManager();
			ApplicationUser user = manager.Find(UserName.Text, Password.Text);
			if (user != null)
			{
				IdentityHelper.SignIn(manager, user, RememberMe.Checked);
				IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
			}
			else
			{
				FailureText.Text = "Invalid username or password.";
				ErrorMessage.Visible = true;
			}
		}
	}
}