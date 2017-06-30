using DataBaseConnection.Data;

namespace DataBaseConnection.Business
{
    public class Checker
    {
        public bool Check()
        {
            return new ADOConnection().CheckDataConnection();
        }
    }
}
