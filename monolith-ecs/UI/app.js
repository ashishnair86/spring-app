
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

                <td>${student.course}</td>

                <td>${student.email}</td>

            </tr>

        `;

    });

}



async function addStudent(){

    const name=document.getElementById("name").value;

    const course=document.getElementById("course").value;

    const email=document.getElementById("email").value;

    await fetch(API+"/students",{

        method:"POST",

        headers:{

            "Content-Type":"application/json",
            "Authorization":"Bearer "+token

        },

        body:JSON.stringify({

            name:name,
            course:course,
            email:email

        })

    });

    alert("Student Added");

    loadStudents();

}
