using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace xmlAuth
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "Iauth" in both code and config file together.
    [ServiceContract]
    public interface Iauth
    {
        [OperationContract]
        string DoWork();

        [OperationContract]
        string Registeration(string userName, string email, string password);

        [OperationContract]
        string RegisterationStaff(string userName, string email, string password);

        [OperationContract]
        string Login(string userName, string password);
    }
}
