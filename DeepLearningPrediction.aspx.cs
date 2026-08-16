using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DeepLearningPrediction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnPredictDL_Click(object sender, EventArgs e)
    {
        double m1 = Convert.ToDouble(txtM1.Text);
        double m2 = Convert.ToDouble(txtM2.Text);
        double m3 = Convert.ToDouble(txtM3.Text);
        double m4 = Convert.ToDouble(txtM4.Text);

        // -----------------------------
        // INPUT LAYER
        // -----------------------------
        double[] inputs = { m1, m2, m3, m4 };

        // -----------------------------
        // HIDDEN LAYER (2 neurons)
        // -----------------------------
        double[,] weights1 = {
            {0.2, 0.1, 0.3, 0.4},
            {0.5, 0.2, 0.1, 0.3}
        };

        double[] bias1 = { 10, 20 };
        double[] hidden = new double[2];

        for (int i = 0; i < 2; i++)
        {
            hidden[i] = 0;

            for (int j = 0; j < 4; j++)
            {
                hidden[i] += inputs[j] * weights1[i, j];
            }

            hidden[i] += bias1[i];

            // ReLU Activation
            hidden[i] = Math.Max(0, hidden[i]);
        }

        // -----------------------------
        // OUTPUT LAYER
        // -----------------------------
        double[] weights2 = { 0.6, 0.4 };
        double bias2 = 50;

        double output = 0;

        for (int i = 0; i < 2; i++)
        {
            output += hidden[i] * weights2[i];
        }

        output += bias2;

        // RESULT
        lblDLPred.Text = output.ToString("0.00");

        // -----------------------------
        // EXPLANATION (FOR VIVA)
        // -----------------------------
        lblExplain.Text =
            "✔ Input Layer: 4 months data<br/>" +
            "✔ Hidden Layer: 2 neurons with weights<br/>" +
            "✔ Activation: ReLU function<br/>" +
            "✔ Output Layer: Final prediction<br/>" +
            "✔ This simulates a Feedforward Neural Network";
    }
}
