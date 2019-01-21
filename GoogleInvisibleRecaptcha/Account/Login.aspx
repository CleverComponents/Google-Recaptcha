<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" Async="true" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="HeaderContent">
	<script src='https://www.google.com/recaptcha/api.js' async defer></script>
	<script>
		var btnLoginEvent = null;

		function DoLogin() {
			var btn = document.getElementById("<%:btnLogIn.ClientID%>");
			btn.onclick = btnLoginEvent;
			btn.click();
		}
		
		function DoValidate(event) {
			event.preventDefault();
			if (Page_ClientValidate()) {
				grecaptcha.execute();
			}
		}

		function DoLoad() {
			var btn = document.getElementById("<%:btnLogIn.ClientID%>");
			btnLoginEvent = btn.onclick;
			btn.onclick = DoValidate;
		}
	</script>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>

    <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4>Use a local account to log in.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">User name</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                                CssClass="text-danger" ErrorMessage="The user name field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
							<div class="g-recaptcha"
								data-sitekey="<%:CaptchaSiteKey%>"
								data-callback="DoLogin"
								data-size="invisible">
							</div>
                            <asp:Button ID="btnLogIn" runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
	<script>
		DoLoad();
	</script>
</asp:Content>

