<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Maintenance.Master" AutoEventWireup="true" CodeBehind="FrmMNReport.aspx.cs" Inherits="MaintenanceService.Maintenance.FrmMNReport" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.XtraReports.v14.2.Web, Version=14.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4
        {
            width: 218px;
        }
        .auto-style5
        {
            height: 28px;
        }
        
.dxeButtonEditSys 
{
    border-collapse: separate;
    border-spacing: 1px;
}

.dxeTextBoxSys,
.dxeButtonEditSys 
{
    width: 170px;
}

.dxeButtonEditSys 
{
    border-collapse: separate;
    border-spacing: 1px;
}

.dxeButtonEditSys 
{
    width: 170px;
}

.dxeMemoEditAreaSys, /*Bootstrap correction*/
input[type="text"].dxeEditAreaSys, /*Bootstrap correction*/
input[type="password"].dxeEditAreaSys /*Bootstrap correction*/
{
    display: block;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
    -webkit-transition: none;
    -moz-transition: none;
    -o-transition: none;
    transition: none;
	-webkit-border-radius: 0px;
    -moz-border-radius: 0px;
    border-radius: 0px;
}
.dxeEditAreaSys,
.dxeMemoEditAreaSys, /*Bootstrap correction*/
input[type="text"].dxeEditAreaSys, /*Bootstrap correction*/
input[type="password"].dxeEditAreaSys /*Bootstrap correction*/
{
    font: inherit;
    line-height: normal;
    outline: 0;
}

input[type="text"].dxeEditAreaSys, /*Bootstrap correction*/
input[type="password"].dxeEditAreaSys /*Bootstrap correction*/
{
    margin-top: 0;
    margin-bottom: 0;
}
.dxeEditAreaSys,
input[type="text"].dxeEditAreaSys, /*Bootstrap correction*/
input[type="password"].dxeEditAreaSys /*Bootstrap correction*/
{
    padding: 0px 1px 0px 0px; /* B146658 */
}
.dxeEditAreaSys 
{
    border: 0px!important;
    background-position: 0 0; /* iOS Safari */
    -webkit-box-sizing: content-box; /*Bootstrap correction*/
    -moz-box-sizing: content-box; /*Bootstrap correction*/
    box-sizing: content-box; /*Bootstrap correction*/
}

.dxeEditAreaSys 
{
    border: 0px!important;
    background-position: 0 0; /* iOS Safari */
    -webkit-box-sizing: content-box; /*Bootstrap correction*/
    -moz-box-sizing: content-box; /*Bootstrap correction*/
    box-sizing: content-box; /*Bootstrap correction*/
}


.dxeButtonEditSys .dxeButton
{
    line-height: 100%;
}


.dxeButtonEditSys .dxeButton
{
    line-height: 100%;
}


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="dxflInternalEditorTable_Moderno">
        <tr>
            <td class="auto-style5" colspan="10">
                <asp:Label ID="Label3" runat="server" Text="Issue Report" style="font-weight: 700"></asp:Label>
               <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="lblissueno" runat="server" Text="Label"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td class="auto-style5" colspan="10">
                 <div>
                    <dx:ASPxDocumentViewer ID="ASPxDocumentViewer1" runat="server" ReportTypeName="StdTimeEditor.Report.xr_ReportProductionOoder">
                    </dx:ASPxDocumentViewer>
                </div> 
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="10">&nbsp;</td>
        </tr>
        </table>
</asp:Content>
