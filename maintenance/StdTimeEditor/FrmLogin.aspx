<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="FrmLogin.aspx.cs" Inherits="StdTimeEditor.FrmLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style2
    {
        width: 100%;
    }
    .auto-style3
    {
        width: 117px;
    }
    .auto-style4
    {
        width: 84px;
    }
    .auto-style5
    {
        height: 56px;
    }
    .auto-style6
    {
        width: 84px;
        height: 56px;
    }
    .auto-style7
    {
        width: 117px;
        height: 56px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="auto-style2">
    <tr>
        <td class="auto-style5" colspan="4">
         <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        </td>
        <td class="auto-style5"></td>
        <td class="auto-style5"></td>
        <td class="auto-style5"></td>
        <td class="auto-style5"></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style3">&nbsp;</td>
        <td>
            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                <ContentTemplate>
                    <asp:Label ID="Label5" runat="server" Text="กรุณา ป้อนสิทธิ์ ในการจัดการข้อมูล ลบ/แก้ไข/เพิ่ม ข้อมูล"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style3">
            <asp:Label ID="Label3" runat="server" Text="UserName:"></asp:Label>
        </td>
        <td>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="txtusername" runat="server" Width="182px"></asp:TextBox>
                </ContentTemplate>
            </asp:UpdatePanel>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style3">
            <asp:Label ID="Label4" runat="server" Text="PassWord:"></asp:Label>
        </td>
        <td>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" Width="182px"></asp:TextBox>
                </ContentTemplate>
            </asp:UpdatePanel>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style3">&nbsp;</td>
        <td>
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login by Delete" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style3">&nbsp;</td>
        <td>
            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                <ContentTemplate>
                    <asp:Label ID="lblme" runat="server" ForeColor="Red"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style3">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style3">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style3">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>
