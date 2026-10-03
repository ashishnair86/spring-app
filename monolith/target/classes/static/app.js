const TOKEN_KEY = "northstar.jwt";
const tokenField = document.querySelector("#token");
const notice = document.querySelector("#notice");

let token = localStorage.getItem(TOKEN_KEY) || "";
tokenField.value = token;
document.querySelector("#api-origin").textContent = window.location.origin;
setTokenState();

function setNotice(message, kind = "info") {
    notice.textContent = message;
    notice.dataset.kind = kind;
}

function setToken(value) {
    token = value.trim();
    tokenField.value = token;
    if (token) localStorage.setItem(TOKEN_KEY, token);
    else localStorage.removeItem(TOKEN_KEY);
    setTokenState();
}

function getTokenUsername(value) {
    try {
        const payload = value.split(".")[1];
        if (!payload) return "";
        const base64 = payload.replace(/-/g, "+").replace(/_/g, "/");
        const paddedBase64 = base64.padEnd(Math.ceil(base64.length / 4) * 4, "=");
        const bytes = Uint8Array.from(atob(paddedBase64), character => character.charCodeAt(0));
        const username = JSON.parse(new TextDecoder().decode(bytes)).sub;
        return typeof username === "string" ? username : "";
    } catch {
        return "";
    }
}

function setTokenState() {
    const connected = Boolean(token);
    const username = connected ? getTokenUsername(token) : "";
    document.querySelector("#token-state").textContent = connected ? "Token ready" : "Not connected";
    document.querySelector("#token-state").classList.toggle("is-ready", connected);
    document.querySelector("#auth-badge").classList.toggle("is-ready", connected);
    document.querySelector("#identity-name").textContent = username || (connected ? "Unknown token user" : "Not signed in");
    document.querySelector("#sign-out").hidden = !connected;
}

async function request(path, options = {}) {
    if (!token) throw new Error("Sign in or provide a bearer token first.");
    const headers = new Headers(options.headers || {});
    headers.set("Authorization", `Bearer ${token}`);
    const response = await fetch(path, { ...options, headers });
    const body = await response.text();
    if (!response.ok) {
        if (response.status === 401 || response.status === 403) {
            setToken("");
            throw new Error(`Request rejected (${response.status}). Sign in again or check the token.`);
        }
        throw new Error(body || `Request failed (${response.status}).`);
    }
    if (!body) return null;
    try {
        return JSON.parse(body);
    } catch {
        return body;
    }
}

async function authenticate(mode) {
    const form = document.querySelector("#auth-form");
    if (!form.reportValidity()) return;
    const data = new FormData(form);
    const params = new URLSearchParams({ username: data.get("username"), password: data.get("password") });
    const authOptions = {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: params
    };
    try {
        if (mode === "register") {
            const registration = await fetch("/auth/register", authOptions);
            if (!registration.ok) throw new Error((await registration.text()) || `Registration failed (${registration.status}).`);
        }
        const response = await fetch("/auth/login", authOptions);
        if (!response.ok) throw new Error((await response.text()) || `Sign in failed (${response.status}).`);
        setToken(await response.text());
        setNotice(mode === "register" ? "Account created and signed in." : "Signed in. API requests are authorized.", "success");
        await Promise.allSettled([loadStudents(), loadCourses()]);
    } catch (error) {
        setNotice(error.message, "error");
    }
}

function renderRows(target, records, fields) {
    const container = document.querySelector(target);
    container.classList.toggle("empty-state", records.length === 0);
    if (!records.length) {
        container.textContent = "No records yet.";
        return;
    }
    container.replaceChildren(...records.map(record => {
        const row = document.createElement("div");
        row.className = "result-row";
        fields.forEach(([label, key]) => {
            const cell = document.createElement("div");
            cell.className = "result-cell";
            const caption = document.createElement("span");
            caption.className = "result-label";
            caption.textContent = label;
            const value = document.createElement("strong");
            value.textContent = record[key] ?? "—";
            cell.append(caption, value);
            row.append(cell);
        });
        return row;
    }));
}

async function loadStudents() {
    try {
        const students = await request("/students");
        renderRows("#students-results", students, [["ID", "id"], ["NAME", "name"], ["EMAIL", "email"]]);
    } catch (error) {
        setNotice(error.message, "error");
    }
}

async function loadCourses() {
    try {
        const courses = await request("/courses");
        renderRows("#courses-results", courses, [["ID", "id"], ["CODE", "code"], ["TITLE", "title"]]);
    } catch (error) {
        setNotice(error.message, "error");
    }
}

async function submitJson(form, path, onSuccess) {
    const data = Object.fromEntries(new FormData(form));
    try {
        const result = await request(path, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(data)
        });
        form.reset();
        setNotice("Request completed successfully.", "success");
        await onSuccess?.(result);
    } catch (error) {
        setNotice(error.message, "error");
    }
}

document.querySelector("#auth-form").addEventListener("submit", event => {
    event.preventDefault();
    authenticate("login");
});
document.querySelector("#register-button").addEventListener("click", () => authenticate("register"));
document.querySelector("#clear-token").addEventListener("click", () => {
    setToken("");
    setNotice("Token cleared from this browser.");
});
document.querySelector("#sign-out").addEventListener("click", async () => {
    try {
        await request("/auth/logout", { method: "POST" });
        setNotice("Signed out. This token has been revoked.", "success");
    } catch (error) {
        setNotice(`Signed out locally, but server revocation failed: ${error.message}`, "error");
    } finally {
        setToken("");
    }
});
document.querySelector("#use-token").addEventListener("click", () => {
    setToken(tokenField.value);
    setNotice(token ? "Bearer token is ready to use." : "Enter a token first.", token ? "success" : "error");
});
document.querySelector("#refresh-students").addEventListener("click", loadStudents);
document.querySelector("#refresh-courses").addEventListener("click", loadCourses);
document.querySelector("#student-form").addEventListener("submit", event => {
    event.preventDefault();
    submitJson(event.currentTarget, "/students", loadStudents);
});
document.querySelector("#course-form").addEventListener("submit", event => {
    event.preventDefault();
    submitJson(event.currentTarget, "/courses", loadCourses);
});
document.querySelector("#enrollment-query-form").addEventListener("submit", event => {
    event.preventDefault();
    const form = event.currentTarget;
    const params = new URLSearchParams(new FormData(form));
    request(`/enrollments?${params}`).then(result => {
        const output = document.querySelector("#enrollment-query-result");
        output.textContent = JSON.stringify(result, null, 2);
        output.hidden = false;
        setNotice("Enrollment query completed.", "success");
    }).catch(error => setNotice(error.message, "error"));
});
document.querySelector("#enrollment-form").addEventListener("submit", event => {
    event.preventDefault();
    const form = event.currentTarget;
    const data = new URLSearchParams(new FormData(form));
    request(`/enrollments?${data}`, { method: "POST" }).then(result => {
        form.reset();
        const output = document.querySelector("#enrollment-result");
        output.textContent = JSON.stringify(result, null, 2);
        output.hidden = false;
        setNotice("Enrollment created.", "success");
    }).catch(error => setNotice(error.message, "error"));
});