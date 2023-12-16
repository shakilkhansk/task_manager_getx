class Urls {
  static const String _baseUrl = 'https://task.teamrabbil.com/api/v1';
  static const String registration = '$_baseUrl/registration';
  static const String login = '$_baseUrl/login';
  static const String createNewTask = '$_baseUrl/createTask';
  static const String getTaskStatusCount = '$_baseUrl/taskStatusCount';
  static String getNewTasks = '$_baseUrl/listTaskByStatus/New';
  static String getProgressTasks = '$_baseUrl/listTaskByStatus/Progress';
  static String getCompletedTasks = '$_baseUrl/listTaskByStatus/Completed';
  static String getCancelledTasks = '$_baseUrl/listTaskByStatus/Cancelled';
  // static String getProgressTasks = '$_baseUrl/listTaskByStatus/${TaskStatus.Progress.name}';

  static String verifyEmail(String email) => '$_baseUrl/RecoverVerifyEmail/$email';
  static String verifyOtp(String email, String otp) => '$_baseUrl/RecoverVerifyOTP/$email/$otp';
  static String passwordReset = '$_baseUrl/RecoverResetPass';

  static String updateTaskStatus(String taskId, String status) =>
      '$_baseUrl/updateTaskStatus/$taskId/$status';

  static const String updateProfile = '$_baseUrl/profileUpdate';
}