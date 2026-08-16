using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminFeatureSelection : System.Web.UI.Page
{
    DataTable dt;
    Dictionary<string, string> columnTypes;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UploadedDataset"] == null || Session["ColumnTypes"] == null)
            {
                lblMsg.Text = "❌ Dataset not found. Please upload and preprocess the dataset first.";
                lblMsg.CssClass = "text-danger";
                return;
            }

            dt = (DataTable)Session["UploadedDataset"];
            columnTypes = (Dictionary<string, string>)Session["ColumnTypes"];

            // Populate CheckBoxList with all columns
            cblFeatures.Items.Clear();
            foreach (DataColumn col in dt.Columns)
            {
                ListItem item = new ListItem(col.ColumnName, col.ColumnName);
                item.Selected = true; // default: all features selected
                cblFeatures.Items.Add(item);
            }
        }
    }

    protected void btnSelectFeatures_Click(object sender, EventArgs e)
    {
        List<string> selectedFeatures = new List<string>();

        foreach (ListItem item in cblFeatures.Items)
        {
            if (item.Selected)
                selectedFeatures.Add(item.Value);
        }

        if (selectedFeatures.Count == 0)
        {
            lblMsg.Text = "⚠ Please select at least one feature.";
            lblMsg.CssClass = "text-danger";
            return;
        }

        // Save selected features in session for modeling/training
        Session["SelectedFeatures"] = selectedFeatures;

        lblMsg.Text = "✅ Features selected successfully!";
        lblMsg.CssClass = "text-success";

        // Optionally, redirect to next page for model building
        //Response.Redirect("AdminModelTraining.aspx");
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminModelTraining.aspx");
    }
}