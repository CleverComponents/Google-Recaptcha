<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Google reCAPTCHA in an ASP.NET Login Page</h1>
        <p class="lead">Google reCAPTCHA protects you against spam and other types of automated abuse. It is used to stop spam on a website, and verify, whether the user is human or not.</p>
		<p class="lead">Please try to log in and see how it works <a runat="server" href="~/Account/Login" class="btn btn-primary btn-lg">Log In &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Read the Article</h2>
            <p>
                This article provides an example of implementing an invisible reCAPTCHA on an ASP.NET Login page.
            </p>
            <p>
                <a class="btn btn-default" href="http://www.clevercomponents.com/articles/article045/">Read the Article &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Discuss the Article</h2>
            <p>
                Discuss the article at Facebook Clever Components Community.
            </p>
            <p>
                <a class="btn btn-default" href="https://www.facebook.com/clevercomponents/">Visit the Community Group &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>More Articles</h2>
            <p>
                Read more Clever Components articles at CleverComponents.com wesite.
            </p>
            <p>
                <a class="btn btn-default" href="http://www.clevercomponents.com/articles/">Learn more &raquo;</a>
            </p>
        </div>
    </div>
</asp:Content>
