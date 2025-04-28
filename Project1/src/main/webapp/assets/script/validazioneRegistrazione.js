document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("formRegistrazione");
    const emailInput = document.getElementById("email");
    const erroreEmail = document.getElementById("errore-email");

    form.addEventListener("submit", async function (event) {
        event.preventDefault(); // Blocca invio iniziale

        const email = emailInput.value.trim();

        // Controllo se la email è già registrata
        const emailValida = await verificaEmail(email);

        if (!emailValida) {
            erroreEmail.textContent = "Email già in uso.";
            emailInput.focus();
        } else {
            erroreEmail.textContent = "";
            form.submit(); // Invia il form solo se la mail è libera
        }
    });

    async function verificaEmail(email) {
        try {
            const response = await fetch(
                `${window.location.origin}${form.getAttribute("action").replace("/servlets/RegistrazioneServlet", "")}/servlets/CheckEmailServlet?email=${encodeURIComponent(email)}`
            );
            const result = await response.text();
            return result.trim() === "OK"; // la servlet deve rispondere con "OK" se l'email è libera
        } catch (error) {
            console.error("Errore nel controllo email:", error);
            return false;
        }
    }
});
