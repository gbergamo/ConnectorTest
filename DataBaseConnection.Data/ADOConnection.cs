using System;
using System.Configuration;
using System.Data.SqlClient;

namespace DataBaseConnection.Data
{
    public class ADOConnection
    {
        readonly string connetionString = System.Configuration.ConfigurationManager.ConnectionStrings["mainConnection"].ConnectionString;

        public bool CheckDataConnection()
        {
            SqlConnection cnn;
            cnn = new SqlConnection(connetionString);

            try
            {
                cnn.Open();
                cnn.Close();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }

        }
    }
}
