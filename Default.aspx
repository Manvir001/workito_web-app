<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication_App._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <div class="text-center">
            <strong><span style="font-size: xx-large">Login</span></strong></div>
        <table class="nav-justified">
            <tr>
                <td class="modal-lg" style="width: 540px; text-align: right; height: 25px">UserName:</td>
                <td style="height: 25px">
                    <asp:TextBox ID="TextBoxUsername" runat="server" Width="180px" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UsernameRequiredFieldValidator" runat="server" ControlToValidate="TextBoxUsername" ErrorMessage="Please enter Username" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td style="height: 25px"></td>
            </tr>
            <tr>
                <td class="modal-lg" style="width: 540px; text-align: right; height: 22px">Password:</td>
                <td style="height: 22px">
                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="PasswordRequiredFieldValidator" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Please enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td style="height: 22px"></td>
            </tr>
            <tr>
                
                <td class="modal-lg" style="width: 540px; text-align: right; height: 30px;"></td>

                <td style="height: 30px">
                    <asp:Button ID="Button_Login" runat="server" Height="30px" Text="Login" Width="125px" OnClick="Button_Login_Click1" />
                </td>
                <td style="height: 30px"></td>
            </tr>
             <td style="width: 540px; text-align: right; height: 40px;">&nbsp;</td>
                 <td>   <strong>
                    <asp:Label ID="Label_wrongP" runat="server" Visible="false" Style="color:red" Text="Wrong user name or password"></asp:Label>
                    </strong>
                </td>
                
        </table>

</asp:Content>
