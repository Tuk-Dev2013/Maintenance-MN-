<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="PageMovement.aspx.cs" Inherits="StdTimeEditor.PageMovement" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register assembly="DevExpress.XtraReports.v14.2.Web, Version=14.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2
        {
            width: 100%;
        }
        .auto-style5
        {
            width: 86px;
            text-align: right;
        }
        .auto-style7
        {
            text-align: left;
        }
        .auto-style10
        {
            width: 86px;
            text-align: right;
            height: 28px;
        }
        .auto-style12
        {
            height: 28px;
        }
        .auto-style13
        {
            width: 150px;
        }
        .auto-style14
        {
            width: 150px;
            height: 28px;
        }
        .auto-style15
        {
            width: 147px;
        }
        .auto-style16
        {
            width: 147px;
            height: 28px;
        }
        .auto-style17
        {
            width: 123px;
            text-align: right;
        }
        .auto-style18
        {
            text-align: right;
            height: 28px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="auto-style2">
        <tr>
            <td class="auto-style7" colspan="4">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:Label ID="Label5" runat="server" Text="Movement Report" style="color: #3333FF; font-style: italic; font-weight: 700;" Font-Size="Large"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="Label3" runat="server" Font-Size="Medium" Text="From Date :" Visible="False"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="auto-style15">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <dx:ASPxDateEdit ID="ASPxDateEdit1" runat="server" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="yyyy-MM-dd" Width="149px" Visible="False">
                        </dx:ASPxDateEdit>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="auto-style5">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="Label4" runat="server" Text="To Date :" Font-Size="Medium" Visible="False"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="auto-style13">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <dx:ASPxDateEdit ID="ASPxDateEdit2" runat="server" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="yyyy-MM-dd" Width="149px" Visible="False">
                        </dx:ASPxDateEdit>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
                        <dx:ASPxButton ID="ASPxButton1" runat="server" style="font-weight: 700" Text="Preview" OnClick="ASPxButton1_Click" Visible="False">
                            <Image IconID="print_print_16x16">
                            </Image>
                        </dx:ASPxButton>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style18" colspan="7">
                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                    <ContentTemplate>
                        <dx:ASPxDocumentViewer ID="ASPxDocumentViewer1" runat="server" ReportTypeName="StdTimeEditor.xrREPORT.xr_01CheckBatchAll">
                        </dx:ASPxDocumentViewer>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td class="auto-style18"></td>
            <td class="auto-style16"></td>
            <td class="auto-style10"></td>
            <td class="auto-style14"></td>
            <td class="auto-style12"></td>
            <td class="auto-style12"></td>
            <td class="auto-style12"></td>
        </tr>
        <tr>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style13">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
