function openModal() {
  const modal = document.getElementById("videoModal");
  const iframe = modal.querySelector("iframe");
  iframe.src = iframe.dataset.src;
  modal.style.display = "block";
}

function closeModal() {
  const modal = document.getElementById("videoModal");
  const iframe = modal.querySelector("iframe");
  modal.style.display = "none";
  iframe.src = "";
}

document.querySelectorAll(".seat").forEach((seat) => {
  seat.addEventListener("click", () => {
    seat.classList.toggle("selecting-seat");
  });
});

let selectedSeats = [];
let totalPrice = 0;
function selectSeat(seat, price) {
  const seatIndex = selectedSeats.indexOf(seat);
  if (seatIndex === -1) {
    selectedSeats.push(seat);
    totalPrice += price;
  } else {
    selectedSeats.splice(seatIndex, 1);
    totalPrice -= price;
  }
  updateTicketInfo();
}
function updateTicketInfo() {
  const seatsDisplay =
    selectedSeats.length > 0 ? selectedSeats.join(", ") : "None";
  document.getElementById("selected-seats").innerText =
    "Seats: " + seatsDisplay;
  document.getElementById("total-price").innerText =
    "Total Price: " + totalPrice + " VND";
  const warningMessage = document.getElementById("warning");
  if (selectedSeats.length === 0) {
    warningMessage.style.display = "block";
  } else {
    warningMessage.style.display = "none";
  }
  document.getElementById("total-price").innerText =
    "Total Price: " + totalPrice + " VND";
}

function submitBooking() {
  const warningMessage = document.getElementById("warning");
  if (selectedSeats.length === 0) {
    warningMessage.style.display = "block";
  } else {
    warningMessage.style.display = "none";
    alert(
      "Booking confirmed for seats: " +
        selectedSeats.join(", ") +
        " with total price: " +
        totalPrice +
        " VND"
    );
  }
}
