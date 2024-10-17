<?php
$current_page = basename($_SERVER['PHP_SELF']);
?>

<div id="sidebar">
    <?php if ($_SESSION['role'] == 'admin'): ?>
        <h2>Admin Menu</h2>
        <ul>
            <li><a href="dashboard.php" class="<?php echo $current_page == 'dashboard.php' ? 'active' : ''; ?>">Dashboard</a></li>
            <li><a href="waste_statistics.php" class="<?php echo $current_page == 'waste_statistics.php' ? 'active' : ''; ?>">Waste Statistics</a></li>
            <li><a href="logs.php" class="<?php echo $current_page == 'logs.php' ? 'active' : ''; ?>">Logs</a></li>
            <li><a href="bin_levels.php" class="<?php echo $current_page == 'bin_levels.php' ? 'active' : ''; ?>">Bin Levels</a></li>
            <li><a href="manage_users.php" class="<?php echo $current_page == 'manage_users.php' ? 'active' : ''; ?>">Manage Users</a></li>
            <li><a href="user_logs.php" class="<?php echo $current_page == 'user_logs.php' ? 'active' : ''; ?>">User Logs</a></li>
            <li><a href="about_us.php" class="<?php echo $current_page == 'about_us.php' ? 'active' : ''; ?>">About Us</a></li>
            <li><a href="faq.php" class="<?php echo $current_page == 'faq.php' ? 'active' : ''; ?>">FAQ</a></li>
        </ul>
    <?php else: ?>
        <h2>User Menu</h2>
        <ul>
            <li><a href="dashboard.php" class="<?php echo $current_page == 'dashboard.php' ? 'active' : ''; ?>">Dashboard</a></li>
            <li><a href="bin_levels.php" class="<?php echo $current_page == 'bin_levels.php' ? 'active' : ''; ?>">Bin Levels</a></li>
            <li><a href="logs.php" class="<?php echo $current_page == 'logs.php' ? 'active' : ''; ?>">Logs</a></li>
            <li><a href="about_us.php" class="<?php echo $current_page == 'about_us.php' ? 'active' : ''; ?>">About Us</a></li>
            <li><a href="faq.php" class="<?php echo $current_page == 'faq.php' ? 'active' : ''; ?>">FAQ</a></li>
        </ul>
    <?php endif; ?>
</div>
