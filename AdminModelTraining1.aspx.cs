using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminModelTraining1 : System.Web.UI.Page
{
    DataTable dt;
    List<string> selectedFeatures;
    string targetColumn;
    protected void Page_Load(object sender, EventArgs e)
    {
        dt = Session["UploadedDataset"] as DataTable;
        selectedFeatures = Session["SelectedFeatures"] as List<string>;

        if (dt == null || dt.Rows.Count == 0)
        {
            Response.Redirect("AdminUploadDataset.aspx");
            return;
        }

        if (selectedFeatures == null || selectedFeatures.Count == 0)
        {
            Response.Redirect("AdminFeatureSelection.aspx");
            return;
        }

        // Auto-detect target column (last column)
        targetColumn = dt.Columns[dt.Columns.Count - 1].ColumnName;

        if (selectedFeatures.Contains(targetColumn))
            selectedFeatures.Remove(targetColumn);

        if (!IsPostBack)
        {
            lblMsg.Text = "ℹ Using '{targetColumn}' as Target column automatically";
            lblMsg.CssClass = "text-info";
        }
    }

    protected void btnTrain_Click(object sender, EventArgs e)
    {
        if (dt == null || selectedFeatures == null || selectedFeatures.Count == 0)
        {
            lblMsg.Text = "❌ Dataset or features missing";
            lblMsg.CssClass = "text-danger";
            return;
        }

        // Split dataset by class
        var class0 = dt.AsEnumerable()
                       .Where(r => Convert.ToInt32(r[targetColumn]) == 0)
                       .ToList();

        var class1 = dt.AsEnumerable()
                       .Where(r => Convert.ToInt32(r[targetColumn]) == 1)
                       .ToList();

        if (class0.Count == 0 || class1.Count == 0)
        {
            lblMsg.Text = "❌ Dataset must contain both class 0 and class 1";
            lblMsg.CssClass = "text-danger";
            return;
        }

        double prior0 = (double)class0.Count / dt.Rows.Count;
        double prior1 = (double)class1.Count / dt.Rows.Count;

        // Store statistics
        Dictionary<string, FeatureStats> stats = new Dictionary<string, FeatureStats>();

        foreach (string col in selectedFeatures)
        {
            var v0 = class0.Select(r => Convert.ToDouble(r[col])).ToList();
            var v1 = class1.Select(r => Convert.ToDouble(r[col])).ToList();

            stats[col] = new FeatureStats
            {
                Mean0 = v0.Average(),
                Var0 = Variance(v0),
                Mean1 = v1.Average(),
                Var1 = Variance(v1)
            };
        }

        // Prediction
        List<PredictionResult> results = new List<PredictionResult>();
        int correct = 0;

        foreach (DataRow row in dt.Rows)
        {
            double logP0 = Math.Log(prior0);
            double logP1 = Math.Log(prior1);

            foreach (string col in selectedFeatures)
            {
                double x = Convert.ToDouble(row[col]);
                var s = stats[col];

                logP0 += GaussianLog(x, s.Mean0, s.Var0);
                logP1 += GaussianLog(x, s.Mean1, s.Var1);
            }

            double probability = 1.0 / (1.0 + Math.Exp(logP0 - logP1));
            int predicted = probability >= 0.5 ? 1 : 0;

            if (predicted == Convert.ToInt32(row[targetColumn]))
                correct++;

            results.Add(new PredictionResult
            {
                Probability = Math.Round(probability, 4)
            });
        }

        double accuracy = (double)correct / dt.Rows.Count * 100;

        lblMsg.Text = "Training Completed! Accuracy: " + accuracy.ToString("F2") + "%";
        lblMsg.CssClass = "text-success";

        gvResults.DataSource = results;
        gvResults.DataBind();
    }
    double Variance(List<double> values)
    {
        double mean = values.Average();
        double sum = 0;
        foreach (double v in values)
            sum += Math.Pow(v - mean, 2);
        return sum / values.Count + 1e-6; // avoid zero variance
    }

    double GaussianLog(double x, double mean, double variance)
    {
        return -0.5 * Math.Log(2 * Math.PI * variance)
               - Math.Pow(x - mean, 2) / (2 * variance);
    }
    class FeatureStats
    {
        public double Mean0;
        public double Var0;
        public double Mean1;
        public double Var1;
    }

    public class PredictionResult
    {
        public double Probability { get; set; }
    }
}