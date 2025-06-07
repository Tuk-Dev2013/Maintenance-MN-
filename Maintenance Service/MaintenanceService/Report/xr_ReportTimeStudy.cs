using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace MaintenanceService.Pages
{
    public partial class xr_ReportTimeStudy : DevExpress.XtraReports.UI.XtraReport
    {
        private DetailBand detailBand1;
        private DataAccess.ProjectDataSet projectDataSet1;
        private SubBand SubBand1;
        private XRPanel xrPanel1;
        private XRLabel xrLabel3;
        private XRLabel xrLabel2;
        private XRControlStyle Title;
        private XRControlStyle FieldCaption;
        private XRControlStyle PageInfo;
        private XRControlStyle DataField;
        private DevExpress.DataAccess.Sql.SqlDataSource sqlDataSource1;
        private TopMarginBand topMarginBand1;
        private BottomMarginBand bottomMarginBand1;
        private XRBarCode xrBarCode1;
        private XRLabel xrLabel8;
        private XRLabel xrLabel7;
        private XRLabel xrLabel1;
        private XRLabel xrLabel4;
        private DataAccess.ProjectDataSetTableAdapters.DataTable1TableAdapter dataTable1TableAdapter;
    
        public xr_ReportTimeStudy()
        {
            InitializeComponent();
        }

        private void InitializeComponent()
        {
            DevExpress.XtraPrinting.BarCode.Code128Generator code128Generator1 = new DevExpress.XtraPrinting.BarCode.Code128Generator();
            DevExpress.DataAccess.Sql.CustomSqlQuery customSqlQuery1 = new DevExpress.DataAccess.Sql.CustomSqlQuery();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(xr_ReportTimeStudy));
            this.detailBand1 = new DevExpress.XtraReports.UI.DetailBand();
            this.xrPanel1 = new DevExpress.XtraReports.UI.XRPanel();
            this.xrLabel4 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel8 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel7 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel1 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrBarCode1 = new DevExpress.XtraReports.UI.XRBarCode();
            this.xrLabel3 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel2 = new DevExpress.XtraReports.UI.XRLabel();
            this.SubBand1 = new DevExpress.XtraReports.UI.SubBand();
            this.Title = new DevExpress.XtraReports.UI.XRControlStyle();
            this.FieldCaption = new DevExpress.XtraReports.UI.XRControlStyle();
            this.PageInfo = new DevExpress.XtraReports.UI.XRControlStyle();
            this.DataField = new DevExpress.XtraReports.UI.XRControlStyle();
            this.sqlDataSource1 = new DevExpress.DataAccess.Sql.SqlDataSource();
            this.topMarginBand1 = new DevExpress.XtraReports.UI.TopMarginBand();
            this.bottomMarginBand1 = new DevExpress.XtraReports.UI.BottomMarginBand();
            this.projectDataSet1 = new MaintenanceService.DataAccess.ProjectDataSet();
            this.dataTable1TableAdapter = new MaintenanceService.DataAccess.ProjectDataSetTableAdapters.DataTable1TableAdapter();
            ((System.ComponentModel.ISupportInitialize)(this.projectDataSet1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
            // 
            // detailBand1
            // 
            this.detailBand1.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrPanel1});
            this.detailBand1.HeightF = 163.6667F;
            this.detailBand1.MultiColumn.ColumnSpacing = 10F;
            this.detailBand1.MultiColumn.ColumnWidth = 355F;
            this.detailBand1.MultiColumn.Layout = DevExpress.XtraPrinting.ColumnLayout.AcrossThenDown;
            this.detailBand1.MultiColumn.Mode = DevExpress.XtraReports.UI.MultiColumnMode.UseColumnWidth;
            this.detailBand1.Name = "detailBand1";
            this.detailBand1.StyleName = "DataField";
            // 
            // xrPanel1
            // 
            this.xrPanel1.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top) 
            | DevExpress.XtraPrinting.BorderSide.Right) 
            | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrPanel1.CanGrow = false;
            this.xrPanel1.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel4,
            this.xrLabel8,
            this.xrLabel7,
            this.xrLabel1,
            this.xrBarCode1,
            this.xrLabel3,
            this.xrLabel2});
            this.xrPanel1.LocationFloat = new DevExpress.Utils.PointFloat(0F, 10F);
            this.xrPanel1.Name = "xrPanel1";
            this.xrPanel1.SizeF = new System.Drawing.SizeF(355F, 147F);
            // 
            // xrLabel4
            // 
            this.xrLabel4.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrLabel4.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "CustomSqlQuery.Model")});
            this.xrLabel4.Font = new System.Drawing.Font("Tahoma", 10.2F);
            this.xrLabel4.LocationFloat = new DevExpress.Utils.PointFloat(60.83339F, 95.66663F);
            this.xrLabel4.Name = "xrLabel4";
            this.xrLabel4.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel4.SizeF = new System.Drawing.SizeF(274.1666F, 16.83334F);
            this.xrLabel4.StylePriority.UseBorders = false;
            this.xrLabel4.StylePriority.UseFont = false;
            this.xrLabel4.Text = "xrLabel4";
            // 
            // xrLabel8
            // 
            this.xrLabel8.Font = new System.Drawing.Font("Tahoma", 10F, System.Drawing.FontStyle.Bold);
            this.xrLabel8.ForeColor = System.Drawing.Color.Black;
            this.xrLabel8.LocationFloat = new DevExpress.Utils.PointFloat(10.00001F, 95.66666F);
            this.xrLabel8.Name = "xrLabel8";
            this.xrLabel8.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel8.SizeF = new System.Drawing.SizeF(50.83338F, 16.83331F);
            this.xrLabel8.StyleName = "FieldCaption";
            this.xrLabel8.StylePriority.UseFont = false;
            this.xrLabel8.StylePriority.UseForeColor = false;
            this.xrLabel8.Text = "Model";
            // 
            // xrLabel7
            // 
            this.xrLabel7.Font = new System.Drawing.Font("Tahoma", 10F, System.Drawing.FontStyle.Bold);
            this.xrLabel7.ForeColor = System.Drawing.Color.Black;
            this.xrLabel7.LocationFloat = new DevExpress.Utils.PointFloat(10.00001F, 112.5F);
            this.xrLabel7.Name = "xrLabel7";
            this.xrLabel7.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel7.SizeF = new System.Drawing.SizeF(64.16666F, 16.83333F);
            this.xrLabel7.StyleName = "FieldCaption";
            this.xrLabel7.StylePriority.UseFont = false;
            this.xrLabel7.StylePriority.UseForeColor = false;
            this.xrLabel7.Text = "Location";
            // 
            // xrLabel1
            // 
            this.xrLabel1.Font = new System.Drawing.Font("Tahoma", 10F, System.Drawing.FontStyle.Bold);
            this.xrLabel1.ForeColor = System.Drawing.Color.Black;
            this.xrLabel1.LocationFloat = new DevExpress.Utils.PointFloat(10.00001F, 78.83333F);
            this.xrLabel1.Name = "xrLabel1";
            this.xrLabel1.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel1.SizeF = new System.Drawing.SizeF(45.62506F, 16.83333F);
            this.xrLabel1.StyleName = "FieldCaption";
            this.xrLabel1.StylePriority.UseFont = false;
            this.xrLabel1.StylePriority.UseForeColor = false;
            this.xrLabel1.Text = "Name";
            // 
            // xrBarCode1
            // 
            this.xrBarCode1.Alignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            this.xrBarCode1.Borders = ((DevExpress.XtraPrinting.BorderSide)((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrBarCode1.BorderWidth = 0F;
            this.xrBarCode1.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "CustomSqlQuery.Itemcode")});
            this.xrBarCode1.Font = new System.Drawing.Font("Tahoma", 10F);
            this.xrBarCode1.LocationFloat = new DevExpress.Utils.PointFloat(9.999991F, 10F);
            this.xrBarCode1.Name = "xrBarCode1";
            this.xrBarCode1.Padding = new DevExpress.XtraPrinting.PaddingInfo(10, 10, 10, 10, 100F);
            this.xrBarCode1.SizeF = new System.Drawing.SizeF(335F, 68.69819F);
            this.xrBarCode1.StylePriority.UseBorders = false;
            this.xrBarCode1.StylePriority.UseBorderWidth = false;
            this.xrBarCode1.StylePriority.UseFont = false;
            this.xrBarCode1.StylePriority.UsePadding = false;
            this.xrBarCode1.StylePriority.UseTextAlignment = false;
            this.xrBarCode1.Symbology = code128Generator1;
            this.xrBarCode1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.BottomCenter;
            // 
            // xrLabel3
            // 
            this.xrLabel3.BorderWidth = 0F;
            this.xrLabel3.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "CustomSqlQuery.Location")});
            this.xrLabel3.Font = new System.Drawing.Font("Tahoma", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.xrLabel3.LocationFloat = new DevExpress.Utils.PointFloat(74.16668F, 112.5F);
            this.xrLabel3.Name = "xrLabel3";
            this.xrLabel3.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel3.SizeF = new System.Drawing.SizeF(260.8333F, 16.83333F);
            this.xrLabel3.StylePriority.UseBorderWidth = false;
            this.xrLabel3.StylePriority.UseFont = false;
            this.xrLabel3.Text = "xrLabel3";
            // 
            // xrLabel2
            // 
            this.xrLabel2.BorderWidth = 0F;
            this.xrLabel2.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "CustomSqlQuery.ItemName")});
            this.xrLabel2.Font = new System.Drawing.Font("Tahoma", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.xrLabel2.LocationFloat = new DevExpress.Utils.PointFloat(55.62506F, 78.69819F);
            this.xrLabel2.Name = "xrLabel2";
            this.xrLabel2.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel2.SizeF = new System.Drawing.SizeF(289.375F, 16.96847F);
            this.xrLabel2.StylePriority.UseBorderWidth = false;
            this.xrLabel2.StylePriority.UseFont = false;
            this.xrLabel2.Text = "xrLabel2";
            // 
            // SubBand1
            // 
            this.SubBand1.HeightF = 100F;
            this.SubBand1.Name = "SubBand1";
            // 
            // Title
            // 
            this.Title.BackColor = System.Drawing.Color.Transparent;
            this.Title.BorderColor = System.Drawing.Color.Black;
            this.Title.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.Title.BorderWidth = 1F;
            this.Title.Font = new System.Drawing.Font("Times New Roman", 20F, System.Drawing.FontStyle.Bold);
            this.Title.ForeColor = System.Drawing.Color.Maroon;
            this.Title.Name = "Title";
            // 
            // FieldCaption
            // 
            this.FieldCaption.BackColor = System.Drawing.Color.Transparent;
            this.FieldCaption.BorderColor = System.Drawing.Color.Black;
            this.FieldCaption.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.FieldCaption.BorderWidth = 1F;
            this.FieldCaption.Font = new System.Drawing.Font("Arial", 10F, System.Drawing.FontStyle.Bold);
            this.FieldCaption.ForeColor = System.Drawing.Color.Maroon;
            this.FieldCaption.Name = "FieldCaption";
            // 
            // PageInfo
            // 
            this.PageInfo.BackColor = System.Drawing.Color.Transparent;
            this.PageInfo.BorderColor = System.Drawing.Color.Black;
            this.PageInfo.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.PageInfo.BorderWidth = 1F;
            this.PageInfo.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
            this.PageInfo.ForeColor = System.Drawing.Color.Black;
            this.PageInfo.Name = "PageInfo";
            // 
            // DataField
            // 
            this.DataField.BackColor = System.Drawing.Color.Transparent;
            this.DataField.BorderColor = System.Drawing.Color.Black;
            this.DataField.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.DataField.BorderWidth = 1F;
            this.DataField.Font = new System.Drawing.Font("Times New Roman", 10F);
            this.DataField.ForeColor = System.Drawing.Color.Black;
            this.DataField.Name = "DataField";
            this.DataField.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            // 
            // sqlDataSource1
            // 
            this.sqlDataSource1.ConnectionName = "DBBarcode";
            this.sqlDataSource1.Name = "sqlDataSource1";
            customSqlQuery1.Name = "CustomSqlQuery";
            customSqlQuery1.Sql = "SELECT ROW_NUMBER() OVER(ORDER BY Createdate Desc) AS Row,Itemcode, ItemName, Mod" +
    "el, Location, MaxItem, MinItem, QtyIn, QtyOut, QtyBal, Createdate\r\nFROM   [dbo]." +
    "[tb_StockBal] Order by Createdate Desc";
            this.sqlDataSource1.Queries.AddRange(new DevExpress.DataAccess.Sql.SqlQuery[] {
            customSqlQuery1});
            this.sqlDataSource1.ResultSchemaSerializable = resources.GetString("sqlDataSource1.ResultSchemaSerializable");
            // 
            // topMarginBand1
            // 
            this.topMarginBand1.HeightF = 9.000003F;
            this.topMarginBand1.Name = "topMarginBand1";
            // 
            // bottomMarginBand1
            // 
            this.bottomMarginBand1.HeightF = 0F;
            this.bottomMarginBand1.Name = "bottomMarginBand1";
            // 
            // projectDataSet1
            // 
            this.projectDataSet1.DataSetName = "ProjectDataSet";
            this.projectDataSet1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // dataTable1TableAdapter
            // 
            this.dataTable1TableAdapter.ClearBeforeFill = true;
            // 
            // xr_ReportTimeStudy
            // 
            this.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
            this.detailBand1,
            this.topMarginBand1,
            this.bottomMarginBand1});
            this.ComponentStorage.Add(this.sqlDataSource1);
            this.DataMember = "CustomSqlQuery";
            this.DataSource = this.sqlDataSource1;
            this.Margins = new System.Drawing.Printing.Margins(65, 0, 9, 0);
            this.PageHeight = 1169;
            this.PageWidth = 827;
            this.PaperKind = System.Drawing.Printing.PaperKind.A4;
            this.ReportPrintOptions.DetailCountOnEmptyDataSource = 12;
            this.StyleSheet.AddRange(new DevExpress.XtraReports.UI.XRControlStyle[] {
            this.Title,
            this.FieldCaption,
            this.PageInfo,
            this.DataField});
            this.Version = "14.2";
            ((System.ComponentModel.ISupportInitialize)(this.projectDataSet1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

        }

    }
}
