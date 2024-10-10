using Mukicik.Models;

namespace Mukicik.Repositories
{
    public class DatabaseSingleton
    {
        private static DatabaseEntities _db;

        public static DatabaseEntities GetInstance()
        {
            if (_db == null)
            {
                _db = new DatabaseEntities();
            }
            return _db;
        }

    }
}