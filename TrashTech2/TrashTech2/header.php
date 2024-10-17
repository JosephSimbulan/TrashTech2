<div id="header">
    <div id="logo">
        <img src="path/to/logo.png" alt="Website Logo">
    </div>
    <div id="logout">
        <a href="logout.php">Logout</a>
    </div>
</div>

<style>
    #header {
        width: 100%;
        background-color: #f8f9fa; /* Modern off-white color */
        padding: 10px 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom: 1px solid #ddd;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Subtle shadow for modern look */
        position: fixed;
        top: 0;
        left: 0;
        z-index: 1000;
        height: 60px; /* Fixed height for the header */
    }
    #logo img {
        height: 40px;
    }
    #logout a {
        text-decoration: none;
        color: #333;
        font-weight: bold;
    }
</style>