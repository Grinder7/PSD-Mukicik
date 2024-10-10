using Mukicik.Models;
using Mukicik.Repositories.UserRepository;
using System;

namespace Mukicik.Factories
{
    public class UserFactory
    {
        private static readonly IUserRepository _userRepository = new UserRepository();
        public static User Create(string username, string userEmail, string userPassword, string userGender, DateTime userDOB, string userProfilePicture)
        {
            return new User()
            {
                UserId = _userRepository.GetNextValidId(),
                Username = username,
                UserEmail = userEmail,
                UserPassword = userPassword,
                UserGender = userGender,
                UserDOB = userDOB,
                UserProfilePicture = userProfilePicture
            };
        }
        public static User Create(int userId, string username, string userEmail, string userPassword, string userGender, DateTime userDOB, string userProfilePicture)
        {
            return new User()
            {
                UserId = userId,
                Username = username,
                UserEmail = userEmail,
                UserPassword = userPassword,
                UserGender = userGender,
                UserDOB = userDOB,
                UserProfilePicture = userProfilePicture
            };
        }
    }
}