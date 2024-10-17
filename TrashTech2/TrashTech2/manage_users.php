<?php
// manage_users.php
include 'db_connection.php';
session_start();

if (!isset($_SESSION['username']) || $_SESSION['role'] != 'admin') {
    header("Location: login.php");
    exit();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $email = $_POST['email'];
    $company_name = $_POST['company_name'];  // Changed
    $company_address = $_POST['company_address'];  // Changed
    $role = $_POST['role'];

    if (isset($_POST['create'])) {
        if ($role == 'admin') {
            $password = 'admin'; // Default password for admin
        } else {
            $password = $_POST['password'];

            // Password validation
            if (strlen($password) < 8 || strlen($password) > 16 || 
                !preg_match('/[A-Z]/', $password) || 
                !preg_match('/[a-z]/', $password) || 
                !preg_match('/[0-9]/', $password)) {
                die("Password does not meet the requirements.");
            }
        }

        // Hash the password
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);

        $sql = "INSERT INTO users (username, email, password, company_name, company_address, role) 
                VALUES ('$username', '$email', '$hashed_password', '$company_name', '$company_address', '$role')";

        if ($conn->query($sql) === TRUE) {
            echo "New user created successfully";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    } elseif (isset($_POST['update'])) {
        $id = $_POST['id'];

        if ($role == 'admin') {
            $password = 'admin'; // Default password for admin
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);
            $sql = "UPDATE users SET username='$username', email='$email', password='$hashed_password', company_name='$company_name', company_address='$company_address', role='$role' WHERE id='$id'";
        } else {
            $sql = "UPDATE users SET username='$username', email='$email', company_name='$company_name', company_address='$company_address', role='$role' WHERE id='$id'";
        }

        if ($conn->query($sql) === TRUE) {
            echo "User updated successfully";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    } elseif (isset($_POST['delete'])) {
        $id = $_POST['id'];

        $sql = "DELETE FROM users WHERE id='$id'";

        if ($conn->query($sql) === TRUE) {
            echo "User deleted successfully";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }
}

$sql = "SELECT * FROM users";
$result = $conn->query($sql);

$page_title = "Manage Users";
$page_content = '
    <h1>Manage Users</h1>
    <table>
        <tr>
            <th>Username</th>
            <th>Email</th>
            <th>Company Name</th>  <!-- Changed -->
            <th>Company Address</th>  <!-- Changed -->
            <th>Role</th>
            <th>Actions</th>
        </tr>';

while ($row = $result->fetch_assoc()) {
    $page_content .= '
        <tr>
            <form method="POST" action="manage_users.php">
                <td><input type="text" name="username" value="' . $row['username'] . '"></td>
                <td><input type="email" name="email" value="' . $row['email'] . '"></td>
                <td><input type="text" name="company_name" value="' . $row['company_name'] . '"></td>  <!-- Changed -->
                <td><input type="text" name="company_address" value="' . $row['company_address'] . '"></td>  <!-- Changed -->
                <td>
                    <select name="role">
                        <option value="user" ' . ($row['role'] == 'user' ? 'selected' : '') . '>User</option>
                        <option value="admin" ' . ($row['role'] == 'admin' ? 'selected' : '') . '>Admin</option>
                    </select>
                </td>
                <td>
                    <input type="hidden" name="id" value="' . $row['id'] . '">
                    <input type="password" name="password" placeholder="New Password">
                    <button type="submit" name="update">Update</button>
                    <button type="submit" name="delete">Delete</button>
                </td>
            </form>
        </tr>';
}

$page_content .= '
    </table>
';

include 'template.php';
?>

