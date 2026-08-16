using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminTrainTestSplit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["SelectedFeatures"] == null)
            {
                lblMsg.Text = "❌ Feature-selected dataset not found.";
                lblMsg.CssClass = "text-danger";
            }
        }
    }

    protected void btnSplit_Click(object sender, EventArgs e)
    {
        DataTable dt = (DataTable)Session["SelectedFeatures"];
        if (dt == null || dt.Rows.Count == 0)
        {
            lblMsg.Text = "❌ No data available for splitting.";
            lblMsg.CssClass = "text-danger";
            return;
        }

        int trainPercent = int.Parse(ddlRatio.SelectedValue);
        int trainCount = (dt.Rows.Count * trainPercent) / 100;

        DataTable trainDT = dt.Clone();
        DataTable testDT = dt.Clone();

        // Shuffle rows randomly
        Random rnd = new Random();
        var shuffled = dt.AsEnumerable()
                         .OrderBy(r => rnd.Next())
                         .ToList();

        for (int i = 0; i < shuffled.Count; i++)
        {
            if (i < trainCount)
                trainDT.ImportRow(shuffled[i]);
            else
                testDT.ImportRow(shuffled[i]);
        }

        Session["TrainData"] = trainDT;
        Session["TestData"] = testDT;

        gvTrain.DataSource = trainDT;
        gvTrain.DataBind();

        gvTest.DataSource = testDT;
        gvTest.DataBind();

        lblMsg.Text = "✅ Dataset split completed: {trainDT.Rows.Count} train / {testDT.Rows.Count} test";
        lblMsg.CssClass = "text-success";
    
}

    protected void btnNext_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminModelTraining.aspx");
    }
}