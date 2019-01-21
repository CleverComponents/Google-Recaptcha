using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;


public class ReCaptcha
{
	public static bool Validate(string privateKey, string reCaptchaResponse)
	{
		var client = new System.Net.WebClient();

		var googleReply = client.DownloadString(string.Format("https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}", privateKey, reCaptchaResponse));

		var captchaResponse = Newtonsoft.Json.JsonConvert.DeserializeObject<ReCaptcha>(googleReply);

		return (captchaResponse.Success.ToLower() == "true");
	}

	[JsonProperty("success")]
	public string Success
	{
		get { return m_Success; }
		set { m_Success = value; }
	}

	private string m_Success;
	[JsonProperty("error-codes")]
	public List<string> ErrorCodes
	{
		get { return m_ErrorCodes; }
		set { m_ErrorCodes = value; }
	}

	private List<string> m_ErrorCodes;
}
