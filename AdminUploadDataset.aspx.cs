using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminUploadDataset : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (!FileUpload1.HasFile)
        {
            lblMsg.Text = "⚠ Please select a CSV file";
            lblMsg.CssClass = "text-danger";
            return;
        }

        string ext = Path.GetExtension(FileUpload1.FileName).ToLower();
        if (ext != ".csv")
        {
            lblMsg.Text = "⚠ Only CSV files are allowed";
            lblMsg.CssClass = "text-danger";
            return;
        }

        DataTable dt = new DataTable();

        try
        {
            using (StreamReader sr = new StreamReader(FileUpload1.PostedFile.InputStream))
            {
                bool firstRow = true;

                while (!sr.EndOfStream)
                {
                    string line = sr.ReadLine();
                    if (string.IsNullOrWhiteSpace(line)) continue;

                    string[] values = line.Split(',');

                    if (firstRow)
                    {
                        foreach (string col in values)
                            dt.Columns.Add(col.Trim(), typeof(string)); // keep all as string

                        firstRow = false;
                    }
                    else
                    {
                        DataRow dr = dt.NewRow();
                        for (int i = 0; i < values.Length; i++)
                            dr[i] = values[i].Trim();

                        dt.Rows.Add(dr);
                    }
                }
            }

            // Optional: store numeric/categorical info in a dictionary for preprocessing
            var columnTypes = dt.Columns.Cast<DataColumn>()
                .ToDictionary(
                    c => c.ColumnName,
                    c =>
                    {
                        bool isNumeric = dt.AsEnumerable()
                            .All(r =>
                            {
                                string cell = r[c].ToString();
                                if (string.IsNullOrWhiteSpace(cell)) return true;
                                double temp;
                                return double.TryParse(cell, out temp);
                            });
                        return isNumeric ? "Numeric" : "Categorical";
                    });

            Session["UploadedDataset"] = dt;
            Session["ColumnTypes"] = columnTypes; // save for preprocessing page

            gvDataset.DataSource = dt;
            gvDataset.DataBind();

            lblMsg.Text = "✅ Dataset uploaded and displayed successfully";
            lblMsg.CssClass = "text-success";

           // Response.Redirect("AdminDataPreprocessing.aspx");
        }
        catch (Exception ex)
        {
            lblMsg.Text = "❌ Error reading dataset: " + ex.Message;
            lblMsg.CssClass = "text-danger";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminDataPreprocessing.aspx");
    }
}
