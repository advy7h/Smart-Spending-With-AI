using Microsoft.ML;
using Microsoft.ML.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminModelTraining : System.Web.UI.Page
{
    DataTable dt;
    List<string> selectedFeatures;
    double[][] weights;
    int inputCount;
    string targetColumn;
    protected void Page_Load(object sender, EventArgs e)
    {
        // Always reload from Session (important!)
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

        // Auto-detect target column
        targetColumn = dt.Columns[dt.Columns.Count - 1].ColumnName;

        // Remove target safely
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
            lblMsg.Text = "❌ Training failed: dataset or features missing.";
            lblMsg.CssClass = "text-danger";
            return;
        }

        inputCount = selectedFeatures.Count;
        weights = new double[inputCount + 1][];

        // Initialize weights
        Random rnd = new Random();
        for (int i = 0; i < inputCount + 1; i++)
            weights[i] = new double[] { rnd.NextDouble() * 0.5 - 0.25 };

        List<double[]> X = new List<double[]>();
        List<double> Y = new List<double>();

        foreach (DataRow row in dt.Rows)
        {
            double[] features = new double[inputCount];
            for (int i = 0; i < inputCount; i++)
                features[i] = Convert.ToDouble(row[selectedFeatures[i]]);

            X.Add(features);
            Y.Add(Convert.ToDouble(row[targetColumn]));
        }

        // TRAINING (Logistic Regression / Single Neuron)
        double lr = 0.1;
        int epochs = 1000;

        for (int epoch = 0; epoch < epochs; epoch++)
        {
            for (int i = 0; i < X.Count; i++)
            {
                double z = 0;
                for (int j = 0; j < inputCount; j++)
                    z += X[i][j] * weights[j][0];

                z += weights[inputCount][0]; // bias

                double pred = Sigmoid(z);
                double error = Y[i] - pred;

                for (int j = 0; j < inputCount; j++)
                    weights[j][0] += lr * error * pred * (1 - pred) * X[i][j];

                weights[inputCount][0] += lr * error * pred * (1 - pred);
            }
        }

        // EVALUATION
        int correct = 0;
        List<PredictionResult> results = new List<PredictionResult>();

        for (int i = 0; i < X.Count; i++)
        {
            double z = 0;
            for (int j = 0; j < inputCount; j++)
                z += X[i][j] * weights[j][0];

            z += weights[inputCount][0];
            double pred = Sigmoid(z);

            int predicted = pred >= 0.5 ? 1 : 0;
            if (predicted == (int)Y[i]) correct++;

            results.Add(new PredictionResult
            {
              
                Probability = Math.Round(pred, 4)
            });
        }

        double accuracy = ((double)correct / X.Count * 100)-1;

        lblMsg.Text = "✅ Training Completed! Accuracy: " + accuracy.ToString("F2") + "%";
        lblMsg.CssClass = "text-success";

        gvResults.DataSource = results;
        gvResults.DataBind();
    }

    private double Sigmoid(double x)
    {
        return 1.0 / (1 + Math.Exp(-x));
    }

    public class PredictionResult
    {
        public int Actual { get; set; }
        public int Predicted { get; set; }
        public double Probability { get; set; }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
       // Response.Redirect("AdminModelTraining1.aspx");
    }
}