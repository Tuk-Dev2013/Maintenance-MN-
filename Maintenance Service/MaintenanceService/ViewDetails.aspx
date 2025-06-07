<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDetails.aspx.cs" Inherits="MaintenanceService.ViewDetails" %>

<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


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

.dxeButtonEditSys td.dxic 
{
    padding: 2px 2px 1px 2px;
    overflow: hidden;
}

.dxeButtonEditSys .dxeEditAreaSys,
.dxeButtonEditSys td.dxic,
.dxeTextBoxSys td.dxic,
.dxeMemoSys td,
.dxeEditAreaSys
{
	width: 100%;
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
.dxic .dxeEditAreaSys
{
	padding: 0px 1px 0px 0px;
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


.dxpDesignMode,
.dxpDesignMode b {
	float: none !important;
}

.dxpDesignMode {
	display: inline;
}

.dxpDesignMode {
	float: none !important;
}


.dxpDesignMode {
	display: inline;
}

.dxpDesignMode b {
	float: none !important;
}

.dxp-summary,
.dxp-sep,
.dxp-button,
.dxp-pageSizeItem,
.dxp-num,
.dxp-current,
.dxp-ellip
{
	display: block;
	float: left;
    line-height: 100%;
}

.dxp-summary
{
	display: block;
	float: left;
    line-height: 100%;
}
.dxp-current,
.dxp-disabledButton, 
.dxp-disabledButton span
{
    cursor: default;
}
.dxp-button,
.dxp-dropDownButton,
.dxp-num
{
    cursor: pointer;
}

.dxp-button
{
	display: block;
	float: left;
    line-height: 100%;
}
.dxp-button
{
    cursor: pointer;
}

.dxp-current
{
	display: block;
	float: left;
    line-height: 100%;
}

.dxp-num
{
	display: block;
	float: left;
    line-height: 100%;
}

.dxp-num
{
    cursor: pointer;
}

.dx-clear
{
	display: block;
	clear: both;
	height: 0;
	width: 0;
	font-size: 0;
	line-height: 0;
	overflow: hidden;
	visibility: hidden;
}
.dx-clear
{
	display: block;
	clear: both;
	height: 0;
	width: 0;
	font-size: 0;
	line-height: 0;
	overflow: hidden;
	visibility: hidden;
}
        .auto-style1
        {
            border-width: 0;
            background-image: url('mvwres://DevExpress.Web.ASPxThemes.v14.2,%20Version=14.2.5.0,%20Culture=neutral,%20PublicKeyToken=b88d1754d700e49a/DevExpress.Web.ASPxThemes.App_Themes.Office2010Black.Editors.sprite.png');
        }
        .auto-style2
        {
            border-width: 0;
            background-image: url('mvwres://DevExpress.Web.ASPxThemes.v14.2,%20Version=14.2.5.0,%20Culture=neutral,%20PublicKeyToken=b88d1754d700e49a/DevExpress.Web.ASPxThemes.App_Themes.Office2010Black.Web.sprite.png');
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <dx:ASPxGridView ID="gvStdTime" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" Theme="Office2010Black" Width="100%">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="No" FieldName="Row" ReadOnly="True" VisibleIndex="0" Width="60px">
                                            <HeaderStyle VerticalAlign="Middle" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Itemcode" VisibleIndex="1" Width="90px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="ItemName" VisibleIndex="2" Width="140px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataDateColumn FieldName="OrderDate" VisibleIndex="3" Width="90px">
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataDateColumn FieldName="ReceivedDate" VisibleIndex="4" Width="100px">
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn Caption="Qty" FieldName="OrderQty" VisibleIndex="5" Width="70px">
                                            <HeaderStyle HorizontalAlign="Right" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Remark" Visible="False" VisibleIndex="6" Width="150px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="7" Width="90px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="ProductionID" FieldName="ProductionID" Visible="False" VisibleIndex="8">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataHyperLinkColumn Caption="Select" FieldName="ProductionID" VisibleIndex="11" Width="40px">
                                            <PropertiesHyperLinkEdit ImageHeight="15px" ImageUrl="~/Images/edit.png" ImageWidth="15px" NavigateUrlFormatString="~/ViewDetails.aspx?ProductionID={0}&amp;mode=Delete">
                                            </PropertiesHyperLinkEdit>
                                            <HeaderStyle Font-Bold="True" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataHyperLinkColumn>
                                    </Columns>
                                    <SettingsPager PageSize="30">
                                    </SettingsPager>
                                    <SettingsCommandButton>
                                        <NewButton ButtonType="Button" Text="Add">
                                        </NewButton>
                                        <UpdateButton ButtonType="Button" Text="Save">
                                        </UpdateButton>
                                        <CancelButton ButtonType="Button">
                                        </CancelButton>
                                        <EditButton ButtonType="Button">
                                        </EditButton>
                                        <DeleteButton ButtonType="Button">
                                        </DeleteButton>
                                    </SettingsCommandButton>
                                    <settingsdatasecurity AllowDelete="False" AllowEdit="False" allowinsert="False" />
                                    <SettingsSearchPanel Visible="True" />
                                    <Styles>
                                        <Header HorizontalAlign="Center">
                                        </Header>
                                        <Row BackColor="White">
                                        </Row>
                                        <DetailRow BackColor="#CCFFFF">
                                        </DetailRow>
                                        <DetailCell BackColor="#FF9999">
                                        </DetailCell>
                                        <PreviewRow BackColor="#CCCCCC">
                                        </PreviewRow>
                                        <AlternatingRow BackColor="Silver">
                                        </AlternatingRow>
                                        <selectedrow backcolor="#E4EFFA">
                                        </selectedrow>
                                        <Cell BackColor="White">
                                        </Cell>
                                    </Styles>
                                </dx:ASPxGridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBBarcode %>" SelectCommand="select ROW_NUMBER() OVER(ORDER BY Status Desc) AS Row,Itemcode, ItemName, convert(date,OrderDate)as OrderDate, convert(date,ReceivedDate)as ReceivedDate, OrderQty, Remark, Status,ProductionID
from [dbo].[ProductionOrder]
where Status='On Process'
Order by Status Desc,ProductionID Desc"></asp:SqlDataSource>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </ContentTemplate>
        </asp:UpdatePanel>
    
    </div>
    </form>
</body>
</html>
