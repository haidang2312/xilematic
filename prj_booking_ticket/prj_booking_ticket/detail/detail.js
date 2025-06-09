
  function addComment() {
    const input = document.getElementById("comment-input");
    const content = input.value.trim();

    if (content === "") {
      alert("Bình luận không được để trống!");
      return;
    }

    const commentSection = document.getElementById("comments-container");

    const commentBox = document.createElement("div");
    commentBox.className = "user-comment";
    commentBox.style = "border-top:1px solid #ccc; padding: 10px 0;";

    const today = new Date();
    const dateString = today.toLocaleDateString("vi-VN");

    const commentId = "comment-" + Date.now();

    commentBox.innerHTML = `
      <div><strong>Khách</strong> <span>★★★★★</span> <span style="font-weight: bold;">10</span></div>
      <p>${content}</p>
      <div style="font-size: 12px; color: gray;">
        ${dateString} | 
        <button onclick="increaseHeart('${commentId}')" style="border: none; background: none; cursor: pointer;">❤️</button> 
        <span id="${commentId}" style="margin-left: 4px;">0</span>
      </div>
    `;

    commentSection.insertBefore(commentBox, commentSection.firstChild);
    input.value = "";
  }

  function toggleCommentSection() {
    const commentSection = document.getElementById("comments-container");
    const toggleButton = document.getElementById("toggle-comments");

    if (commentSection.style.display === "none" || commentSection.style.display === "") {
        commentSection.style.display = "block";
        toggleButton.textContent = "Ẩn bình luận";
        } else {
        commentSection.style.display = "none";
        toggleButton.textContent = "Hiện bình luận";
        }
    }
    function increaseHeart(id) {
    const heartSpan = document.getElementById(id);
    let count = parseInt(heartSpan.textContent);
    heartSpan.textContent = count + 1;
  }
