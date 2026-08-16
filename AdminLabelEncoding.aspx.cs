using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminLabelEncoding : System.Web.UI.Page
{
    DataTable dt;
    Dictionary<string, string> columnTypes;
    Dictionary<string, Dictionary<string, int>> labelMaps;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UploadedDataset"] == null)
            {
                lblMsg.Text = "❌ Dataset not found. Please upload dataset first.";
                lblMsg.CssClass = "text-danger";
                return;
            }

            dt = (DataTable)Session["UploadedDataset"];
            columnTypes = (Dictionary<string, string>)Session["ColumnTypes"];
            labelMaps = new Dictionary<string, Dictionary<string, int>>();

            gvEncoded.DataSource = dt;
            gvEncoded.DataBind();
        }
    }

    protected void btnEncode_Click(object sender, EventArgs e)
    {
        dt = (DataTable)Session["UploadedDataset"];
        columnTypes = (Dictionary<string, string>)Session["ColumnTypes"];
        labelMaps = new Dictionary<string, Dictionary<string, int>>();

        foreach (DataColumn col in dt.Columns)
        {
            if (!columnTypes.ContainsKey(col.ColumnName)) continue;
            if (columnTypes[col.ColumnName] != "Categorical") continue;

            Dictionary<string, int> labelMap = new Dictionary<string, int>();
            int label = 0;

            foreach (DataRow row in dt.Rows)
            {
                string value = row[col].ToString();

                if (!labelMap.ContainsKey(value))
                {
                    labelMap[value] = label;
                    label++;
                }

                row[col] = labelMap[value].ToString(); // store as string
            }

            labelMaps[col.ColumnName] = labelMap;
        }

        Session["UploadedDataset"] = dt;
        Session["LabelMaps"] = labelMaps; // optional: save for modeling
        gvEncoded.DataSource = dt;
        gvEncoded.DataBind();

        lblMsg.Text = "✅ Label encoding applied successfully";
        lblMsg.CssClass = "text-success";
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminFeatureSelection.aspx");
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        
    }
}