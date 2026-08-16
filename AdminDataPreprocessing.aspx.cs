using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminDataPreprocessing_aspx : System.Web.UI.Page
{
    DataTable dt;
    Dictionary<string, string> columnTypes;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UploadedDataset"] == null)
            {
                lblMsg.Text = "❌ No dataset found. Please upload a dataset first.";
                lblMsg.CssClass = "text-danger";
                return;
            }

            dt = (DataTable)Session["UploadedDataset"];
            columnTypes = (Dictionary<string, string>)Session["ColumnTypes"];

            gvData.DataSource = dt;
            gvData.DataBind();
        }
    }

    protected void btnClean_Click(object sender, EventArgs e)
    {
        dt = (DataTable)Session["UploadedDataset"];

        for (int i = dt.Rows.Count - 1; i >= 0; i--)
        {
            if (dt.Rows[i].ItemArray.All(x => string.IsNullOrWhiteSpace(x.ToString())))
                dt.Rows.RemoveAt(i);
        }

        Session["UploadedDataset"] = dt;
        gvData.DataSource = dt;
        gvData.DataBind();

        lblMsg.Text = "✅ Empty rows removed successfully";
        lblMsg.CssClass = "text-success";
    }

    protected void btnNormalize_Click(object sender, EventArgs e)
    {
        dt = (DataTable)Session["UploadedDataset"];
        columnTypes = (Dictionary<string, string>)Session["ColumnTypes"];

        foreach (DataColumn col in dt.Columns)
        {
            if (!columnTypes.ContainsKey(col.ColumnName)) continue;
            if (columnTypes[col.ColumnName] != "Numeric") continue;

            // Get numeric values safely
            List<double> values = new List<double>();
            foreach (DataRow row in dt.Rows)
            {
                double temp;
                if (double.TryParse(row[col].ToString(), out temp))
                    values.Add(temp);
            }

            if (values.Count == 0) continue;

            double min = values.Min();
            double max = values.Max();

            if (min == max) continue;

            // Normalize
            foreach (DataRow row in dt.Rows)
            {
                double temp;
                if (double.TryParse(row[col].ToString(), out temp))
                    row[col] = Math.Round((temp - min) / (max - min), 4).ToString();
            }
        }

        Session["UploadedDataset"] = dt;
        gvData.DataSource = dt;
        gvData.DataBind();

        lblMsg.Text = "✅ Data normalization completed";
        lblMsg.CssClass = "text-success";
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminLabelEncoding.aspx");
    }
}