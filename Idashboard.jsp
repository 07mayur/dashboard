<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            display: flex;
            height: 100vh;
            margin: 0;
        }
        .navbar {
            background-color: lightgrey;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1;
        }
        .sidebar {
            width: 250px;
            background-color: #343a40;
            color: white;
            display: flex;
            flex-direction: column;
            padding: 20px;
            position: fixed;
            top: 56px; /* Adjusted for the height of the navbar */
            bottom: 0;
            left: 0;
            overflow-y: auto; /* Ensures scroll if content overflows */
        }
        .sidebar a {
            color: white;
            padding: 10px;
            text-decoration: none;
            display: block;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .content {
            flex: 1;
            padding: 20px;
            margin-left: 250px; /* Space for the sidebar */
            margin-top: 56px; /* Adjusted for the height of the navbar */
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light">
        <a class="navbar-brand" href="#">Dashboard</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Settings</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login">Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="sidebar">
        <h2>Sidebar</h2>
        <a href="#" id="showForm">Item</a>
        <a href="#">Sale</a>
        <a href="#">Purchase</a>
        <a href="#">Settings</a>
    </div>

    <div class="content">
        <h2>Welcome to the Dashboard</h2>
        
        <!-- Form to add items -->
        <form id="itemForm" style="display:none;">
            <div class="form-group">
                <label for="itemCode">Item Code</label>
                <input type="text" class="form-control" id="itemCode" name="itemCode" required>
            </div>
            <div class="form-group">
                <label for="itemName">Item Name</label>
                <input type="text" class="form-control" id="itemName" name="itemName" required>
            </div>
            <div class="form-group">
                <label for="itemPrice">Price</label>
                <input type="number" class="form-control" id="itemPrice" name="itemPrice" required>
            </div>
            <div class="form-group">
                <label for="itemQuantity">Quantity</label>
                <input type="number" class="form-control" id="itemQuantity" name="itemQuantity" required>
            </div>
            <button type="submit" class="btn btn-primary">Save</button>
        </form>

<!-- Form to add sales -->
        <form id="saleForm" style="display:;">
            <div class="form-group">
                <label for="cutName">Cut Name</label>
                <input type="text" class="form-control" id="cutName" name="cutName" required>
            </div>
            <div class="form-group">
                <label for="billNo">Bill No</label>
                <input type="text" class="form-control" id="billNo" name="billNo" required>
            </div>
            <div class="form-group">
                <label for="saleItemName">Item Name</label>
                <input type="text" class="form-control" id="saleItemName" name="saleItemName" required>
            </div>
            <div class="form-group">
                <label for="saleItemQuantity">Quantity</label>
                <input type="number" class="form-control" id="saleItemQuantity" name="saleItemQuantity" required>
            </div>
            <div class="form-group">
                <label for="saleItemPrice">Price</label>
                <input type="number" class="form-control" id="saleItemPrice" name="saleItemPrice" required>
            </div>
            <div class="form-group">
                <label for="totalPrice">Total Price</label>
                <input type="number" class="form-control" id="totalPrice" name="totalPrice" readonly>
            </div>
            <button type="submit" class="btn btn-primary">Save</button>
        </form>
        <!-- Existing table displaying products -->
        <table class="table">
            <thead class="thead-light">
                <tr>
                    <th scope="col">Pid</th>
                    <th scope="col">Name</th>
                    <th scope="col">Cost</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Description</th>
                    <th scope="col">Add</th>
                </tr>
            </thead>
            <tbody>
               <%--  <c:forEach var="product" items="${list}">
                    <tr>
                        <th scope="row">${product.pid}</th>
                        <td>${product.itemname}</td>
                        <td>${product.itemcost}</td>
                        <td>${product.quantity}</td>
                        <td>${product.description}</td>
                        <td><button type="button" class="btn btn-primary add-btn" data-pid="${product.pid}" data-itemname="${product.itemname}" data-itemcost="${product.itemcost}" data-quantity="${product.quantity}" data-description="${product.description}">Add</button></td>
                    </tr>
                </c:forEach> --%>
            </tbody>
        </table>
    </div>

    <!-- Bootstrap JS and dependencies (jQuery and Popper.js) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        // Show the form when "Item" link in the sidebar is clicked
        document.getElementById('showForm').addEventListener('click', function() {
            document.getElementById('itemForm').style.display = 'block';
        });

        // Handle add button click in the product table
        document.querySelectorAll('.add-btn').forEach(button => {
            button.addEventListener('click', function() {
                var itemName = this.getAttribute('data-itemname');
                var itemCost = this.getAttribute('data-itemcost');
                var quantity = this.getAttribute('data-quantity');
                var description = this.getAttribute('data-description');

                document.getElementById('itemName').value = itemName;
                document.getElementById('itemPrice').value = itemCost;
                document.getElementById('itemQuantity').value = quantity;
            });
        });
    </script>
</body>
</html>
