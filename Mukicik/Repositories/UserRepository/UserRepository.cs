using Mukicik.Models;
using System.Collections.Generic;
using System.Linq;

namespace Mukicik.Repositories.UserRepository
{
    public class UserRepository : IUserRepository
    {
        private readonly DatabaseEntities _databaseEntities = DatabaseSingleton.GetInstance();
        public void DeleteUser(int userId)
        {
            _databaseEntities.Users.Remove(GetUserById(userId));
        }

        public void DeleteUser(User user)
        {
            _databaseEntities.Users.Remove(user);
        }

        public IEnumerable<User> GetAllUsers()
        {
            return _databaseEntities.Users.ToList();
        }

        public User GetUserById(int userId)
        {
            return (from x in _databaseEntities.Users where x.UserId == userId select x).FirstOrDefault();
        }

        public User GetUserByEmailAndPassword(string email, string password)
        {
            return _databaseEntities.Users.FirstOrDefault(u => u.UserEmail == email && u.UserPassword == password);
        }
        public int GetNextValidId()
        {
            if (_databaseEntities.Users.Count() == 0)
            {
                return 1;
            }
            else
            {
                return _databaseEntities.Users.Max(u => u.UserId) + 1;
            }
        }

        public void InsertUser(User user)
        {
            _databaseEntities.Users.Add(user);
        }

        public void SaveChanges()
        {
            _databaseEntities.SaveChanges();
        }

        public void UpdateUser(User user)
        {
            User oldUser = GetUserById(user.UserId);
            _databaseEntities.Entry(oldUser).CurrentValues.SetValues(user);
        }
    }
}