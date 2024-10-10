using Mukicik.Models;
using System.Collections.Generic;

namespace Mukicik.Repositories.UserRepository
{
    internal interface IUserRepository
    {
        void DeleteUser(int userId);
        void DeleteUser(User user);
        IEnumerable<User> GetAllUsers();
        User GetUserById(int userId);
        User GetUserByEmailAndPassword(string email, string password);
        int GetNextValidId();
        void InsertUser(User user);
        void SaveChanges();
        void UpdateUser(User user);
    }
}
