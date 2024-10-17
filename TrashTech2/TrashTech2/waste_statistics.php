<?php
// waste_statistics.php
include 'db_connection.php';
session_start();

if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

if (!isset($_SESSION['user_id'])) {
    // Handle the case where user_id is not set
    echo "User ID is not set in the session.";
    exit();
}

$user_id = $_SESSION['user_id'];
$sql = "SELECT * FROM waste_statistics WHERE user_id='$user_id'";
$result = $conn->query($sql);

$page_title = "Waste Statistics Page";
$page_content = '
    <h1 style="margin-top: 80px;">Waste Statistics</h1> <!-- Added margin-top for header spacing -->
    <div class="chart-vertical-container">
        <div class="chart-container">
            <canvas id="paperChart"></canvas>
        </div>
        <div class="chart-container">
            <canvas id="plasticChart"></canvas>
        </div>
        <div class="chart-container">
            <canvas id="metalChart"></canvas>
        </div>
        <div class="chart-container">
            <canvas id="glassChart"></canvas>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        const chartConfig = (ctx, label, data) => ({
            type: "bar",
            data: {
                labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                datasets: [{
                    label: label,
                    data: data,
                    backgroundColor: "#D187F5",
                    borderRadius: 5,
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            color: "#333333",
                            font: {
                                family: "Arial, Helvetica, sans-serif",
                                size: 12
                            }
                        },
                        grid: {
                            color: "rgba(0, 0, 0, 0.1)"
                        }
                    },
                    x: {
                        ticks: {
                            color: "#333333",
                            font: {
                                family: "Arial, Helvetica, sans-serif",
                                size: 12
                            }
                        },
                        grid: {
                            display: false
                        }
                    }
                },
                plugins: {
                    legend: {
                        display: true
                    },
                    tooltip: {
                        padding: 10,
                    }
                }
            }
        });

        const paperCtx = document.getElementById("paperChart").getContext("2d");
        const plasticCtx = document.getElementById("plasticChart").getContext("2d");
        const metalCtx = document.getElementById("metalChart").getContext("2d");
        const glassCtx = document.getElementById("glassChart").getContext("2d");

        new Chart(paperCtx, chartConfig(paperCtx, "Paper", [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]));
        new Chart(plasticCtx, chartConfig(plasticCtx, "Plastic", [15, 25, 35, 45, 55, 65, 75, 85, 95, 105, 115, 125]));
        new Chart(metalCtx, chartConfig(metalCtx, "Metal", [20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130]));
        new Chart(glassCtx, chartConfig(glassCtx, "Glass", [25, 35, 45, 55, 65, 75, 85, 95, 105, 115, 125, 135]));
    </script>

    <style>
        /* Body and HTML take full height */
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            box-sizing: border-box;
        }

        /* The layout */
        .layout {
            display: flex;
            height: 100%;
        }

        /* Sidebar styling */
        .sidebar {
            width: 200px;
            background-color: #343a40;
            color: white;
            padding: 20px;
            position: fixed;
            top: 60px; /* Accounts for the header height */
            bottom: 0;
            overflow-y: auto; /* Scrollable sidebar */
        }

        /* Header styling */
        header {
            background-color: #f8f9fa;
            padding: 20px;
            text-align: center;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        /* Main content to handle scrolling */
        .content {
            margin-left: 220px; /* Space for sidebar */
            margin-top: 80px; /* Space for header */
            padding: 20px;
            height: calc(100% - 80px); /* Full height minus header */
            overflow-y: auto;
        }

        /* Vertical chart layout */
        .chart-vertical-container {
            display: flex;
            flex-direction: column;
            gap: 30px;
            padding-top: 20px; /* Added padding to ensure charts start below header */
        }

        .chart-container {
            position: relative;
            height: 300px; /* Ensure this height is adequate for your data */
            width: 100%;
        }

        /* Add overflow to the charts in case the content exceeds the container */
        .chart-container canvas {
            max-height: 100%;
            max-width: 100%;
        }
    </style>
';

include 'template.php';
?>
