function displayDetails() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    var role = document.getElementById("role").value;

    document.getElementById("displayUsername").textContent = username;
    document.getElementById("displayPassword").textContent = password;
    document.getElementById("displayRole").textContent = role;

    document.getElementById("details").style.display = "block";
}
