
const API = "http://13.233.208.244:8080";

let token = "";


async function login() {

    const username = document.getElementById("username").value;

    const password = document.getElementById("password").value;

    const response = await fetch(API + "/login", {

        method: "POST",

        headers: {

            "Content-Type": "application/json"

        },

        body: JSON.stringify({

            username: username,

            password: password

        })

    });

    const data = await response.json();

    token = data.token;

    alert("Login Successful");

}



async function loadStudents() {

    const response = await fetch(API + "/students", {

        headers: {

            Authorization: "Bearer " + token

        }

    });

    const students = await response.json();

    const tbody = document.querySelector("#studentsTable tbody");

    tbody.innerHTML = "";

    students.forEach(student => {

        tbody.innerHTML += `

            <tr>

                <td>${student.id}</td>

                <td>${student.name}</td>

                <td>${student.email}</td>

            </tr>

        `;

    });

}



async function addStudent(event) {
    event.preventDefault();

    const response = await fetch(API + "/students", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer " + token
        },
        body: JSON.stringify({
            name: document.getElementById("name").value,
            email: document.getElementById("email").value
        })
    });

    if (!response.ok) {
        alert("Could not add student. Check your login and try again.");
        return;
    }

    event.target.reset();
    alert("Student Added");
    loadStudents();
}

async function addCourse(event) {
    event.preventDefault();

    const response = await fetch(API + "/courses", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer " + token
        },
        body: JSON.stringify({
            code: document.getElementById("courseCode").value,
            title: document.getElementById("courseTitle").value
        })
    });

    if (!response.ok) {
        alert("Could not add course. Check your login and try again.");
        return;
    }

    event.target.reset();
    alert("Course Added");
}
