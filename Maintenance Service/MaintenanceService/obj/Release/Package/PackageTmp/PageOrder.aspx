<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="PageOrder.aspx.cs" Inherits="MaintenanceService.PageOrder" %>
<%@ Register assembly="DevExpress.XtraReports.v14.2.Web, Version=14.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx1" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4
        {
            width: 167px;
            text-align: right;
        }
        .auto-style6
        {
            width: 167px;
            height: 28px;
        }
            
.dxeButtonEditSys 
{
    width: 170px;
}

.dxeButtonEditSys 
{
    border-collapse: separate;
    border-spacing: 1px;
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


.dxpDesignMode {
	display: inline;
}

.dxpDesignMode {
	float: none !important;
}

.dxpDesignMode b {
	float: none !important;
}

.dxp-summary
{
	display: block;
	float: left;
    line-height: 100%;
}
.dxp-button
{
    cursor: pointer;
}

.dxp-button
{
	display: block;
	float: left;
    line-height: 100%;
}
.dxp-num
{
    cursor: pointer;
}

.dxp-num
{
	display: block;
	float: left;
    line-height: 100%;
}

.dxp-current
{
	display: block;
	float: left;
    line-height: 100%;
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
        .auto-style7
        {
            width: 167px;
            text-align: left;
            height: 32px;
        }
        .auto-style8
        {
            height: 32px;
        }
        .auto-style9
        {
            text-decoration: underline;
        }
    </style>
        <script type="text/javascript">
            function EnterEvent(e) {
                if (e.keyCode == 13) {
                    __doPostBack('<%=btnSave.UniqueID%>', "");
                }
            }
    </script>

    <script type="text/javascript">
        function ConfirmDelete() {
            if (confirm('Do you want to delete?')) {
                return true;
            } else {
                return false;
            }
        }
    </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="auto-style2" Width="100%">
        <tr>
            <td class="auto-style3" colspan="2">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <span class="auto-style9"><strong>Production Order</strong></span></td>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="Label3" runat="server" Text="Barcode Order:" Font-Size="Large"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td colspan="4">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtbarcode" runat="server"  BackColor="#FFFFCC" Height="23px" Width="262px"></asp:TextBox>
                        <asp:TextBox ID="txtname" runat="server" Enabled="False" Height="23px" Width="565px"></asp:TextBox>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="Label4" runat="server" Text="Qty. :" Font-Size="Large"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="txtqty" runat="server" BackColor="White" Height="23px" Width="122px"></asp:TextBox>
                                <asp:Label ID="lblqty" runat="server" ForeColor="Red" Text="***" Visible="False"></asp:Label>
                               
                               
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right">
               
                <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="Label5" runat="server" Font-Size="Large" Text="Order Date :"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
               
            </td>
            <td>
                <ContentTemplate>
                        <dx:ASPxDateEdit ID="ASPxDateEdit1" runat="server" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="yyyy-MM-dd" Width="149px">
                        </dx:ASPxDateEdit>
                    </ContentTemplate
            </td>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
             <td style="text-align: right">
               
                <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="Label6" runat="server" Font-Size="Large" Text="Received Date :"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>
                 <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                    <ContentTemplate>
                        <dx:ASPxDateEdit ID="ASPxDateEdit2" runat="server" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="yyyy-MM-dd" Width="149px">
                        </dx:ASPxDateEdit>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="auto-style8"></td>
            <td class="auto-style8"></td>
            <td class="auto-style8"></td>
            <td class="auto-style8"></td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Remark :"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
              </td>
            <td> <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="txtremark" runat="server"  Width="494px"></asp:TextBox>
                    </asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
                 </td>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6"></td>
            <td class="auto-style7">
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnSave" runat="server" Text="SAVE" Width="115px" Enabled="False" OnClick="btnSave_Click"  />
                        <asp:Button ID="bntcancel" runat="server" Text="CANCEL" Width="115px" OnClick="bntcancel_Click" />
                        <asp:Button ID="bntdelete" runat="server" BackColor="#FFCCCC" Text="DELETE" Width="115px" OnClick="bntdelete_Click"  OnClientClick="return ConfirmDelete();" />
                        <asp:Label ID="lbldelete" runat="server" Font-Size="Medium" Text="&lt;&lt;--ยืนยันการลบ" ForeColor="#FF3300"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="auto-style7"></td>
            <td class="auto-style8"></td>
            <td class="auto-style7">    <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                <ContentTemplate>
                    <asp:Button ID="bntdelete0" runat="server" BackColor="#3399FF" Font-Bold="True" ForeColor="White" Text="Print Production Order" Width="192px" PostBackUrl="~/FrmPrintProduction.aspx" />
                </ContentTemplate>
            </asp:UpdatePanel></td>
            <td class="auto-style7"></td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td colspan="4">
              <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                <ContentTemplate>
                    <dx:ASPxGridView ID="gvStdTime" runat="server" AutoGenerateColumns="False" EnableTheming="True" Theme="Office2010Black" Width="100%" DataSourceID="SqlDataSource1" OnHtmlDataCellPrepared="gvStdTime_HtmlDataCellPrepared" >
                         
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="No" FieldName="Row" ReadOnly="True" VisibleIndex="0" Width="70px">
                                <HeaderStyle VerticalAlign="Middle" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Itemcode" VisibleIndex="1" Width="100px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ItemName" VisibleIndex="2" Width="180px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="OrderDate" VisibleIndex="3" Width="100px">
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataDateColumn FieldName="ReceivedDate" VisibleIndex="4" Width="100px">
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="OrderQty" VisibleIndex="5" Width="100px">
                                <HeaderStyle HorizontalAlign="Right" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Remark" VisibleIndex="6" Width="150px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="7" Width="100px">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="ProductionID" FieldName="ProductionID" Visible="False" VisibleIndex="8">
                            </dx:GridViewDataTextColumn>
                                <dx:GridViewDataHyperLinkColumn Caption="Delete" FieldName="ProductionID" VisibleIndex="11" Width="20px">
                        <PropertiesHyperLinkEdit ImageHeight="15px" ImageUrl="~/Images/pin.png" ImageWidth="15px" NavigateUrlFormatString="~/PageOrder.aspx?ProductionID={0}&amp;mode=Delete">
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
                        <settingsdatasecurity allowinsert="False" AllowDelete="False" AllowEdit="False" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBBarcode %>" SelectCommand="select ROW_NUMBER() OVER(ORDER BY Status Desc) AS Row,Itemcode, ItemName, OrderDate, ReceivedDate, OrderQty, Remark, Status,ProductionID
from [dbo].[ProductionOrder]   where ItemName<>'กรุณาเลือก'
Order by Status Desc,ProductionID Desc"></asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

