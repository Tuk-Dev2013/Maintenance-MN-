<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="PageBarcodeIN.aspx.cs" Inherits="StdTimeEditor.PageBarcodeIN" %>
<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4
        {
            width: 119px;
            text-align: right;
        }
        .auto-style6
        {
            width: 119px;
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
            </td>
            <td>&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="Label3" runat="server" Text="Barcode In:" Font-Size="Large"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td colspan="4">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtbarcode" runat="server" onkeypress="return EnterEvent(event)" BackColor="#FFFFCC" Height="23px" Width="262px"></asp:TextBox>
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
            <td class="auto-style6"></td>
            <td class="auto-style7">
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnSave" runat="server" Text="SAVE" Width="115px" Enabled="False" OnClick="btnSave_Click" />
                        <asp:Button ID="bntcancel" runat="server" Text="CANCEL" Width="115px" OnClick="bntcancel_Click" />
                        <asp:Button ID="bntdelete" runat="server" BackColor="#FFCCCC" Text="DELETE" Width="115px" OnClick="bntdelete_Click" OnClientClick="return ConfirmDelete();" />
                        <asp:Label ID="lbldelete" runat="server" Font-Size="Medium" Text="&lt;&lt;--ยืนยันการลบ" ForeColor="#FF3300"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="auto-style7"></td>
            <td class="auto-style8"></td>
            <td class="auto-style7"></td>
            <td class="auto-style7"></td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td colspan="4">
              <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                <ContentTemplate>
                    <dx:ASPxGridView ID="gvStdTime" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource2" EnableTheming="True" KeyFieldName="MovID" Theme="Default" Width="100%" >
                         
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="MovID" VisibleIndex="1" ReadOnly="True" Visible="False">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="ItemCode" FieldName="ItemCode" VisibleIndex="2" Width="150px">
                                <HeaderStyle Font-Bold="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="ItemName" FieldName="ItemName" VisibleIndex="3">
                                <HeaderStyle Font-Bold="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Location" FieldName="Location" VisibleIndex="4">
                                <HeaderStyle Font-Bold="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="QtyIn" VisibleIndex="5">
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Right" />
                                <CellStyle HorizontalAlign="Right">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="No" FieldName="Row" VisibleIndex="0" Width="50px">
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Create Date" FieldName="CreateDate" VisibleIndex="6">
                                <HeaderStyle Font-Bold="True" />
                            </dx:GridViewDataTextColumn>
                              <dx:GridViewDataHyperLinkColumn Caption="Delete" FieldName="MovID" VisibleIndex="11" Width="20px">
                        <PropertiesHyperLinkEdit ImageHeight="15px" ImageUrl="~/Images/pin.png" ImageWidth="15px" NavigateUrlFormatString="~/PageBarcodeIN.aspx?MovID={0}&amp;mode=Delete">
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
                            <DetailRow BackColor="#CCFFFF">
                            </DetailRow>
                            <DetailCell BackColor="#FF9999">
                            </DetailCell>
                            <PreviewRow BackColor="#EBEBEB">
                            </PreviewRow>
                            <AlternatingRow BackColor="Silver">
                            </AlternatingRow>
                            <selectedrow backcolor="#E4EFFA">
                            </selectedrow>
                            <Cell BackColor="White">
                            </Cell>
                        </Styles>
                    </dx:ASPxGridView>
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataMov" TypeName="StdTimeEditor.DataAccess.ProjectDataSetTableAdapters.tb_StockMovTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_MovID" Type="Decimal" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ItemCode" Type="String" />
                            <asp:Parameter Name="ItemName" Type="String" />
                            <asp:Parameter Name="Location" Type="String" />
                            <asp:Parameter Name="QtyIn" Type="Decimal" />
                            <asp:Parameter Name="CreateDate" Type="DateTime" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ItemCode" Type="String" />
                            <asp:Parameter Name="ItemName" Type="String" />
                            <asp:Parameter Name="Location" Type="String" />
                            <asp:Parameter Name="QtyIn" Type="Decimal" />
                            <asp:Parameter Name="CreateDate" Type="DateTime" />
                            <asp:Parameter Name="Original_MovID" Type="Decimal" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
